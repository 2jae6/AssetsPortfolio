//
//  DefaultMainRepository.swift
//  AssetsPortfolio
//
//  Created by WooKoo on 2023/04/15.
//  Copyright © 2023 tuist.io. All rights reserved.
//

import CoreData
import UIKit

final class DefaultMainRepository: MainRepository {


  // MARK: Properties

  let container: NSPersistentContainer = (UIApplication.shared.delegate as! AppDelegate).persistentContainer
}

extension DefaultMainRepository {
  func getAssetsData() -> [Assets] {
    var contact = [Assets]()
    do {
      contact = try container.viewContext.fetch(Assets.fetchRequest()) as! [Assets]
    } catch {
      print(error.localizedDescription)
    }
    return contact
  }

  func saveAssetData() {

  }
}
