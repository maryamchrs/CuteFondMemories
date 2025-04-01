//
//  MockOnboardingPresenter.swift
//  CuteFondMemoriesTests
//
//

import Foundation
@testable import CuteFondMemories

final class MockOnboardingPresenter: OnboardingPresentationLogic, MockTrackable {
    
    var viewController: OnboardingDisplayLogic?
    
    enum MethodName: Equatable, Hashable {
        case presentDescription
    }
    
    var calledMethods = Set<MethodName>()
    var methodCallCounts: [MethodName: Int] = [:]
    private(set) var description: String = ""
}

extension MockOnboardingPresenter {
    func presentDescription(response: Onboarding.ShowDescription.Response) async {
        description = response.description
        recordMethodCall(.presentDescription)
    }
}
