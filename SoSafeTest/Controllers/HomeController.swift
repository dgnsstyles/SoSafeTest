//
//  ViewController.swift
//  SoSafeTest
//
//  Created by David Goren on 01-09-20.
//  Copyright © 2020 David Goren. All rights reserved.
//

import UIKit
import MapKit

class HomeController: UIViewController {
    
// MARK: - Properties
    private let mapView = MKMapView()
    
    private let locationManager = CLLocationManager()
    
    private let searchInputView = SearchInputView()
    private let buscarInputView = BuscarInputView()
    
// MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        enableLocationServices()
        
    }
    
// MARK: - Helpers Functions
        
    func configureUI() {
      configureMapView()
        view.addSubview(searchInputView)
        searchInputView.centerX(inView: view)
        searchInputView.setDimensions(height: 50, width: view.frame.width - 64)
        searchInputView.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
        searchInputView.alpha = 0
        searchInputView.delegate = self
        
        UIView.animate(withDuration: 2) {
            self.searchInputView.alpha = 1
        }
        
        
    }
    
    func configureMapView() {
        view.addSubview(mapView)
        mapView.frame = view.frame
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
    }
    
    func configureBuscarInputView() {
        view.addSubview(buscarInputView)
        buscarInputView.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor, height: 200)
        buscarInputView.alpha = 0
        
        UIView.animate(withDuration: 0.5, animations: {
            self.buscarInputView.alpha = 1
        }) { _ in
            print("DEBUG: Present Table View..")
        }
    }

}

// MARK: - LocationServices

extension HomeController: CLLocationManagerDelegate {
    func enableLocationServices() {
        locationManager.delegate = self
        
        switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
            print("DEBUG: Not determinated")
            locationManager.requestWhenInUseAuthorization()
        case .restricted, .denied:
            break
        case .authorizedAlways:
            print("Authorized")
            locationManager.startUpdatingLocation()
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
        case .authorizedWhenInUse:
            print("Authorized in Use")
            locationManager.requestAlwaysAuthorization()
        @unknown default:
            break
            
        }
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            locationManager.requestAlwaysAuthorization()
        }
    }
}

extension HomeController: SearchInputActivationViewDelegate {
    func presentSearchInputView() {
        searchInputView.alpha = 0
        configureBuscarInputView()
    }
}
