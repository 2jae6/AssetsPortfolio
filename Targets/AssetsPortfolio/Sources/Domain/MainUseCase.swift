//
//  MainUseCase.swift
//  AssetsPortfolio
//
//  Created by WooKoo on 2023/04/10.
//  Copyright © 2023 tuist.io. All rights reserved.
//

import CoreData
import Foundation

protocol MainUseCase {
  func addAssetsData()
  func fetchAssetData()
  func deleteAssetData()
  func getAssetsData() -> [Assets]
}


final class DefaultMainUseCase: MainUseCase {
  private let repository = DefaultMainRepository()
}

extension DefaultMainUseCase {
  func addAssetsData() {

  }

  func fetchAssetData() {

  }

  func deleteAssetData() {

  }

  func getAssetsData() -> [Assets] {
    repository.getAssetsData()
  }
}
