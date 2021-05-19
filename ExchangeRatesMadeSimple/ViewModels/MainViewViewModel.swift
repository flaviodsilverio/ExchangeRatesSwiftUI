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

//    init(with currencyProvider: CurrencyProvidable = CurrencyProvider(), and imageProvider: ImageProvidable = ImageProvider()) {
//        self.currencyProvider = currencyProvider
//        self.currencyInformation = nil
//        self.imageProvider = imageProvider
//
//        currencyProvider.allCurrenciesInfo()
//            .sink { completion in
//                switch completion {
//                case .failure(let error):
//                    print(error)
//
//                case .finished:
//                    print(completion)
//                }
//            } receiveValue: { [unowned self] data in
//
//                let publishers = self.process(data, using: self.imageProvider)
//
//                Publishers.MergeMany(publishers)
//                    .sink { error in
//                        print(error)
//                    } receiveValue: { data in
//                        print(data)
//                    }.store(in: &self.cancellables)
//            }
//            .store(in: &self.cancellables)
//    }

    init(with currencyProvider: CurrencyProvidable = CurrencyProvider(), and imageProvider: ImageProvidable = ImageProvider()) {
        self.currencyProvider = currencyProvider
        self.imageProvider = imageProvider

        currencyProvider.allCurrenciesInfo()
            .flatMap {
                output -> Publishers.Sequence<[AnyPublisher<Data, Error>], Never> in
                return self.process(output, using: imageProvider)
            }
            .sink { _ in

            } receiveValue: { value in

            }
            .store(in: &cancellables)

//                if let url = URL(string: item),
//                   let publisher = imageProvider.publisherForImageFrom(url: url) {
//                       return publisher.map { data in
//                         return (data, item)
//                       }.eraseToAnyPublisher()
//                     } else {
//                       return Empty().eraseToAnyPublisher()
//                     }
//                   })
//                   .sink(receiveCompletion: { _ in }, receiveValue: { output in
//                      // output == (Data, Item)
//                    })
//            .sink(receiveCompletion: { error in
//                print(error)
//            }, receiveValue: { data in
//                data.
//            }).store(in: &cancellables)
    }

    func process(_ data: Data, using imageProvider: ImageProvidable) -> Publishers.Sequence<[AnyPublisher<Data, Error>], Never> {
        let object = try! JSONDecoder().decode(CurrencyInformation.self, from: data)

        return object.symbols.map {
            return String($0.key.dropLast())
        }.compactMap {
            return URL(string: "https://www.countryflags.io/\($0)/flat/64.png")
        }.compactMap {
            return imageProvider.publisherForImage(from: $0)
        }.publisher
    }
//
//    func process(_ data: Data, using imageProvider: ImageProvidable) -> [String] {
//        let object = try! JSONDecoder().decode(CurrencyInformation.self, from: data)
//
//        return object.symbols.map {
//            return String($0.key.dropLast())
//        }
//    }

}


