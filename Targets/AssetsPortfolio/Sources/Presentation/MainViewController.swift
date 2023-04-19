//
//  MainViewController.swift
//  AssetsPortfolio
//
//  Created by WooKoo on 2023/04/08.
//  Copyright © 2023 tuist.io. All rights reserved.
//

import UIKit
import CoreData
import Combine

import RxSwift
import RxCocoa

enum Section: CaseIterable {
  case main
}

final class MainViewController: UIViewController {


  // MARK: Properties
  
  private let viewModel = MainViewModel()
  private let disposeBag = DisposeBag()
  private var storeBag = Set<AnyCancellable>()



  // MARK: UI

  private let assetAddButton: UIButton = {
    let button = UIButton()
    button.backgroundColor = .magenta
    button.setTitle("추가하기", for: .normal)
    return button
  }()

  private let mainSumLabel: UILabel = {
    let label = UILabel()
    label.textColor = .blue
    label.text = "10억"
    return label
  }()

  private let assetsImsiView: UIView = {
    let view = UIView()
    view.backgroundColor = .blue
    return view
  }()

  private lazy var assetsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())

  var dataSource: UICollectionViewDiffableDataSource<Section, Assets>!


  // MARK: Initialize

  init() {
    super.init(nibName: nil, bundle: nil)
    view.backgroundColor = .white
  }

  required init?(coder: NSCoder) { fatalError() }


  // MARK: View Life Cycle

  override func viewDidLoad() {
    super.viewDidLoad()
    drawView()
    bindView()
    viewModel.addAssetData()

    setupDataSource()
    viewModel.getAssetsData()
//    assetsCollectionView.collectionViewLayout = createLayout()
  }
}


// MARK: - UI

extension MainViewController {
  private func drawView() {
    addView()
    setConstraints()
  }

  private func addView() {
    [
      assetAddButton,
      mainSumLabel,
      assetsImsiView,
      assetsCollectionView
    ].forEach { view.addSubview($0) }
  }

  private func setConstraints() {
    assetAddButton.translatesAutoresizingMaskIntoConstraints = false
    mainSumLabel.translatesAutoresizingMaskIntoConstraints = false
    assetsImsiView.translatesAutoresizingMaskIntoConstraints = false
    assetsCollectionView.translatesAutoresizingMaskIntoConstraints = false

    NSLayoutConstraint.activate([
      assetAddButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
      assetAddButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -50)
    ])

    NSLayoutConstraint.activate([
      mainSumLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
      mainSumLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
    ])

    NSLayoutConstraint.activate([
      assetsImsiView.topAnchor.constraint(equalTo: mainSumLabel.bottomAnchor, constant: 20),
      assetsImsiView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 16),
      assetsImsiView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -16),
      assetsImsiView.heightAnchor.constraint(equalToConstant: 150)
    ])

    NSLayoutConstraint.activate([
      assetsCollectionView.topAnchor.constraint(equalTo: assetsImsiView.bottomAnchor, constant: 20),
      assetsCollectionView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 16),
      assetsCollectionView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -16),
      assetsCollectionView.heightAnchor.constraint(equalToConstant: 150)
    ])
  }

  func createLayout() -> UICollectionViewLayout {
      let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                           heightDimension: .fractionalHeight(1.0))
      let item = NSCollectionLayoutItem(layoutSize: itemSize)

      let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                            heightDimension: .absolute(44))
      let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       subitems: [item])

      let section = NSCollectionLayoutSection(group: group)

      let layout = UICollectionViewCompositionalLayout(section: section)
      return layout
  }

  func setupDataSource() {
    assetsCollectionView.register(AssetsCollectionViewCell.self, forCellWithReuseIdentifier: "cell")

    dataSource = UICollectionViewDiffableDataSource<Section, Assets>(
      collectionView: self.assetsCollectionView,
      cellProvider: { collectionView, indexPath, element in
        guard let cell = collectionView.dequeueReusableCell(
          withReuseIdentifier: "cell",
          for: indexPath
        ) as? AssetsCollectionViewCell else { preconditionFailure() }

        cell.configureCell(type: element.type!, name: element.name!)

        return cell
      }
    )
  }

  func performQuery(item: [Assets]) {
      var snapshot = NSDiffableDataSourceSnapshot<Section, Assets>()
      snapshot.appendSections([.main])
      snapshot.appendItems(item)
      dataSource.apply(snapshot, animatingDifferences: true)
  }
}


// MARK: - Bind View

extension MainViewController {
  private func bindView() {
    assetAddButton.rx.tap
      .subscribe(with: self, onNext: { owner, _ in
        let addAssetView = AssetAddViewController()
        owner.modalPresentationStyle = .overFullScreen
        owner.present(addAssetView, animated: true)
      })
      .disposed(by: disposeBag)

    viewModel.assetsData
      .sink(receiveValue: { [weak self] in
        self?.performQuery(item: $0)
      })
      .store(in: &storeBag)
  }
}
