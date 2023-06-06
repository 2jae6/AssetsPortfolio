//
//  AssetAddViewController.swift
//  AssetsPortfolio
//
//  Created by WooKoo on 2023/04/14.
//  Copyright © 2023 tuist.io. All rights reserved.
//

import UIKit

import Combine
import CombineCocoa

final class AssetAddViewController: UIViewController {


  // MARK: Properties

  private var cancelBag = Set<AnyCancellable>()
  private let viewModel = AssetAddViewModel()


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

  private let typeTitleLabel: UILabel = {
    let label = UILabel()
    label.text = "구분"
    label.backgroundColor = .blue
    return label
  }()
  private let typeTextField: UITextField = {
    let textfield = UITextField()
    textfield.backgroundColor = .white
    return textfield
  }()

  private let nameTitleLabel: UILabel = {
    let label = UILabel()
    label.text = "자산명"
    label.backgroundColor = .blue
    return label
  }()
  private let nameTextField: UITextField = {
    let textfield = UITextField()
    textfield.backgroundColor = .white
    return textfield
  }()

  private let valueTitleLabel: UILabel = {
    let label = UILabel()
    label.text = "가격"
    label.backgroundColor = .blue
    return label
  }()
  private let valueTextField: UITextField = {
    let textfield = UITextField()
    textfield.backgroundColor = .white
    return textfield
  }()

  private let noteTitleLabel: UILabel = {
    let label = UILabel()
    label.text = "비고"
    label.backgroundColor = .blue
    return label
  }()
  private let noteTextField: UITextField = {
    let textfield = UITextField()
    textfield.backgroundColor = .white
    return textfield
  }()


  // MARK: Initialize

  init() {
    super.init(nibName: nil, bundle: nil)
    view.backgroundColor = .clear
  }

  required init?(coder: NSCoder) { fatalError() }


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
      addButton,
      typeTitleLabel,
      typeTextField,
      nameTitleLabel,
      nameTextField,
      valueTitleLabel,
      valueTextField,
      noteTitleLabel,
      noteTextField
    ].forEach { view.addSubview($0) }
  }

  private func setConstraints() {
    backView.translatesAutoresizingMaskIntoConstraints = false

    NSLayoutConstraint.activate([
      backView.heightAnchor.constraint(equalToConstant: 300),
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

    typeTitleLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      typeTitleLabel.leftAnchor.constraint(equalTo: backView.leftAnchor, constant: 16),
      typeTitleLabel.topAnchor.constraint(equalTo: closeButton.bottomAnchor, constant: 20)
    ])

    nameTitleLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      nameTitleLabel.leftAnchor.constraint(equalTo: backView.leftAnchor, constant: 16),
      nameTitleLabel.topAnchor.constraint(equalTo: typeTitleLabel.bottomAnchor, constant: 20)
    ])

    valueTitleLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      valueTitleLabel.leftAnchor.constraint(equalTo: backView.leftAnchor, constant: 16),
      valueTitleLabel.topAnchor.constraint(equalTo: nameTitleLabel.bottomAnchor, constant: 20)
    ])

    noteTitleLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      noteTitleLabel.leftAnchor.constraint(equalTo: backView.leftAnchor, constant: 16),
      noteTitleLabel.topAnchor.constraint(equalTo: valueTitleLabel.bottomAnchor, constant: 20)
    ])

    typeTextField.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      typeTextField.centerYAnchor.constraint(equalTo: typeTitleLabel.centerYAnchor),
      typeTextField.rightAnchor.constraint(equalTo: backView.rightAnchor, constant: -16),
      typeTextField.leftAnchor.constraint(equalTo: typeTitleLabel.rightAnchor, constant: 10)
    ])
    nameTextField.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      nameTextField.centerYAnchor.constraint(equalTo: nameTitleLabel.centerYAnchor),
      nameTextField.leftAnchor.constraint(equalTo: nameTitleLabel.rightAnchor, constant: 10),
      nameTextField.rightAnchor.constraint(equalTo: backView.rightAnchor, constant: -16)
    ])
    valueTextField.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      valueTextField.centerYAnchor.constraint(equalTo: valueTitleLabel.centerYAnchor),
      valueTextField.leftAnchor.constraint(equalTo: valueTitleLabel.rightAnchor, constant: 10),
      valueTextField.rightAnchor.constraint(equalTo: backView.rightAnchor, constant: -16)
    ])
    noteTextField.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      noteTextField.centerYAnchor.constraint(equalTo: noteTitleLabel.centerYAnchor),
      noteTextField.leftAnchor.constraint(equalTo: noteTitleLabel.rightAnchor, constant: 10),
      noteTextField.rightAnchor.constraint(equalTo: backView.rightAnchor, constant: -16)
    ])

  }
}

extension AssetAddViewController {
  private func bindView() {
    closeButton.tapPublisher
      .sink(receiveValue: { [weak self] in
        self?.dismiss(animated: true)
      })
      .store(in: &cancelBag)

    addButton.tapPublisher
      .sink(receiveValue: { [weak self] in
        guard let self = self else { return }
        self.viewModel.saveAssetData(
          typeValue: self.typeTextField.text ?? "없음",
          priceValue: CGFloat(Int(self.valueTextField.text ?? "0")!),
          nameValue: self.nameTextField.text ?? "없음",
          noteValue: self.noteTextField.text ?? "없음"
        )
        //        self?.dismiss(animated: true)
      })
      .store(in: &cancelBag)
  }
}
