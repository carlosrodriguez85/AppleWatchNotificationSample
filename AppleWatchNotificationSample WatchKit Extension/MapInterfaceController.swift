//
//  MapInterfaceController.swift
//  AppleWatchNotificationSample
//
//  Created by Carlos Rodríguez Domínguez on 16/4/16.
//  Copyright © 2016 Everyware Technologies. All rights reserved.
//

import WatchKit

class MapInterfaceController : WKInterfaceController{
    @IBOutlet var map: WKInterfaceMap!
    
    override func didAppear() {
        super.didAppear()
        
        map.setRegion(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 35.8889515, longitude: -5.3535556), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)))
    }
}