//
//  OnboardingPresenter.swift
//  CuteFondMemories
//
//  Created by Maryam Chaharsooghi on 28/08/2024.
//

import UIKit

protocol OnboardingPresentationLogic {
    func presentDescription(response: Onboarding.ShowDescription.Response) async
}

final class OnboardingPresenter: Loggable {
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
    weak var viewController: OnboardingDisplayLogic?
    private(set) var logger: DefaultLoggerProtocol
}

// MARK: - Methods
// MARK: Public
extension OnboardingPresenter {}

// MARK: Private
private extension OnboardingPresenter {}

// MARK: - Presentation Logic
extension OnboardingPresenter: OnboardingPresentationLogic {
    func presentDescription(response: Onboarding.ShowDescription.Response) async {
        let text = response.description
        let attributedString = NSMutableAttributedString(
            string: text
        )
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 10
        attributedString.addAttribute(
            NSAttributedString.Key.paragraphStyle,
            value: paragraphStyle,
            range: .init(location: 0, length: attributedString.length)
        )
        let viewModel = Onboarding.ShowDescription.ViewModel(mutableAttributedString: attributedString)
        await viewController?.displayDescriptionText(viewModel: viewModel)
    }
}
