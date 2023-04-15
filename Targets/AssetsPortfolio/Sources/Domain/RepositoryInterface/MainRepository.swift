//
//  MainRepository.swift
//  AssetsPortfolio
//
//  Created by WooKoo on 2023/04/15.
//  Copyright © 2023 tuist.io. All rights reserved.
//

import CoreData
import Foundation

protocol MainRepository {
  func getAssetsData(container: NSPersistentContainer)
}
