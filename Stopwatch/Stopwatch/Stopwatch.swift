//
//  Stopwatch.swift
//  Stopwatch
//
//  Created by Bryan Tong on 2/21/17.
//  Copyright © 2017 SCZDXFG. All rights reserved.
//

import Foundation

class Stopwatch: AppDelegate {

    /* Used for updooting the time. */
    var minutes: Int = 0
    var seconds: Int = 0
    var milisecs: Int = 0
    var timeStr: String = ""
    
    /* The main update function. */
    func updoot()->String {
        milisecs += 1
        if (milisecs >= 100) {
            seconds += 1
            milisecs = 0
        }
        if (seconds >= 60) {
            minutes += 1
            seconds = 0
        }
        // fraction string?
        
        
        let timeString = String(format: "%02d:%02d.%d", minutes, seconds, milisecs)
        //seconds = seconds.timeIntervalSinceNow
        return timeString
    }

}
