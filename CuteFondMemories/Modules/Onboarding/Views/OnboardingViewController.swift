//
//  OnboardingViewController.swift
//  CuteFondMemories
//
//  Created by Maryam Chaharsooghi on 28/08/2024.
//

import UIKit

@MainActor protocol OnboardingDisplayLogic: AnyObject {
    func displayDescriptionText(viewModel: Onboarding.ShowDescription.ViewModel)
}

@MainActor
final class OnboardingViewController: UIViewController, Loggable {
    // MARK: - Object lifecycle
    @MainActor init(logger: DefaultLoggerProtocol = Logger()) {
        self.logger = logger
        super.init(nibName: OnboardingViewController.nibName, bundle: nil)
        logInit()
    }
    
    // MARK: - Deinit
    deinit {
        logDeinit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.logger = Logger()
        super.init(coder: aDecoder)
        logInit()
        fatalError("OnboardingViewController - Initialization using coder Not Allowed.")
    }
    
    // MARK: - Properties
    
    // MARK: Private
    
    // MARK: Public
    var interactor: OnboardingBusinessLogic?
    var router: (NSObjectProtocol & OnboardingRoutingLogic & OnboardingDataPassing)?
    private(set) var logger: DefaultLoggerProtocol
    
    // MARK: - Outlets
    @IBOutlet private(set) weak var logoIcon: UIImageView!
    @IBOutlet private(set) weak var descriptionLabel: UILabel!
    @IBOutlet private(set) weak var mainButton: CustomButton!
}

// MARK: - View Controller

// MARK: Life Cycle
extension OnboardingViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setColor()
        setFont()
        
        interactor?.viewDidLoad(request: Onboarding.ViewDidLoad.Request())
    }
}

// MARK: - Methods

// MARK: Private
private extension OnboardingViewController {
    func setupView() {
        mainButton.setDataModel(
            .init(
                style: .normal,
                title: "onboarding_mainButton_title".localize
            )
        )
    }
}

// MARK: Public
extension OnboardingViewController {}

// MARK: - Display Logic
extension OnboardingViewController: OnboardingDisplayLogic {
    func displayDescriptionText(viewModel: Onboarding.ShowDescription.ViewModel) {
        descriptionLabel.attributedText = viewModel.mutableAttributedString
    }
}

// MARK: - Actions
extension OnboardingViewController {}

// MARK: - Appearance
extension OnboardingViewController {
    func setColor() {
        view.backgroundColor = .milky
        descriptionLabel.textColor = .grayOne
    }
    
    func setFont() {
        descriptionLabel.font = .customFont(
            font: .montserrat,
            style: .regular,
            size: .h3
        )
    }
}
