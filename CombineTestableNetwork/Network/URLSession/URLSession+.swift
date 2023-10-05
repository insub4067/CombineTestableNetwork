//
//  URLSession+.swift
//  SwiftUI-Test
//
//  Created by 김인섭 on 10/4/23.
//

import Foundation
import Combine

extension URLSession: URLSessionable {
    
    static let mockSession = MockURLSession()
    
    func request<T>(_ endpoint: EndPoint) -> AnyPublisher<T, NetworkError> where T : Decodable {
        self.dataTaskPublisher(for: endpoint.urlRequest)
            .tryMap { [weak self] (data, response) -> Data in
                if let error = self?.handleResponse(response) { throw error }
                else { return data }
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { error -> NetworkError in
                guard let error = error as? NetworkError
                else { return NetworkError.unknown }
                return error
            }
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
