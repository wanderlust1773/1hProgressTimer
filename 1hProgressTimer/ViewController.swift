//
//  ViewController.swift
//  1hProgressTimer
//
//  Created by Wanderlust1773 on 2020/03/28.
//  Copyright © 2020 SOLGI. All rights reserved.
//
//  Maybe this is my 7th try.
//  I'm glad to try but I don't wanna try anymore.

import UIKit
import UserNotifications

class ViewController: UIViewController {

    @IBOutlet weak var progressSlider: UISlider!
    @IBOutlet weak var timeLabel: UILabel!
    
    var time = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeLabel.text = "\(Int(progressSlider.value))'"
        
        /*
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound], completionHandler: {didAllow,Error in })
    *///알람
        
    }
    
    @objc func timeCicle() {
        progressSlider.value -= 1.0
        timeLabel.text = "\(Int(progressSlider.value))'"
      
        
        if progressSlider.value == 0.0 {
            time.invalidate()
            /*
            let zeroAlert = UNMutableNotificationContent()
            zeroAlert.title = "a"
            zeroAlert.subtitle = "a"
            zeroAlert.body = "a"
            zeroAlert.sound = UNNotificationSound.default
                         
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 2, repeats: false)
                         
            let request = UNNotificationRequest(identifier: "timerdone", content: zeroAlert, trigger: trigger)
            
            UNUserNotificationCenter.current().add(request)
            *///알람

        } else{
            print(progressSlider.value)

        }
    }
    
    
    @IBAction func sliderValueChnaged(_ sender: UISlider) {
        let sliderValue:Int = Int(progressSlider.value)
        progressSlider.value = Float(sliderValue)
        timeLabel.text = "\(sliderValue)'"
        print(sliderValue)
        
        if progressSlider.value == 0.0 {
            time.invalidate()
        }
    }
    @IBAction func countdownStart(_ sender: UIButton) {
        time = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timeCicle), userInfo: nil, repeats: true)
    }
    @IBAction func countdownPause(_ sender: UIButton) {
        time.invalidate()
        print("pause:")
        
       
        
    }
    


}

