//
//  ViewController.swift
//  mySample
//
//  Created by 徐伟达 on 2017/3/17.
//  Copyright © 2017年 徐伟达. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myTestButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func myTestButton(_ sender: Any) {
        //myTestButton.setTitle("ok", for: .normal)
        //myTestButton.isHighlighted = true
    }


}

