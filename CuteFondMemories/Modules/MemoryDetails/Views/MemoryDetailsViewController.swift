//
//  MemoryDetailsViewController.swift
//  CuteFondMemories
//
//  Created by Maryam Chrs on 13/02/2024.
//

import UIKit

protocol MemoryDetailsViewControllerDelegate: AnyObject {
    func memoryAddedSuccessfully()
}

@MainActor protocol MemoryDetailsDisplayLogic: AnyObject {
    func displayMainButtonTitle(viewModel: MemoryDetails.MainButtonTitle.ViewModel)
    func displayPickerImageView(viewModel: MemoryDetails.PickerImageSetup.ViewModel)
    func displaySelectedDate(viewModel: MemoryDetails.DatePicker.ViewModel)
    func displayPrefilledData(viewModel: MemoryDetails.PrefilledData.ViewModel)
    func displayActionSuccess(viewModel: MemoryDetails.ActionWasSuccessful.ViewModel)
    func displayChosenImage(viewModel: MemoryDetails.ChosenImage.ViewModel)
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
    private var imagePicker = UIImagePickerController()
    
    // MARK: Public
    var interactor: MemoryDetailsBusinessLogic?
    var router: (NSObjectProtocol & MemoryDetailsRoutingLogic & MemoryDetailsDataPassing)?
    weak var delegate: MemoryDetailsViewControllerDelegate?
    
    // MARK: - Outlets
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var exitButton: UIButton!
    @IBOutlet private weak var titleTextFeild: UITextField!
    @IBOutlet private weak var descriptionTextView: UITextView!
    @IBOutlet private weak var datePiker: UIDatePicker!
    @IBOutlet private weak var mainButton: UIButton!
    @IBOutlet private weak var DescriptionTextViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet private weak var imageView: UIImageView!
    
}

// MARK: - View Controller

// MARK: Life Cycle
extension MemoryDetailsViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        interactor?.viewDidLoad(request: MemoryDetails.ViewDidLoad.Request())
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
        setupImageView()
        setColor()
        setFont()
    }
    
    func setupDatePickerView() {
        datePiker.datePickerMode = .date
        datePiker.maximumDate = Date()
        datePiker.addTarget(self, action: #selector(handleDateSelection), for: .valueChanged)
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
    
    func setupImageView() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(selectOneImage))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tapGesture)
    }
}

// MARK: Public
extension MemoryDetailsViewController {}

// MARK: - Display Logic
extension MemoryDetailsViewController: MemoryDetailsDisplayLogic {
    func displayMainButtonTitle(viewModel: MemoryDetails.MainButtonTitle.ViewModel) {
        mainButton.setTitle(viewModel.title, for: .normal)
    }
    
    func displayPrefilledData(viewModel: MemoryDetails.PrefilledData.ViewModel) {
        titleTextFeild.text = viewModel.title
        descriptionTextView.text = viewModel.description
        datePiker.date = viewModel.date ?? Date()
        imageView.image = viewModel.image
    }
    
    func displayActionSuccess(viewModel: MemoryDetails.ActionWasSuccessful.ViewModel) {
        delegate?.memoryAddedSuccessfully()
        router?.dismiss()
    }
    
    func displayChosenImage(viewModel: MemoryDetails.ChosenImage.ViewModel) {
        imageView.contentMode = .scaleAspectFit
        imageView.image = viewModel.selectedImage
    }
    
    func displayPickerImageView(viewModel: MemoryDetails.PickerImageSetup.ViewModel) {
        switch viewModel.type {
        case .cameras:
            guard UIImagePickerController.isSourceTypeAvailable(.camera) else { return }
            imagePicker.sourceType = .camera
        case .photos:
            guard UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum) else { return }
            imagePicker.sourceType = .savedPhotosAlbum
        }
        
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
        router?.presentImagePicker(imagePicker)
    }
    
    func displaySelectedDate(viewModel: MemoryDetails.DatePicker.ViewModel) {
        datePiker.date = viewModel.selectedDate
    }
}

// MARK: - Actions
private extension MemoryDetailsViewController {
    
    @objc func handleDateSelection() {
        let request = MemoryDetails.DatePicker.Request(selectedDate: datePiker.date)
        interactor?.datePickerChanged(request: request)
    }
    
    @objc func selectOneImage() {
        showAlert("pick_photo".localize, 
                  message: "chose_One_photo_description".localize,
                  actions: ["photos".localize: .default,
                            "camera".localize: .default,
                            "cancel".localize: .cancel]) { [weak self] action in
            guard let self else { return }
            let request = MemoryDetails.ActionOnAlertView.Request(action: action)
            self.interactor?.oneActionOnAlertViewSelected(request: request)
        }
    }
    
    @IBAction func mainButtonTapped(_ sender: Any) {
        interactor?.mainButtonTapped(request: MemoryDetails.MainButton.Request(title: titleTextFeild.text,
                                                                               description: descriptionTextView.text,
                                                                               date: datePiker.date,
                                                                               image: imageView.image))
    }
    
    @IBAction func closeButtunTapped(_ sender: Any) {
        router?.dismiss()
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

// MARK: -
extension MemoryDetailsViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        
        var newImage: UIImage
        
        if let possibleImage = info[.editedImage] as? UIImage {
            newImage = possibleImage
        } else if let possibleImage = info[.originalImage] as? UIImage {
            newImage = possibleImage
        } else {
            return
        }
        
        interactor?.oneImageSelected(request: MemoryDetails.ChosenImage.Request(selectedImage: newImage))
        router?.dismissImagePickerView()
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
