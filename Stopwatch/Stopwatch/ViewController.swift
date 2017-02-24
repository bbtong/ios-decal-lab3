//
//  ViewController.swift
//  Stopwatch
//
//  Created by Bryan Tong on 2/21/17.
//  Copyright © 2017 SCZDXFG. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    /* Sets default values when app loads. */
    override func viewDidLoad() {
        super.viewDidLoad()
        //thisStopwatch = Stopwatch()
        // Do any additional
        stopwatchTimerLabel.text = "00:00.00"
        startButton.setImage(UIImage(named: "start.png"), for: UIControlState.normal)
        stopButton.setImage(UIImage(named: "pause.png"), for: UIControlState.normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var thisStopwatch = Stopwatch()

    /* For the 00:00:00 label. */
    @IBOutlet weak var stopwatchTimerLabel: UILabel!
    /* For the Start (also Reset) button on the screen. */
    @IBOutlet weak var startButton: UIButton!
    /* For the Stop (or Pause) button on the screen. */
    @IBOutlet weak var stopButton: UIButton!
    
    let startDate = Date()
    //startDate.timeIntervalSinceNow

    /* Needed to be initialized for my functions. */
    var timer = Timer()
    
    var isStartable: Bool = true
    
    func update2() {
        stopwatchTimerLabel.text = thisStopwatch.updoot()
    }
    
    
    /* Handles Starting and Resetting functions. */
    @IBAction func startAndReset(_ sender: Any) {
        //stopwatchTimerLabel.text = thisStopwatch.timestring

        if (isStartable) {
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self,
                             selector: #selector(ViewController.update2),
                             userInfo: nil,
                             repeats: true)
            
            isStartable = false
            startButton.setImage(UIImage(named: "reset.png"), for: UIControlState.normal)
        } else {
            timer.invalidate()
            thisStopwatch.milisecs = 0;
            thisStopwatch.seconds = 0;
            thisStopwatch.minutes = 0;
            isStartable = true
            startButton.setImage(UIImage(named: "start.png"), for: UIControlState.normal)
        }
        
    }
    
    /* Handles Stopping and Pausing functions. */
    @IBAction func stopAndPause(_ sender: Any) {
        if (isStartable) {
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self,
                                         selector: #selector(ViewController.update2),
                                         userInfo: nil,
                                         repeats: true)
            isStartable = false
            stopButton.setImage(UIImage(named: "pause.png"), for: UIControlState.normal)
        } else {
            timer.invalidate()
            isStartable = true
            stopButton.setImage(UIImage(named: "resume.png"), for: UIControlState.normal)
        }
    }
    
}

