//
//  InterfaceController.swift
//  AppleWatchNotificationSample WatchKit Extension
//
//  Created by Carlos Rodríguez Domínguez on 16/4/16.
//  Copyright © 2016 Everyware Technologies. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
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
    
    override func handleActionWithIdentifier(identifier: String?, forLocalNotification localNotification: UILocalNotification) {
        if let identifier = identifier{
            handleAction(identifier)
        }
    }
    
    override func handleActionWithIdentifier(identifier: String?, forRemoteNotification remoteNotification: [NSObject : AnyObject]) {
        if let identifier = identifier{
            handleAction(identifier)
        }
    }

    private func handleAction(identifier:String){
        if identifier == "messageButtonAction"{
            presentTextInputControllerWithSuggestions(["No voy a hacerte caso", "Ahora mismo voy", "Dejame en paz"], allowedInputMode: .AllowAnimatedEmoji, completion: { (reply) in
                //reply message here
                self.dismissTextInputController()
            })
        }
        else if identifier == "mapsButtonAction"{
            presentControllerWithName("mapInterfaceController", context: nil)
        }
    }
}
