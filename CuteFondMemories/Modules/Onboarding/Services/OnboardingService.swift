//
//  OnboardingService.swift
//  CuteFondMemories
//
//  Created by Maryam Chrs on 28/08/2024.
//

import Foundation

protocol OnboardingServiceProtocol {}

final class OnboardingService {
    // MARK: - Object lifecycle
    init(httpClient: HTTPClient) {
        OnboardingLogger.logInit(owner: String(describing: OnboardingService.self))
	self.httpClient = httpClient
    }
    
    // MARK: - Deinit
    deinit {
        OnboardingLogger.logDeinit(owner: String(describing: OnboardingService.self))
    }
    
    // MARK: - Properties
     
    // MARK: Private
    private let httpClient: HTTPClient
}

// MARK: - Methods

// MARK: Public
extension OnboardingService {
    func getSomeDataFromServer() async throws {
        //        guard let urlRequest = DashboardEndpoint.something.urlRequest else { return }
        //        return try await httpClient.perform(urlRequest)
    }
}
