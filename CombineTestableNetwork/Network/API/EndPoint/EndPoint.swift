//
//  EndPointable.swift
//  SwiftUI-Test
//
//  Created by 김인섭 on 10/4/23.
//

import Foundation

struct EndPoint {
    
    let baseUrl: String
    let path: String
    let query: [String: String]?
    let method: HTTPMethod
    let body: Data?
    let header: [String: String]?
    
    private var url: URL { URL(string: baseUrl + path)! }
    var urlRequest: URLRequest {
        .init(url: url)
        .body(body)
        .method(method)
        .header(header)
    }
    
    init(
        baseUrl: String,
        path: String,
        query: [String : String]? = nil,
        method: HTTPMethod = .GET,
        body: Data? = nil,
        header: [String: String]? = ["Content-Type": "application/json"]
    ) {
        self.baseUrl = baseUrl
        self.path = path
        self.query = query
        self.method = method
        self.body = body
        self.header = header
    }
}

enum HTTPMethod: String {
    case GET, PUT, POST, DELETE
}
