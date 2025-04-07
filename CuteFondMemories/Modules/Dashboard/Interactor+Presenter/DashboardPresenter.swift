//
//  DashboardPresenter.swift
//  CuteFondMemories
//
//  Created by Maryam Chaharsooghi on 11/02/2024.
//

import UIKit
import MapKit

protocol DashboardPresentationLogic: AnyObject {
    var viewController: DashboardDisplayLogic? { get set }
    
    func presentFirstlySetup(response: Dashboard.ViewDidLoad.Response) async
    func presentCameraOnLocation(response: Dashboard.DisplayLocation.Response) async
    func presentAnnotation(response: Dashboard.AddingAnnotation.Response) async
    func presentMemoryDetailsScene(response: Dashboard.MemoryDetailsScene.Response) async
}

final class DashboardPresenter: Loggable {
    // MARK: - Object lifecycle
    init(logger: DefaultLoggerProtocol = Logger()) {
        self.logger = logger
        logInit()
    }
    
    // MARK: - Deinit
    deinit {
        logDeinit()
    }
    
    // MARK: - Properties
    
    // MARK: Public
    weak var viewController: DashboardDisplayLogic?
    private(set) var logger: DefaultLoggerProtocol
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
        let viewModel = Dashboard.DisplayLocation.ViewModel(latitude: response.latitude,
                                                            longitude: response.longitude,
                                                            latitudinalMeters: response.latitudinalMeters, 
                                                            longitudinalMeters: response.longitudinalMeters,
                                                            withAnimation: response.withAnimation)
        await viewController?.displayCameraOnLocation(viewModel: viewModel)
    }
    
    func presentAnnotation(response: Dashboard.AddingAnnotation.Response) async {
        guard !response.memories.isEmpty else { return }
        let locations: [CLLocationCoordinate2D] = response.memories.map {
            CLLocationCoordinate2D(
                latitude: $0.latitude,
                longitude: $0.longitude
            )
        }
        let viewModel = Dashboard.AddingAnnotation.ViewModel(annotations: locations)
        await viewController?.displayAnnotations(viewModel: viewModel)
    }
    
    func presentMemoryDetailsScene(response: Dashboard.MemoryDetailsScene.Response) async {
        let viewModel = Dashboard.MemoryDetailsScene.ViewModel(memory: response.memory,
                                                               latitude: response.latitude,
                                                               longitude: response.longitude)
        await viewController?.displayMemoryDetailsScene(viewModel: viewModel)
    }
}
