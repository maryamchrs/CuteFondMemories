//
//  MemoryDetailsService.swift
//  CuteFondMemories
//
//  Created by Maryam Chrs on 13/02/2024.
//

import Foundation

protocol MemoryDetailsServiceProtocol {}

final class MemoryDetailsService {
    // MARK: - Object lifecycle
    init(httpClient: HTTPClient) {
        MemoryDetailsLogger.logInit(owner: String(describing: MemoryDetailsService.self))
	self.httpClient = httpClient
    }
    
    // MARK: - Deinit
    deinit {
        MemoryDetailsLogger.logDeinit(owner: String(describing: MemoryDetailsService.self))
    }
    
    // MARK: - Properties
     
    // MARK: Private
    private let httpClient: HTTPClient
}

// MARK: - Methods

// MARK: Public
extension MemoryDetailsService {
func getSomeDataFromServer() async throws {
//        guard let urlRequest = DashboardEndpoint.something.urlRequest else { return }
//        return try await httpClient.perform(urlRequest)
    }
}
