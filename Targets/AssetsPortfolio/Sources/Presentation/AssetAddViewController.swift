//
//  AssetAddViewController.swift
//  AssetsPortfolio
//
//  Created by WooKoo on 2023/04/14.
//  Copyright © 2023 tuist.io. All rights reserved.
//

import UIKit

import RxSwift
import RxCocoa
import RxRelay

final class AssetAddViewController: UIViewController {


  // MARK: Properties

  private let disposeBag = DisposeBag()


  // MARK: UI

  private let backView: UIView = {
    let view = UIView()
    view.backgroundColor = .green
    return view
  }()

  private let closeButton: UIButton = {
    let button = UIButton()
    button.backgroundColor = .red
    return button
  }()

  private let addButton: UIButton = {
    let button = UIButton()
    button.backgroundColor = .black
    return button
  }()


  // MARK: View Life Cycle

  override func viewDidLoad() {
    drawView()
    bindView()
  }
}

extension AssetAddViewController {
  private func drawView() {
    addView()
    setConstraints()
  }

  private func addView() {
    [
      backView,
      closeButton,
      addButton
    ].forEach { view.addSubview($0) }
  }

  private func setConstraints() {
    backView.translatesAutoresizingMaskIntoConstraints = false

    NSLayoutConstraint.activate([
      backView.heightAnchor.constraint(equalToConstant: 250),
      backView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 16),
      backView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -16),
      backView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      backView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    ])

    closeButton.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      closeButton.widthAnchor.constraint(equalToConstant: 24),
      closeButton.heightAnchor.constraint(equalToConstant: 24),
      closeButton.leftAnchor.constraint(equalTo: backView.leftAnchor, constant: 16),
      closeButton.topAnchor.constraint(equalTo: backView.topAnchor, constant: 16)
    ])

    addButton.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      addButton.widthAnchor.constraint(equalToConstant: 24),
      addButton.heightAnchor.constraint(equalToConstant: 24),
      addButton.rightAnchor.constraint(equalTo: backView.rightAnchor, constant: -16),
      addButton.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -16)
    ])
  }
}

extension AssetAddViewController {
  private func bindView() {
    closeButton.rx.tap.asDriver()
      .drive(onNext: { [weak self] in
        self?.dismiss(animated: true)
      })
      .disposed(by: disposeBag)

    addButton.rx.tap.asDriver()
      .drive(onNext: { [weak self] in
        self?.dismiss(animated: true)
      })
      .disposed(by: disposeBag)
  }
}
