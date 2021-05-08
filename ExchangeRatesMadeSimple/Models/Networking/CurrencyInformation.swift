//
//  CurrencyInformation.swift
//  ExchangeRatesMadeSimple
//
//  Created by Flávio Silvério on 08/05/2021.
//

import Foundation

struct CurrencyInformation: Decodable {
    let success: Bool
    let symbols: [String: String]
}
