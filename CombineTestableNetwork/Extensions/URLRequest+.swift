//
//  URLRequest+.swift
//  SwiftUI-Test
//
//  Created by 김인섭 on 10/4/23.
//

import Foundation

extension URLRequest {
    
    func body(_ data: Data?) -> Self {
        var request = self
        request.httpBody = data
        return request
    }
    
    func header(_ header: [String: String]?) -> Self {
        var request = self
        request.allHTTPHeaderFields = header
        return request
    }
    
    func method(_ method: HTTPMethod = .GET) -> Self {
        var request = self
        request.httpMethod = method.rawValue
        return request
    }
}
