//
//  LocationDelegate.swift
//  mad2week4
//
//  Created by Daniel Ravindran on 7/1/20.
//  Copyright © 2020 Daniel. All rights reserved.
//

import Foundation
import CoreLocation


class LocationDelegate : NSObject, CLLocationManagerDelegate {

    var locationCallback: ((CLLocation) -> ())? = nil

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
    guard let currentLocation = locations.last else { return }
    locationCallback?(currentLocation)
    }

}
