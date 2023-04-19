//
//  MainViewModel.swift
//  AssetsPortfolio
//
//  Created by WooKoo on 2023/04/10.
//  Copyright © 2023 tuist.io. All rights reserved.
//

import CoreData
import Combine
import UIKit

protocol MainViewModelProtocol {

}

final class MainViewModel: MainViewModelProtocol {

  let assetsData = PassthroughSubject<[Assets], Never>()

  // MARK: UseCase

  private let mainUseCase = DefaultMainUseCase()
  var container: NSPersistentContainer!


  func addAssetData() {
//    let assetsData = NSEntityDescription.entity(
//      forEntityName: "Assets",
//      in: self.container.viewContext
//    )
//
//    if let assetsData = assetsData {
//      let data = NSManagedObject(entity: assetsData, insertInto: self.container.viewContext)
//      data.setValue("주식", forKey: "type")
//      data.setValue(15000000, forKey: "value")
//      data.setValue("네이버", forKey: "name")
//      data.setValue("30만원 가즈아", forKey: "note")
//    }
  }

  func saveAssetData() {
//    do {
//      try self.container.viewContext.save()
//    } catch {
//      print(error.localizedDescription)
//    }
  }

  func getAssetsData() -> [Assets] {
    let data = mainUseCase.getAssetsData()
    self.assetsData.send(data)
    return data
  }
}
