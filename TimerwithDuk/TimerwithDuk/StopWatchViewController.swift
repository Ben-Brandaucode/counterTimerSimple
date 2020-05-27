//
//  StopWatchViewController.swift
//  TimerwithDuk
//
//  Created by Ben Brandau Brandau on 5/27/20.
//  Copyright © 2020 Ben Brandau Brandau. All rights reserved.
//

import UIKit

class StopWatchViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    
    var time = Timer()
    var isTimerRunning = false
    var counter =  50.8
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func resetButtonTapped(_ sender: Any) {
        counter = 0
    }
    
    @IBAction func pauseButtonTapped(_ sender: Any) {
        resetButton.isEnabled = true
        pauseButton.isEnabled = false
        startButton.isEnabled = true
        
        isTimerRunning = false
        time.invalidate()
        
        
        
    }
   
    
    @IBAction func startButtonTapped(_ sender: Any) {
        if !isTimerRunning{
            time = Timer.scheduledTimer(timeInterval: 0.1, target:self,selector: #selector(runTimer),userInfo: nil, repeats:true)
        
        }
        
        startButton.isEnabled = false
        pauseButton.isEnabled = true
        resetButton.isEnabled = true
    }
    
    //Helper Methods
    @objc func runTimer(){
        counter += 0.1
        let flooredCounter = Int(floor(counter))
        let hour = flooredCounter / 3600
        
        let minute = (flooredCounter%3600) / 60
        var minuteString = "\(minute) "
        if minute < 10 {
            minuteString = "0\(minute)"
        }
        
        let second = (flooredCounter % 3600) % 60
        var secondString = " \(second)"
        if second < 10{
        secondString = "0\(second)"
        }
        
        let decisecond = String(format: " %.1f", counter).components(separatedBy: ".").last!
        
        timerLabel.text = "\(hour) : \(minuteString) : \(secondString).\(decisecond)"
    
    
    }
        

    }
    
    

