//
//  ViewController.swift
//  SampleDateStorage
//
//  Created by 徐伟达 on 2017/2/26.
//  Copyright © 2017年 徐伟达. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let userDefaults = UserDefaults.standard
        if let value = userDefaults.string(forKey: "XuWeida") {
            textField.text = value
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tapActionButton(_ sender: Any) {
        let userDefaults = UserDefaults.standard
        userDefaults.set(textField.text, forKey: "XuWeida")
        userDefaults.synchronize()
    }

}

