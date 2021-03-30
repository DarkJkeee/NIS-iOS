//
//  ViewController.swift
//  RouteBuilderApp
//
//  Created by Глеб Бурштейн on 30.03.2021.
//

import CoreLocation
import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    var isSource: Bool = true
    
    @IBOutlet weak var mapView: MKMapView!
    
    let directionsRequest = MKDirections.Request()
    var locationManager: CLLocationManager!
    var myRoute : MKRoute!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.distanceFilter = 10.0
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        view.backgroundColor = .gray
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locationManager.location!
        let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        let region = MKCoordinateRegion(center: location.coordinate, span: span)
        
        // If it first update, we should set a source position.
        // toggle isSource to update only destination every time and therefore build a route.
        if isSource {
            let source = MKPlacemark(coordinate: locationManager.location!.coordinate)
            directionsRequest.source = MKMapItem(placemark: source)
            isSource.toggle()
        }
        
        
        // Destination mark.
        let destination = MKPlacemark(coordinate: location.coordinate)
        directionsRequest.destination = MKMapItem(placemark: destination)
        
        let directions = MKDirections(request: directionsRequest)
        
        directions.calculate(completionHandler: { response, error in
            if error == nil {
                self.myRoute = response!.routes[0] as MKRoute
                self.mapView.addOverlay(self.myRoute.polyline)
            }
        })
        
        // Update view.
        mapView.setRegion(region, animated: true)
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) ->MKOverlayRenderer {
        let myLineRenderer = MKPolylineRenderer(polyline: myRoute.polyline)
        myLineRenderer.strokeColor = UIColor.black
        myLineRenderer.lineWidth = 2
        return myLineRenderer
    }
    
    
}

