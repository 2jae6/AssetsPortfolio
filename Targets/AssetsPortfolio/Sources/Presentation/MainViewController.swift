//
//  MainViewController.swift
//  AssetsPortfolio
//
//  Created by WooKoo on 2023/04/08.
//  Copyright © 2023 tuist.io. All rights reserved.
//

import UIKit

final class MainViewController: UIViewController {


  // MARK: UI

  private let mainSumLabel: UILabel = {
    let label = UILabel()
    label.textColor = .blue
    label.text = "10억"
    return label
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

  }
}


// MARK: - UI

extension MainViewController {
  private func drawView() {
    addView()
    setConstraints()
  }

  private func addView() {
    [mainSumLabel].forEach { view.addSubview($0) }

  }

  private func setConstraints() {
    mainSumLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      mainSumLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
      mainSumLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
    ])
  }
}
