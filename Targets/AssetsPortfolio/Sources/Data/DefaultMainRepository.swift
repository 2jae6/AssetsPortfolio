//
//  DefaultMainRepository.swift
//  AssetsPortfolio
//
//  Created by WooKoo on 2023/04/15.
//  Copyright © 2023 tuist.io. All rights reserved.
//

import CoreData
import Foundation

final class DefaultMainRepository: MainRepository {
  func getAssetsData(container: NSPersistentContainer) {
    do {
      let contact = try container.viewContext.fetch(Assets.fetchRequest()) as! [Assets]
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
