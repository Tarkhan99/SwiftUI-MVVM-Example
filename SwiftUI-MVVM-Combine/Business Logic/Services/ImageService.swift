//
//  ImageService.swift
//  SwiftUI-MVVM-Combine
//
//  Created by Tarkhan Tahirov on 30.08.21.
//

import Foundation
import Combine

protocol ImageServiceProtocol {
    var networker: NetworkerProtocol { get }
    
    func getImageData(urlString: String) -> AnyPublisher<Data, Error>
}


final class ImageService: ImageServiceProtocol {
    
    var networker: NetworkerProtocol
    
    init(networker: NetworkerProtocol = Networker()) {
        self.networker = networker
    }
    
    enum ImageLoadError: Error {
        case invalidData
    }
    
    func getImageData(urlString: String) -> AnyPublisher<Data, Error> {
        
        guard let url = URL(string: urlString) else {
            return Fail<Data, Error>(error: NetworkError.invalidURL).eraseToAnyPublisher()
        }
        
        return networker.getData(url: url, headers: [:])
            .mapError({ _ in ImageLoadError.invalidData })
            .eraseToAnyPublisher()
        
    }
    
}
