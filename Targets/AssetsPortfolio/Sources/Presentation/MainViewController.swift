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

  private let disposeBag = DisposeBag()
  var container: NSPersistentContainer!


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

  private let assetsList: UIView = {
    let view = UIView()
    view.backgroundColor = .blue
    return view
  }()


  // MARK: Initialize

  init() {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    self.container = appDelegate.persistentContainer
    super.init(nibName: nil, bundle: nil)
    view.backgroundColor = .white
  }

  required init?(coder: NSCoder) { fatalError() }


  // MARK: View Life Cycle

  override func viewDidLoad() {
    super.viewDidLoad()
    drawView()



    let assetsData = NSEntityDescription.entity(forEntityName: "Assets", in: self.container.viewContext)

    if let assetsData = assetsData {
        let data = NSManagedObject(entity: assetsData, insertInto: self.container.viewContext)
      data.setValue("주식", forKey: "type")
      data.setValue(15000000, forKey: "value")
      data.setValue("삼성전자", forKey: "name")
      data.setValue("10만원 가즈아", forKey: "note")
    }




    // Save

    do {
      try self.container.viewContext.save()
    } catch {
      print(error.localizedDescription)
    }


    do {
      let contact = try self.container.viewContext.fetch(Assets.fetchRequest()) as! [Assets]
      contact.forEach {
        print($0.type)
        print($0.value)
        print($0.name)
        print($0.note)
      }
    } catch {
      print(error.localizedDescription)
    }
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
      mainSumLabel
    ].forEach { view.addSubview($0) }
  }

  private func setConstraints() {

    mainSumLabel.translatesAutoresizingMaskIntoConstraints = false
    assetAddButton.translatesAutoresizingMaskIntoConstraints = false

    NSLayoutConstraint.activate([
      mainSumLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
      mainSumLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
    ])

    NSLayoutConstraint.activate([
      assetAddButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
      assetAddButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -50)
    ])
  }
}


// MARK: - Bind View

extension MainViewController {
  private func bindView() {
    assetAddButton.rx.tap
      .subscribe(with: self, onNext: { owner, _ in
        // TODO: 자산 추가 다이얼을 띄우기


      })
      .disposed(by: disposeBag)

  }
}
