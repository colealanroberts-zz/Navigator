//
//  NetworkManager.swift
//  Navigator
//
//  Created by Cole Roberts on 7/16/19.
//  Copyright © 2019 Cole Roberts. All rights reserved.
//

import Foundation

enum RequestError: Error {
    case generic
}

class NetworkManager {
    
    // MARK: - Singleton
    
    static let shared: NetworkManager = NetworkManager()
    
    // MARK: - Public
    
    public func simulateAsyncRequest(delay timeDelay: TimeInterval, _ completion: @escaping(Result<Bool, RequestError>) -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + timeDelay) {
            (completion(.success(true)))
        }
    }
}
