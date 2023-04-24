//
//  AssetAddViewModel.swift
//  AssetsPortfolio
//
//  Created by WooKoo on 2023/04/24.
//  Copyright © 2023 tuist.io. All rights reserved.
//

import Foundation

protocol AssetAddViewModelProtocol {

}

final class AssetAddViewModel: AssetAddViewModelProtocol {
  let assetAddUseCase = DefaultAssetAddUseCase()
}

extension AssetAddViewModel {
  func saveAssetData() {
    assetAddUseCase.saveAssetData()
  }
}
