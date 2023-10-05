//
//  URLSessionable.swift
//  SwiftUI-Test
//
//  Created by 김인섭 on 10/4/23.
//

import Foundation
import Combine

protocol URLSessionable {
    
    func request<T: Decodable>(_ endpoint: EndPoint) -> AnyPublisher<T, NetworkError>
}

extension URLSessionable {
    
    func handleResponse(_ response: URLResponse) -> NetworkError? {
        guard let response = response as? HTTPURLResponse else { return NetworkError.badResponse }
        guard (200...299).contains(response.statusCode) else { return NetworkError.statusCode(response.statusCode) }
        return nil
    }
}
