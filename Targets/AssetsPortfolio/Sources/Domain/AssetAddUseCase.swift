//
//  AssetAddUseCase.swift
//  AssetsPortfolio
//
//  Created by WooKoo on 2023/04/24.
//  Copyright © 2023 tuist.io. All rights reserved.
//

import Foundation

protocol AssetAddUseCase {

}

class DefaultAssetAddUseCase: AssetAddUseCase {

  let repository = DefaultMainRepository()
}

extension DefaultAssetAddUseCase {
  func saveAssetData(
    typeValue: String,
    priceValue: CGFloat,
    nameValue: String,
    noteValue: String
  ) {
    repository.saveAssetData(
      typeValue: typeValue,
      priceValue: priceValue,
      nameValue: nameValue,
      noteValue: noteValue
    )
  }
}
