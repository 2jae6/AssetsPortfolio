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

  func saveAssetData(
    typeValue: String,
    priceValue: CGFloat,
    nameValue: String,
    noteValue: String
  ) {
    let assetsData = NSEntityDescription.entity(
      forEntityName: "Assets",
      in: self.container.viewContext
    )

    if let assetsData = assetsData {
      let data = NSManagedObject(entity: assetsData, insertInto: self.container.viewContext)
      data.setValue(typeValue, forKey: "type")
      data.setValue(priceValue, forKey: "value")
      data.setValue(nameValue, forKey: "name")
      data.setValue(noteValue, forKey: "note")
    }

    do {
      try self.container.viewContext.save()
    } catch {
      print(error.localizedDescription)
    }
  }
}
