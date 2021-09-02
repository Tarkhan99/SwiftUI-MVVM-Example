//
//  Endpoint+URL.swift
//  SwiftUI-MVVM-Combine
//
//  Created by Tarkhan Tahirov on 30.08.21.
//

import Foundation

extension Endpoint {
   
    var url: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "dummyapi.io"
        components.path = "/data/v1" + path
        components.queryItems = queryItems
        
        guard let url = components.url else {
            preconditionFailure("Invalid URL components: \(components)")
        }
        
        return url
    }
    
    var headers: [String: Any] {
        return [
            "app-id": "612c9ed37e0623323f4b2c68"
        ]
    }
   
}
