//
//  NotificationController.swift
//  AppleWatchNotificationSample WatchKit Extension
//
//  Created by Carlos Rodríguez Domínguez on 16/4/16.
//  Copyright © 2016 Everyware Technologies. All rights reserved.
//

import WatchKit
import Foundation


class NotificationController: WKUserNotificationInterfaceController {
    @IBOutlet var alertLabel: WKInterfaceLabel!
    @IBOutlet var map: WKInterfaceMap!

    override init() {
        // Initialize variables here.
        super.init()
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    override func didReceiveLocalNotification(localNotification: UILocalNotification, withCompletion completionHandler: ((WKUserNotificationInterfaceType) -> Void)) {
        // This method is called when a local notification needs to be presented.
        // Implement it if you use a dynamic notification interface.
        // Populate your dynamic notification interface as quickly as possible.
        //
        // After populating your dynamic notification interface call the completion block.
        alertLabel.setText(localNotification.alertBody)
        map.setRegion(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 35.8889515, longitude: -5.3535556), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)))
        
        completionHandler(.Custom)
    }
    
    override func didReceiveRemoteNotification(remoteNotification: [NSObject : AnyObject], withCompletion completionHandler: ((WKUserNotificationInterfaceType) -> Void)) {
        // This method is called when a remote notification needs to be presented.
        // Implement it if you use a dynamic notification interface.
        // Populate your dynamic notification interface as quickly as possible.
        //
        // After populating your dynamic notification interface call the completion block.
        print(remoteNotification)
        
        if let alertContents = remoteNotification["aps"]?["alert"] as? [String:String]{
            if let body = alertContents["body"]{
                alertLabel.setText(body)
            }
        }
        
        map.setRegion(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 35.8889515, longitude: -5.3535556), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)))
        
        completionHandler(.Custom)
    }
}
