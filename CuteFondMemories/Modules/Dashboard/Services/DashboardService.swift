//
//  DashboardService.swift
//  CuteFondMemories
//
//  Created by Maryam Chrs on 11/02/2024.
//

import Foundation

protocol DashboardServiceProtocol {
    // func getSomeDataFromServer() async throws
}
final class DashboardService {
    // MARK: - Object lifecycle
    let httpClient: HTTPClient
    
    init(httpClient: HTTPClient) {
        DashboardLogger.logInit(owner: String(describing: DashboardService.self))
        self.httpClient = httpClient
    }
    
    // MARK: - Deinit
    deinit {
        DashboardLogger.logDeinit(owner: String(describing: DashboardService.self))
    }
    
    // MARK: - Properties
    
    // MARK: Private
    
}

// MARK: - Methods

// MARK: Public
extension DashboardService {
//    func getSomeDataFromServer() async throws {
//        guard let urlRequest = DashboardEndpoint.something.urlRequest else { return }
//        return try await httpClient.perform(urlRequest)
//    }
}
