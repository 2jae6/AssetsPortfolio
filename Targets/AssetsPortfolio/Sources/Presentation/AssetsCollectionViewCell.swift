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

  let valueLabel: UILabel = {
    let label = UILabel()
    label.backgroundColor = .green
    return label
  }()

  let noteLabel: UILabel = {
    let label = UILabel()
    label.backgroundColor = .brown
    return label
  }()

  let modifyButton: UIButton = {
    let button = UIButton()
    button.backgroundColor = .gray
    return button
  }()

}

extension AssetsCollectionViewCell {
  func configureCell(type: String, name: String, value: CGFloat, note: String) {
    addView()
    setData(type: type, name: name, value: value, note: note)
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

    valueLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      valueLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
      valueLabel.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 4)
    ])

    noteLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      noteLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
      noteLabel.leadingAnchor.constraint(equalTo: valueLabel.trailingAnchor, constant: 4)
    ])

    modifyButton.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      modifyButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
      modifyButton.leadingAnchor.constraint(equalTo: noteLabel.trailingAnchor, constant: 4),
      modifyButton.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -16)
    ])
  }

  private func setData(type: String, name: String, value: CGFloat, note: String) {
    typeLabel.text = type
    nameLabel.text = name
    valueLabel.text = "\(value)"
    noteLabel.text = note
  }
}
