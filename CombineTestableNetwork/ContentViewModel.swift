//
//  ContentViewModel.swift
//  CombineTestableNetwork
//
//  Created by 김인섭 on 10/5/23.
//

import Foundation
import Combine

class ContentViewModel: ObservableObject {
    
    private let userNetwork: UserNetwork
    private var store = Set<AnyCancellable>()
    
    init(userNetwork: UserNetwork = .init(session: URLSession.shared)) {
        self.userNetwork = userNetwork
    }
    
    func didTapButton() {
        
        // MARK: - AnyPublisher -> async/await throws
        Task {
            let result = try? await userNetwork.getUser(username: "insub4067").asyncThrows
            print(result)
        }
        
        // MARK: - AnyPublisher
        userNetwork.getUser(username: "insub4067")
            .receive(on: DispatchQueue.main)
            .sink { completion in
                print(completion)
            } receiveValue: { user in
                print(user)
            }
            .store(in: &store)

    }
}
