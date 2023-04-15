//
//  AssetAddViewController.swift
//  AssetsPortfolio
//
//  Created by WooKoo on 2023/04/14.
//  Copyright © 2023 tuist.io. All rights reserved.
//

import UIKit

final class AssetAddViewController: UIViewController {


  // MARK: UI

  private let backView: UIView = {
    let view = UIView()
    view.backgroundColor = .green
    return view
  }()


  // MARK: View Life Cycle

  override func viewDidLoad() {
    drawView()
  }
}

extension AssetAddViewController {
  private func drawView() {
    addView()
    setConstraints()
  }

  private func addView() {
    view.addSubview(backView)
  }

  private func setConstraints() {
    backView.translatesAutoresizingMaskIntoConstraints = false

    NSLayoutConstraint.activate([
      backView.widthAnchor.constraint(equalToConstant: 150),
      backView.heightAnchor.constraint(equalToConstant: 150),
      backView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      backView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    ])
  }
}
