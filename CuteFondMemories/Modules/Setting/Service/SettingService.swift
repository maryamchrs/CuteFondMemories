//
//  SettingService.swift
//  CuteFondMemories
//
//  Created by Maryam Chrs on 03/06/2024.
//

import Foundation

protocol SettingServiceProtocol {}

final class SettingService {
    // MARK: - Object lifecycle
    init(httpClient: HTTPClient) {
        SettingLogger.logInit(owner: String(describing: SettingService.self))
	self.httpClient = httpClient
    }
    
    // MARK: - Deinit
    deinit {
        SettingLogger.logDeinit(owner: String(describing: SettingService.self))
    }
    
    // MARK: - Properties
     
    // MARK: Private
    private let httpClient: HTTPClient
}

// MARK: - Methods

// MARK: Public
extension SettingService {
func getSomeDataFromServer() async throws {
//        guard let urlRequest = DashboardEndpoint.something.urlRequest else { return }
//        return try await httpClient.perform(urlRequest)
//    }
}
