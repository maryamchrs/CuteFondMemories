//
//  OnboardingFactoryTests.swift
//  CuteFondMemoriesTests
//
//

import Testing
import XCTest
@testable import CuteFondMemories

struct OnboardingInteractorTests {
    
    @Test func init_shouldLogTheInitiationOfClass() throws {
        
        let presenter = MockOnboardingPresenter()
        let worker = DummyOnboardingWorker()
        let logger = MockDefaultLogger()
        
        let sut = OnboardingInteractor(
            presenter: presenter,
            worker: worker,
            logger: logger
        )
        
        try #require(logger.wasMethodCalled(.logInit).wasCalled)
        #expect(logger.wasMethodCalled(.logInit).callCount == 1) // Will not executed
        #expect(logger.className == String(describing: type(of: sut.self))) // Will not executed
    }
    
    @Test("Check ViewDidLoad method")
    func viewDidLoad_shouldCallPresenterWithAppropriateDescription() async {
        
        let presenter = MockOnboardingPresenter()
        let worker = DummyOnboardingWorker()
        let logger = MockDefaultLogger()
        let request = Onboarding.ViewDidLoad.Request()
        let sut: OnboardingInteractor? = OnboardingInteractor(
            presenter: presenter,
            worker: worker,
            logger: logger
        )
        
        sut?.viewDidLoad(request: request)
        await sut?.viewDidLoadTask?.value // Allow async task to complete
        
        let result = presenter.wasMethodCalled(.presentDescription)
        #expect(result.wasCalled)
        #expect(result.callCount == 1)
        #expect(presenter.description == "onboarding_description".localize)
    }
    
    @Test
    func viewDidLoad_whenCalledMultipleTimes_shouldCancelPreviousTask() async {
        // Given
        
        let presenter = MockOnboardingPresenter()
        let worker = DummyOnboardingWorker()
        let logger = MockDefaultLogger()
        let request = Onboarding.ViewDidLoad.Request()
        let sut = OnboardingInteractor(
            presenter: presenter,
            worker: worker,
            logger: logger
        )
        
        var cancelledTasks = 0
        let mockTask = Task {
            try? await Task.sleep(nanoseconds: 500_000_000)
            cancelledTasks += 1
        }
        sut.viewDidLoadTask = mockTask
        
        sut.viewDidLoad(request: request)
        await sut.viewDidLoadTask?.value // Allow async task to complete
        
        #expect(mockTask.isCancelled)
    }
}

//
//
//
//final class OnboardingInteractorXCTests: XCTestCase {
//
//    override func setUp() {}
//
//    override func tearDown() {}
//
//    func test_init_shouldLogTheInitiationOfClass() {
//
//        let presenter = MockOnboardingPresenter()
//        let worker = DummyOnboardingWorker()
//        let logger = MockDefaultLogger()
//
//        let sut = OnboardingInteractor(
//            presenter: presenter,
//            worker: worker,
//            logger: logger
//        )
//
//        XCTAssertTrue(logger.wasMethodCalled(.logInit).wasCalled)
//        XCTAssertEqual(logger.wasMethodCalled(.logInit).callCount, 1)
//        XCTAssertEqual(logger.className, String(describing: type(of: sut.self)))
//    }
//}
