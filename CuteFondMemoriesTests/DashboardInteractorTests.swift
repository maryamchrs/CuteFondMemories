//
//  DashboardInteractorTests.swift
//  CuteFondMemories
//
//  Created by Maryam Chrs on 21/02/2024.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

@testable import CuteFondMemories
import XCTest
import Combine
import MapKit

class DashboardInteractorTests: XCTestCase
{
    // MARK: Subject under test
    
    var sut: DashboardInteractor!
    private var cancellables: Set<AnyCancellable>!
    
    // MARK: Test lifecycle
    
    override func setUp()
    {
        super.setUp()
        setupDashboardInteractor()
    }
    
    override func tearDown()
    {
        cancellables = []
        super.tearDown()
    }
    
    // MARK: Test setup
    
    func setupDashboardInteractor()
    {
        sut = DashboardInteractor()
        sut.locationService = LocationServiceSpy()
    }
    
    // MARK: Test doubles
    
    class DashboardPresentationLogicSpy: DashboardPresentationLogic
    {
        var isPresentFirstlySetup: Bool = false
        var isPresentCameraOnLocation: Bool = false
        var isPresentSelectedPlace: Bool = false
        var isPresentMemoryDetailsScene: Bool = false
        
        func presentFirstlySetup(response: CuteFondMemories.Dashboard.ViewDidLoad.Response) async {
            isPresentFirstlySetup = true
        }
        
        func presentCameraOnLocation(response: CuteFondMemories.Dashboard.DisplayLocation.Response) async {
            isPresentCameraOnLocation = true
        }
        
        func presentSelectedPlace(response: CuteFondMemories.Dashboard.AddingAnnotaion.Response) async {
            isPresentSelectedPlace = true
        }
        
        func presentMemoryDetailsScene(response: CuteFondMemories.Dashboard.MemoryDetailsScene.Response) async {
            isPresentMemoryDetailsScene = true
        }
    }
    
    class LocationServiceSpy: LocationServiceProtocol
    {
        var locationPublisher: (AnyPublisher<CLLocationCoordinate2D?, Never>)?
    
        var requestLocationIsCalled: Bool = false
        var stopGettingLocationIsCalled: Bool = false
        
        func requestLocation() {
            requestLocationIsCalled = true
        }
        
        func stopGettingLocation() {
            stopGettingLocationIsCalled = true
        }
    }
    
    // MARK: Tests
    
    func test_viewDidLoad_observerShouldBeCalled()
    {
        // Given
        let spy = LocationServiceSpy()
        spy.requestLocationIsCalled = true
        let request = Dashboard.ViewDidLoad.Request()
        
        // When
        sut.viewDidLoad(request: request)
        
        // Then
        XCTAssertTrue(spy.requestLocationIsCalled,
                      "viewDidLoad(request:) should request to getting user location.")
    }
    
    func test_oneLocationSelected_shouldPresentMemoryDetailsScene() {
        
        // Given
        let spy = DashboardPresentationLogicSpy()
        spy.isPresentMemoryDetailsScene = true
        let request = Dashboard.AddingAnnotaion.Request(selectedLocation: CLLocationCoordinate2D(latitude: Constants.LondonCLLocation2D.latitude, longitude: Constants.LondonCLLocation2D.longitude))
        
        // When
        sut.oneLocationSelected(request: request)
        
        // Then
        XCTAssertTrue(spy.isPresentMemoryDetailsScene,
                      "oneLocationSelected(request:) should navigate user to the DetailsMemory scene.")
    }
    
    func test_addObserver_shouldCallPresentCameraOnLocation() {
        /*
         The idea of this test is to be sure after getting user location with publisher, camera should be updated.*/
        // Given
        let spy = DashboardPresentationLogicSpy()
        spy.isPresentCameraOnLocation = false
        let requset =  Dashboard.ViewDidLoad.Request()
        
        guard let publisher = sut.locationService?.locationPublisher else { return }
        
        // When
        let _ = try? awaitPublisher(publisher)
        sut.viewDidLoad(request: requset)
        
        // Then
        XCTAssertTrue(spy.isPresentCameraOnLocation,
                      "oneLocationSelected(request:) should navigate user to the DetailsMemory scene.")
    }
}
