//
//  RequestClient.swift
//  ExchangeRatesMadeSimple
//
//  Created by Flávio Silvério on 08/05/2021.
//

import Foundation
import Combine

protocol Requestable {
    func make(
        _ request: URLRequest,
        _ decoder: JSONDecoder
    ) -> AnyPublisher<Data, Error>
}

extension Requestable {
    func make(
        _ request: URLRequest,
        _ decoder: JSONDecoder = JSONDecoder()
    ) -> AnyPublisher<Data, Error> {
        make(request, decoder)
    }
}

struct RequestClient: Requestable {
    func make(_ request: URLRequest, _ decoder: JSONDecoder) -> AnyPublisher <Data, Error> {
        return URLSession
            .DataTaskPublisher(request: request, session: .shared)
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
                    throw APIError.unknown
                }
                return data

            }
            .mapError { error in
                if let error = error as? APIError {
                    return error
                } else {
                    return APIError.apiError(description: error.localizedDescription)
                }
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

enum APIError: Error {
    case apiError(description: String?)
    case unknown

    var errorDescription: String? {
        switch self {
        case .unknown:
            return "Unknown error"
        case .apiError(let reason):
            return reason
        }
    }
}

