//
//  ViewController.swift
//  SampleQuiz
//
//  Created by 徐伟达 on 2017/3/1.
//  Copyright © 2017年 徐伟达. All rights reserved.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func tapSystemSound(_ sender: Any) {
        AudioServicesPlaySystemSound(1000)
    }
    @IBAction func tapCustomSound(_ sender: Any) {
        let soundUrl = Bundle.main.url(forResource: "test", withExtension: "mp3")
        var soundID: SystemSoundID = 0
        AudioServicesCreateSystemSoundID(soundUrl as! CFURL, &soundID)
        AudioServicesPlaySystemSound(soundID)
        
    }
    @IBAction func tapVibrationSound(_ sender: Any) {
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate3)
    }


}

