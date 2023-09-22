//
//  Capital.swift
//  Project 16.1
//
//  Created by Nikita on 6.04.23.
//

import UIKit
import MapKit

class Capital: NSObject, MKAnnotation {
    
    var title: String?
    var info: String
    var coordinate: CLLocationCoordinate2D
    
    init(title: String? = nil, coordinate: CLLocationCoordinate2D, info: String) {
        self.title = title
        self.info = info
        self.coordinate = coordinate
    }
}
