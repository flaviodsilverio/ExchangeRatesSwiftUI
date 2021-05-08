//
//  MainViewViewModel.swift
//  ExchangeRatesMadeSimple
//
//  Created by Flávio Silvério on 08/05/2021.
//

import Foundation
import Combine

class MainViewViewModel {
    var cancellable: AnyCancellable?
    var cancellables: [AnyCancellable] = []
    let currencyProvider: CurrencyProvidable
    let imageProvider: ImageProvidable

    var currencyInformation: CurrencyInformation?

    init(with currencyProvider: CurrencyProvidable = CurrencyProvider(), and imageProvider: ImageProvidable = ImageProvider()) {
        self.currencyProvider = currencyProvider
        self.currencyInformation = nil
        self.imageProvider = imageProvider

        cancellable = currencyProvider.allCurrenciesInfo()
        .sink { completion in
            switch completion {
            case .failure(let error):
                print(error)

            case .finished:
                print(completion)
            }
        } receiveValue: { data in
            let object = try! JSONDecoder().decode(CurrencyInformation.self, from: data)

            let publishers = object.symbols.map {
                return String($0.key.dropLast())
            }.compactMap {
                return URL(string: "https://www.countryflags.io/\($0)/flat/64.png")
            }.compactMap {
                return imageProvider.imageFrom(url: $0)
            }

            Publishers.MergeMany(publishers).sink { error in
                print(error)
            } receiveValue: { data in
                print(data)
            }.store(in: &self.cancellables)


        }
    }
}
