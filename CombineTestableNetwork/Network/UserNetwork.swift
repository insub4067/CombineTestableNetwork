//
//  UserNetwork.swift
//  SwiftUI-Test
//
//  Created by 김인섭 on 10/3/23.
//

import Foundation
import Combine

protocol UserNetworkable {
    func getUser(username: String) -> AnyPublisher<User, NetworkError>
}

struct UserNetwork: UserNetworkable {
    
    private let session: URLSessionable
    private let api = APIs.GitHubAPI.self

    init(session: URLSessionable = URLSession.shared) {
        self.session = session
    }
    
    func getUser(username: String) -> AnyPublisher<User, NetworkError> {
        let endpoint = api.getUser(username).endpoint
        return session.request(endpoint)
    }
}
