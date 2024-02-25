//
//  DashboardPresenter.swift
//  CuteFondMemories
//
//  Created by Maryam Chrs on 11/02/2024.
//

import UIKit
import MapKit

protocol DashboardPresentationLogic {
    func presentFirstlySetup(response: Dashboard.ViewDidLoad.Response) async
    func presentCameraOnLocation(response: Dashboard.DisplayLocation.Response) async
    func presentAnnotation(response: Dashboard.AddingAnnotaion.Response) async
    func presentMemoryDetailsScene(response: Dashboard.MemoryDetailsScene.Response) async
}

final class DashboardPresenter {
    // MARK: - Object lifecycle
    init() {
        DashboardLogger.logInit(owner: String(describing: DashboardPresenter.self))
    }
    
    // MARK: - Deinit
    deinit {
        DashboardLogger.logDeinit(owner: String(describing: DashboardPresenter.self))
    }
    
    // MARK: - Properties
    
    // MARK: Public
    weak var viewController: DashboardDisplayLogic?
}

// MARK: - Methods

// MARK: Private
private extension DashboardPresenter {}

// MARK: Public
extension DashboardPresenter {}

// MARK: - Presentation Logic
extension DashboardPresenter: DashboardPresentationLogic {
    
    func presentFirstlySetup(response: Dashboard.ViewDidLoad.Response) async {
       
    }
    
    func presentCameraOnLocation(response: Dashboard.DisplayLocation.Response) async {
        let viweModel = Dashboard.DisplayLocation.ViewModel(latitude: response.latitude, 
                                                            longitude: response.longitude,
                                                            latitudinalMeters: response.latitudinalMeters, 
                                                            longitudinalMeters: response.longitudinalMeters,
                                                            withAnimation: response.withAnimation)
        await viewController?.displayCameraOnLocation(viewModel: viweModel)
    }
    
    func presentAnnotation(response: Dashboard.AddingAnnotaion.Response) async {
        guard !response.memories.isEmpty else { return }
        let locations: [CLLocationCoordinate2D] = response.memories.map { CLLocationCoordinate2D(latitude: $0.latitude, longitude: $0.longitude) }
        let viewModel = Dashboard.AddingAnnotaion.ViewModel(annotaions: locations)
        await viewController?.displayAnnotations(viewModel: viewModel)
    }
    
    func presentMemoryDetailsScene(response: Dashboard.MemoryDetailsScene.Response) async {
        let viewModel = Dashboard.MemoryDetailsScene.ViewModel(memory: response.memory,
                                                               latitude: response.latitude,
                                                               longitude: response.longitude)
        await viewController?.displayMemoryDetailsScene(viewModel: viewModel)
    }
}
