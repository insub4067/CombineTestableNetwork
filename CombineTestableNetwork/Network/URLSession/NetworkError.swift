//
//  NetworkError.swift
//  SwiftUI-Test
//
//  Created by 김인섭 on 10/4/23.
//

import Foundation

enum NetworkError: Error {
    case badResponse, statusCode(Int), badUrl, unknown
}
