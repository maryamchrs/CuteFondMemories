//
//  OnboardingPresenter.swift
//  CuteFondMemories
//
//  Created by Maryam Chaharsooghi on 28/08/2024.
//

import UIKit

protocol OnboardingPresentationLogic: AnyObject {
    var viewController: OnboardingDisplayLogic? { get set }
    func presentDescription(response: Onboarding.ShowDescription.Response) async
}

final class OnboardingPresenter {
    // MARK: - Object lifecycle
    init(logger: DefaultLoggerProtocol = Logger()) {
        self.logger = logger
        self.logger.logInit(String(describing: type(of: self)))
    }
    
    // MARK: - Deinit
    deinit {
        logger.logDeinit(String(describing: type(of: self)))
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
        paragraphStyle.minimumLineHeight = 22
        let attributes: [NSAttributedString.Key: Any] = [
            .paragraphStyle: paragraphStyle,
            .font: UIFont.customFont(
                font: .montserrat,
                style: .regular,
                size: .h3
            ),
            .foregroundColor: UIColor.grayOne
        ]
        attributedString.addAttributes(
            attributes,
            range: NSRange(location: 0, length: attributedString.length)
        )
        let viewModel = Onboarding.ShowDescription.ViewModel(mutableAttributedString: attributedString)
        await viewController?.displayDescriptionText(viewModel: viewModel)
    }
}
