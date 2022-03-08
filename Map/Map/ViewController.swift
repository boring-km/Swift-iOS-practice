//
//  ViewController.swift
//  Map
//
//  Created by kangmin on 2022/03/08.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet var mapView: MKMapView!
    @IBOutlet var locationInfo1: UILabel!
    @IBOutlet var locationInfo2: UILabel!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationInfo1.text = ""
        locationInfo2.text = ""
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        mapView.showsUserLocation = true
    }
    
    func goLocation(latitudeValue: CLLocationDegrees, longitudeValue: CLLocationDegrees, delta span: Double) -> CLLocationCoordinate2D {
        let location = CLLocationCoordinate2DMake(latitudeValue, longitudeValue)
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
        let region = MKCoordinateRegion(center: location, span: spanValue)
        mapView.setRegion(region, animated: true)
        return location
    }
    
    func setAnnotation(latitudeValue: CLLocationDegrees, longitudeValue: CLLocationDegrees, delta span: Double, title strTitle: String, subtitle strSubtitle: String) {
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = goLocation(latitudeValue: latitudeValue, longitudeValue: longitudeValue, delta: span)
        
        annotation.title = strTitle
        annotation.subtitle = strSubtitle
        mapView.addAnnotation(annotation)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last
        _ = goLocation(latitudeValue: (location?.coordinate.latitude)!, longitudeValue: (location?.coordinate.longitude)!, delta: 0.01)
        CLGeocoder().reverseGeocodeLocation(location!, completionHandler: {
            (placeMarks, error) -> Void in
            let pm = placeMarks!.first
            let country = pm!.country
            var address: String = country!
            
            if pm!.locality != nil {
                address += " "
                address += pm!.locality!
            }
            
            self.locationInfo1.text = "현재 위치"
            self.locationInfo2.text = address
        })
        locationManager.stopUpdatingLocation()
    }
    
    @IBAction func changeLocation(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            self.locationInfo1.text = ""
            self.locationInfo2.text = ""
            locationManager.startUpdatingLocation()
        } else if sender.selectedSegmentIndex == 1 {
            setAnnotation(latitudeValue: 37.45077916521662, longitudeValue: 127.12886875659427, delta: 0.1, title: "가천대학교 글로벌캠퍼스", subtitle: "경기도 성남시 수정구 성남대로 1342")
            self.locationInfo1.text = "보고 있는 위치"
            self.locationInfo2.text = "가천대학교 글로벌캠퍼스"
        } else if sender.selectedSegmentIndex == 2 {
            setAnnotation(latitudeValue: 37.70469942413412, longitudeValue: 126.68492611349531, delta: 0.1, title: "웅진씽크빅 본사", subtitle: "경기도 파주시 문발동 535-1")
            self.locationInfo1.text = "보고 있는 위치"
            self.locationInfo2.text = "웅진씽크빅 본사"
        }
    }
    
}

