//
//  MemoryDetailsViewController.swift
//  CuteFondMemories
//
//  Created by Maryam Chrs on 13/02/2024.
//

import UIKit

@MainActor protocol MemoryDetailsDisplayLogic: AnyObject {
    func displayMainButtonTitle(viewModel: MemoryDetails.MainButtonTitle.ViewModel)
}

@MainActor final class MemoryDetailsViewController: UIViewController, NibLoadable {
    // MARK: - Object lifecycle
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("MemoryDetailsViewController - Initialization using coder Not Allowed.")
    }
    
    @MainActor init() {
        super.init(nibName: MemoryDetailsViewController.nibName, bundle: nil)
        MemoryDetailsLogger.logInit(owner: String(describing: MemoryDetailsViewController.self))
    }
    
    // MARK: - Deinit
    deinit {
        MemoryDetailsLogger.logDeinit(owner: String(describing: MemoryDetailsViewController.self))
    }
    
    // MARK: - Properties
    
    // MARK: Private
    
    // MARK: Public
    var interactor: MemoryDetailsBusinessLogic?
    var router: (NSObjectProtocol & MemoryDetailsRoutingLogic & MemoryDetailsDataPassing)?
    
    // MARK: - Outlets
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var exitButton: UIButton!
    @IBOutlet private weak var titleTextFeild: UITextField!
    @IBOutlet private weak var descriptionTextView: UITextView!
    @IBOutlet private weak var datePiker: UIDatePicker!
    @IBOutlet private weak var mainButton: UIButton!
    @IBOutlet private weak var DescriptionTextViewHeightConstraint: NSLayoutConstraint!
}

// MARK: - View Controller

// MARK: Life Cycle
extension MemoryDetailsViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
}

// MARK: - Methods

// MARK: Private
private extension MemoryDetailsViewController {
    func setupViews() {
        setupDatePickerView()
        setupButtons()
        setupTextField()
        setupTextView()
        setColor()
        setFont()
    }
    
    func setupDatePickerView() {
        datePiker.maximumDate = Date()
        datePiker.date = Date()
    }
    
    func setupButtons() {
        mainButton.layer.borderWidth = 1
        mainButton.layer.cornerRadius = 10
    }
    
    func setupTextField() {
        titleTextFeild.layer.borderWidth = 1
        titleTextFeild.layer.cornerRadius = 10
        titleTextFeild.setLeftPaddingPoints(10)
    }
    
    func setupTextView() {
        descriptionTextView.layer.borderWidth = 1
        descriptionTextView.layer.cornerRadius = 10
        descriptionTextView.delegate = self
        descriptionTextView.textContainerInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        descriptionTextView.adjustUITextViewHeight()
    }
    
    func resizeTxtDescription() {
        let newSize = descriptionTextView.calculateTextDescription()
        UIView.animate(withDuration: 0.3) { [weak self] in
            guard let self else { return }
            self.DescriptionTextViewHeightConstraint.constant = newSize.height
            self.view.setNeedsLayout()
            self.view.layoutIfNeeded()
        }
    }
}

// MARK: Public
extension MemoryDetailsViewController {}

// MARK: - Display Logic
extension MemoryDetailsViewController: MemoryDetailsDisplayLogic {
    func displayMainButtonTitle(viewModel: MemoryDetails.MainButtonTitle.ViewModel) {
        mainButton.setTitle(viewModel.title, for: .normal)
    }
}

// MARK: - Actions
private extension MemoryDetailsViewController {
    
    @IBAction func mainButtonTapped(_ sender: Any) {
        interactor?.mainButtonTapped(request: MemoryDetails.MainButton.Request())
    }
}

// MARK: - UITextViewDelegate
extension MemoryDetailsViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        if textView == descriptionTextView {
            resizeTxtDescription()
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView == descriptionTextView {
            textView.text = textView.text.trimmingCharacters(in: .whitespacesAndNewlines)
            resizeTxtDescription()
        }
    }
}

// MARK: - Appearance
extension MemoryDetailsViewController {
    func setColor() {
        datePiker.tintColor = .black
        mainButton.tintColor = .black
        exitButton.tintColor = .black
        titleTextFeild.layer.borderColor = UIColor.gray.cgColor
        mainButton.layer.borderColor = UIColor.gray.cgColor
        descriptionTextView.layer.borderColor = UIColor.gray.cgColor
    }
    
    func setFont() {
        
    }
}
