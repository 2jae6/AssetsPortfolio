//
//  MainViewModel.swift
//  AssetsPortfolio
//
//  Created by WooKoo on 2023/04/10.
//  Copyright © 2023 tuist.io. All rights reserved.
//

import CoreData

import UIKit

protocol MainViewModelType {

}

final class MainViewModel: MainViewModelType {
  private let mainUseCase = DefaultMainUseCase()
  var container: NSPersistentContainer!

  init() {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    self.container = appDelegate.persistentContainer
  }
  
  // usecase

  func addAssetData() {
    // usecase.dsdgadsfdas
    let assetsData = NSEntityDescription.entity(
      forEntityName: "Assets",
      in: self.container.viewContext
    )

    if let assetsData = assetsData {
      let data = NSManagedObject(entity: assetsData, insertInto: self.container.viewContext)
      data.setValue("주식", forKey: "type")
      data.setValue(15000000, forKey: "value")
      data.setValue("삼성전자", forKey: "name")
      data.setValue("10만원 가즈아", forKey: "note")
    }
  }

  func saveAssetData() {
    do {
      try self.container.viewContext.save()
    } catch {
      print(error.localizedDescription)
    }
  }

  func getAssetsData() {
    mainUseCase.getAssetsData(container: container)
  }
}
