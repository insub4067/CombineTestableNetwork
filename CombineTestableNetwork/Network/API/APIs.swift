//
//  APIs.swift
//  SwiftUI-Test
//
//  Created by 김인섭 on 10/4/23.
//

import Foundation

enum APIs {
    enum GitHubAPI: API {
        
        case getUser(String)
        
        var baseUrl: String { "https://api.github.com/" }
        var endpoint: EndPoint {
            switch self {
            case .getUser(let username):
                return EndPoint(
                    baseUrl: baseUrl,
                    path: "users/" + username
                )
            }
        }
    }
}

protocol API {
    var baseUrl: String { get }
    var endpoint: EndPoint { get }
}
