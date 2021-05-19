//
//  Currency.swift
//  ExchangeRatesMadeSimple
//
//  Created by Flávio Silvério on 10/05/2021.
//

import Foundation

typealias Currencies = [Currency]

struct Currency {
    let symbol: String
    let name: String
    var imageData: Data

    init?(with symbol: String, named name: String, thumbnailData imageData: Data?) {
        guard let data = imageData else { return nil }

        self.imageData = data
        self.symbol = symbol
        self.name = name
    }
}
