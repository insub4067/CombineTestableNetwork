//
//  MockURLSession.swift
//  SwiftUI-Test
//
//  Created by 김인섭 on 10/4/23.
//

import Foundation
import Combine

struct MockURLSession: URLSessionable {
    
    func request<T>(_ endpoint: EndPoint) -> AnyPublisher<T, NetworkError> where T : Decodable {
        Empty()
            .eraseToAnyPublisher()
    }
}

enum NetworkMock<T> {
    case success(T), fail(Error)
}
