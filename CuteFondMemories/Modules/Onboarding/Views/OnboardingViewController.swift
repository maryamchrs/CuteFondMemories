//
//  OnboardingViewController.swift
//  CuteFondMemories
//
//  Created by Maryam Chaharsooghi on 28/08/2024.
//

import UIKit

@MainActor protocol OnboardingDisplayLogic: AnyObject {
    var interactor: OnboardingBusinessLogic? { get set }
    var router: OnboardingRoutingLogic? { get set }
    
    func displayDescriptionText(viewModel: Onboarding.ShowDescription.ViewModel)
}

@MainActor
final class OnboardingViewController: UIViewController {
    // MARK: - Object lifecycle
    @MainActor init(logger: DefaultLoggerProtocol = Logger()) {
        self.logger = logger
        super.init(nibName: OnboardingViewController.nibName, bundle: nil)
        self.logger.logInit(String(describing: type(of: self)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.logger = Logger()
        super.init(coder: aDecoder)
        self.logger.logInit(String(describing: type(of: self)))
        fatalError("OnboardingViewController - Initialization using coder Not Allowed.")
    }
    
    deinit {
        logger.logDeinit(String(describing: type(of: self)))
    }
    
    // MARK: - Properties
    
    // MARK: Private
    private(set) var logger: DefaultLoggerProtocol
    // MARK: Public
    var interactor: OnboardingBusinessLogic?
    var router: OnboardingRoutingLogic?
    
    // MARK: - Outlets
    @IBOutlet private(set) weak var logoIcon: UIImageView!
    @IBOutlet private(set) weak var descriptionLabel: UILabel!
    @IBOutlet private(set) weak var mainButton: CustomButton!
}

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

// MARK: Public
extension OnboardingViewController {}

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

// MARK: - Display Logic
extension OnboardingViewController: OnboardingDisplayLogic {
    func displayDescriptionText(viewModel: Onboarding.ShowDescription.ViewModel) {
        descriptionLabel.attributedText = viewModel.mutableAttributedString
    }
}

// MARK: - Actions
private extension OnboardingViewController {
    @IBAction func mainButtonTapped(_ sender: Any) {
        router?.navigateToTabbarViewController()
    }
}

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
