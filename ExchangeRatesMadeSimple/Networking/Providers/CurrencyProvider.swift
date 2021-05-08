//
//  CurrencyProvider.swift
//  ExchangeRatesMadeSimple
//
//  Created by Flávio Silvério on 08/05/2021.
//

import Foundation
import Combine

protocol CurrencyProvidable {
    func allCurrenciesInfo() -> AnyPublisher<Data, Error>
}

struct CurrencyProvider: CurrencyProvidable {
    private let requestClient: Requestable
    var cancellable: AnyCancellable? = nil

    init(with requestClient: Requestable = RequestClient()) {
        self.requestClient = requestClient

    }

    func allCurrenciesInfo() -> AnyPublisher<Data, Error> {
        requestClient.make(URLRequest(url: URL(string: "http://data.fixer.io/api/symbols?access_key=851f84fd3f8332037a9c3de1ad92656f")!))

    }
}

protocol ImageProvidable {
    func imageFrom(url: URL) -> AnyPublisher<Data, Error>
}

struct ImageProvider: ImageProvidable {
    func imageFrom(url: URL) -> AnyPublisher<Data, Error> {
        requestClient.make(URLRequest(url: url))
    }

    private let requestClient: Requestable
    var cancellable: AnyCancellable? = nil

    init(with requestClient: Requestable = RequestClient()) {
        self.requestClient = requestClient

    }
}
