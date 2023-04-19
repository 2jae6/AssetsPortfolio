//
//  AssetsCollectionViewCell.swift
//  AssetsPortfolio
//
//  Created by WooKoo on 2023/04/19.
//  Copyright © 2023 tuist.io. All rights reserved.
//

import UIKit

final class AssetsCollectionViewCell: UICollectionViewCell {

  // MARK: UI

  let typeLabel: UILabel = {
    let label = UILabel()
    label.backgroundColor = .yellow
    return label
  }()

  let nameLabel: UILabel = {
    let label = UILabel()
    label.backgroundColor = .red
    return label
  }()

  let valueLabel = UILabel()
  let noteLabel = UILabel()
  let modifyButton = UIButton()

}

extension AssetsCollectionViewCell {
  func configureCell(type: String, name: String) {
    addView()
    setData(type: type, name: name)
    setConstraints()
  }

  private func addView() {
    [
      typeLabel,
      nameLabel,
      valueLabel,
      noteLabel,
      modifyButton
    ].forEach { contentView.addSubview($0) }
  }

  private func setConstraints() {
    typeLabel.translatesAutoresizingMaskIntoConstraints = false

    NSLayoutConstraint.activate([
      typeLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
      typeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16)
    ])

    nameLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
      nameLabel.leadingAnchor.constraint(equalTo: typeLabel.trailingAnchor, constant: 4)
    ])
  }

  private func setData(type: String, name: String) {
    typeLabel.text = type
    nameLabel.text = name
  }
}
