//
//  UrlComponentExt.swift
//  SwiftUiDeepLink
//
//  Created by Jo on 06/03/2024.
//

import Foundation

extension URLComponents {
    func getQueryDictionary() -> [String: String] {
        return (queryItems ?? []).reduce(into: [:]) { result, queryItem in
            if let value = queryItem.value {
                result[queryItem.name] = value
            }
        }
    }
}
