//
//  Subscriber+.swift
//  SwiftUI-Test
//
//  Created by 김인섭 on 10/3/23.
//

import Foundation
import Combine

extension Subscribers.Completion {
    
    var networkError: NetworkError? {
        guard case let .failure(error) = self,
              let error = error as? NetworkError
        else { return nil }
        return error
    }
}
