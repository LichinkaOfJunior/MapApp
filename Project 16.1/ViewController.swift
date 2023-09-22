//
//  ViewController.swift
//  Project 16.1
//
//  Created by Nikita on 6.04.23.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet var mapView: MKMapView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        
        let london = Capital(title: "London", coordinate: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), info: "Home to the 2012 Summer Olympics.")
        let oslo = Capital(title: "Oslo", coordinate: CLLocationCoordinate2D(latitude: 59.95, longitude: 10.75), info: "Founded over a thousand years ago.")
        let paris = Capital(title: "Paris", coordinate: CLLocationCoordinate2D(latitude: 48.8567, longitude: 2.3508), info: "Often called the City of Light.")
        let rome = Capital(title: "Rome", coordinate: CLLocationCoordinate2D(latitude: 41.9, longitude: 12.5), info: "Has a whole country inside it.")
        let washington = Capital(title: "Washington DC", coordinate: CLLocationCoordinate2D(latitude: 38.895111, longitude: -77.036667), info: "Named after George himself.")
        
        mapView.addAnnotations([london, oslo, paris, rome, washington])
        let types = ["standard", "satellite","hybrid", "satelliteFlyover", "hybridFlyover", "mutedStandard"]
        let ac = UIAlertController(title: "Select a card type", message: """
The type of maps displayed are as follows:
standard: Displays a street map with a lot of details such as roads, buildings, and landmarks.
satellite: Displays a satellite image of the area without any details.
hybrid: Displays a combination of the standard street map and the satellite image.
satelliteFlyover: Displays a 3D view of the area using satellite imagery with a flyover effect.
hybridFlyover: Displays a combination of the 3D satellite view and the standard street map with a flyover effect.
mutedStandard: Displays a muted, simplified version of the standard street map.
""", preferredStyle: .alert)
        
        for type in types {
            ac.addAction(UIAlertAction(title: type, style: .default, handler: mapTypeHandler))
        }
        present(ac, animated: true)

     }
    
    func mapTypeHandler(action: UIAlertAction!) {
        switch action.title {
        case "standard":
            mapView.mapType = .standard
        case "satellite":
            mapView.mapType = .satellite
        case "hybrid":
            mapView.mapType = .hybrid
        case "satelliteFlyover":
            mapView.mapType = .satelliteFlyover
        case "hybridFlyover":
            mapView.mapType = .hybridFlyover
        case "mutedStandard":
            mapView.mapType = .mutedStandard
        default:
            return
        }
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is Capital else { return nil }
        
        let reuseIdentifier = "Capital"
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseIdentifier) as? MKMarkerAnnotationView
        annotationView?.tintColor = UIColor.orange
        if annotationView == nil {
            annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: reuseIdentifier)
            annotationView?.canShowCallout = true
            annotationView?.tintColor = UIColor.green
            
            let btn = UIButton(type: .detailDisclosure)
            annotationView?.rightCalloutAccessoryView = btn
        } else {
            annotationView?.annotation = annotation
        }
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let capital = view.annotation as? Capital else { return }
        
        let WVC = WebViewController()
        
        let placeName = capital.title
        let placeInfo = capital.info
        
        let ac = UIAlertController(title: placeName, message: placeInfo, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Ok", style: .default))
        ac.addAction(UIAlertAction(title: "Wiki Info", style: .default) { _ in
            WVC.urlTown = capital.title
            self.navigationController?.pushViewController(WVC, animated: true)
        })
        present(ac, animated: true)
        
        
        
        
    }


}

