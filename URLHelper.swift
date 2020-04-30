//
//  URLHelper.swift
//  APoDDemo
//
//  Created by Paul Bonamy on 2/26/19.
//  Copyright © 2019 Paul Bonamy. All rights reserved.
//

import Foundation

extension URL {
    func withQueries(_ queries: [String: String]) -> URL? {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = queries.compactMap
            { URLQueryItem(name: $0.0, value: $0.1) }
        return components?.url
    }
    
    
}
