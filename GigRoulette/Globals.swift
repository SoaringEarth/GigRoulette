//
//  Globals.swift
//  GigRoulette
//
//  Created by Ross Patman on 16/06/2017.
//  Copyright © 2017 apple. All rights reserved.
//

import Foundation

enum NotificationName: String {
    case eventsReceived = "EVENTSRECEIVED"
    case journeyReceived = "JOURNEYRECEIVED"
    
    var realName: Notification.Name {
        return Notification.Name(self.rawValue)
    }
}
