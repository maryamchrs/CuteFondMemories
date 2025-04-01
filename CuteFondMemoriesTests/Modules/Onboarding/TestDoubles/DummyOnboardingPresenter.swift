//
//  DummyOnboardingPresenter.swift
//  CuteFondMemoriesTests
//
//  Created by Maryam Chaharsooghi on 01/04/2025.
//

import Foundation
@testable import CuteFondMemories

final class DummyOnboardingPresenter: OnboardingPresentationLogic {
    
    var viewController: OnboardingDisplayLogic?
    func presentDescription(response: CuteFondMemories.Onboarding.ShowDescription.Response) async {}
    
}
