//
//  MainViewController.swift
//  AssetsPortfolio
//
//  Created by WooKoo on 2023/04/08.
//  Copyright © 2023 tuist.io. All rights reserved.
//

import UIKit

import RxSwift
import RxCocoa
import CoreData

final class MainViewController: UIViewController {


  // MARK: Properties
  private let viewModel = MainViewModel()
  private let disposeBag = DisposeBag()
 

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

  private let assetsCollectionView: UITableView = {
    let collectionView = UITableView()
    collectionView.backgroundColor = .brown
    return collectionView
  }()


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

  }
}


// MARK: - UI

extension MainViewController {
  private func drawView() {
    addView()
    setConstraints()
    viewModel.getAssetsData()
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
  }
}
