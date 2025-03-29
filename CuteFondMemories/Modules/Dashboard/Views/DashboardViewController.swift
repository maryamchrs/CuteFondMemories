//
//  DashboardViewController.swift
//  CuteFondMemories
//
//  Created by Maryam Chaharsooghi on 11/02/2024.
//

import UIKit
import MapKit

@MainActor protocol DashboardDisplayLogic: AnyObject {
    func displayCameraOnLocation(viewModel: Dashboard.DisplayLocation.ViewModel)
    func displayAnnotations(viewModel: Dashboard.AddingAnnotation.ViewModel)
    func displayMemoryDetailsScene(viewModel: Dashboard.MemoryDetailsScene.ViewModel)
}

@MainActor final class DashboardViewController: UIViewController, Loggable {
    // MARK: - Object lifecycle
    required init?(coder aDecoder: NSCoder) {
        self.logger = Logger()
        super.init(coder: aDecoder)
        logInit()
        fatalError("DashboardViewController - Initialization using coder Not Allowed.")
    }
    
    @MainActor init(logger: DefaultLoggerProtocol = Logger()) {
        self.logger = logger
        super.init(nibName: DashboardViewController.nibName, bundle: nil)
        logInit()
    }
    
    // MARK: - Deinit
    deinit {
        logDeinit()
    }
    
    // MARK: - Properties
    
    // MARK: Public
    var interactor: DashboardBusinessLogic?
    var router: (NSObjectProtocol & DashboardRoutingLogic & DashboardDataPassing)?
    
    // MARK: Private
    private(set) var logger: DefaultLoggerProtocol
    
    // MARK: - Outlets
    @IBOutlet private weak var mapView: MKMapView!
}

// MARK: Life Cycle
extension DashboardViewController {
    // swiftlint:disable:next unneeded_override
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        interactor?.viewDidLoad(request: Dashboard.ViewDidLoad.Request())
    }
}
// MARK: - Methods

// MARK: Public
extension DashboardViewController {}

// MARK: Private
private extension DashboardViewController {
    func setupViews() {
        setupMap()
        setColor()
        setFont()
    }
    
    func setupMap() {
        mapView.delegate = self
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress))
        mapView.addGestureRecognizer(longPressGesture)
    }
    
    func addAnnotations(markers: [CLLocationCoordinate2D]) {
        // Add a pin at the touched point for demonstration
        mapView.addAnnotations(markers.map {
            let annotation = MKPointAnnotation()
            annotation.coordinate = $0
            return annotation
        })
    }
}

// MARK: - Display Logic
extension DashboardViewController: DashboardDisplayLogic {
    func displayCameraOnLocation(viewModel: Dashboard.DisplayLocation.ViewModel) {
        let location = CLLocationCoordinate2D(latitude: viewModel.latitude, longitude: viewModel.longitude)
        let viewRegion = MKCoordinateRegion(center: location,
                                            latitudinalMeters: viewModel.latitudinalMeters,
                                            longitudinalMeters: viewModel.longitudinalMeters)
        
        mapView.setRegion(viewRegion, animated: viewModel.withAnimation)
    }
    
    func displayAnnotations(viewModel: Dashboard.AddingAnnotation.ViewModel) {
        addAnnotations(markers: viewModel.annotations)
    }
    
    func displayMemoryDetailsScene(viewModel: Dashboard.MemoryDetailsScene.ViewModel) {
        router?.presentMemoryDetailsView(memory: viewModel.memory, 
                                         latitude: viewModel.latitude, 
                                         longitude: viewModel.longitude)
    }
}

// MARK: - Actions
extension DashboardViewController {
    @objc func handleLongPress(gestureReconizer: UILongPressGestureRecognizer) {
        if gestureReconizer.state != .began {
            return
        }
        
        let touchPoint = gestureReconizer.location(in: mapView)
        let coordinate = mapView.convert(touchPoint, 
                                         toCoordinateFrom: mapView)
        let request = Dashboard.AddingAnnotation.Request(selectedLocation: coordinate)
        interactor?.oneLocationSelected(request: request)
    }
}

// MARK: - MKMapViewDelegate
extension DashboardViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, didDeselect annotation: MKAnnotation) {}
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "")
        annotationView.markerTintColor = .green
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        // This method gets called when the user taps on a map annotation.
        // You can retrieve the coordinates of the touched point from the annotation.
        if let annotation = view.annotation {
            let coordinate = annotation.coordinate
            interactor?.oneAnnotationSelected(request: Dashboard.AddingAnnotation.Request(selectedLocation: coordinate))
        }
    }
}
// MARK: - MKMapViewDelegate
extension DashboardViewController: MemoryDetailsViewControllerDelegate {
    func memoryAddedSuccessfully() {
        interactor?.oneMemoryAddedSuccessfully(request: Dashboard.MemoryListUpdated.Request())
    }
}

private extension DashboardViewController {
    func setColor() {}
    
    func setFont() {}
}
