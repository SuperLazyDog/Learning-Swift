//
//  ViewController.swift
//  myDiv
//
//  Created by 徐伟达 on 2017/2/23.
//  Copyright © 2017年 徐伟达. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var priceField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tap1Action(_ sender: Any) {
        let myString1 = priceField.text! + "1"
        if let price = Int(myString1) {
            priceField.text! = String(price)
        }
        
    }
    @IBAction func tap2Action(_ sender: Any) {
        let myString1 = priceField.text! + "2"
        if let price = Int(myString1) {
            priceField.text! = String(price)
        }

    }
    @IBAction func tap3Action(_ sender: Any) {
        let myString1 = priceField.text! + "3"
        if let price = Int(myString1) {
            priceField.text! = String(price)
        }

    }
    @IBAction func tap4Action(_ sender: Any) {
        let myString1 = priceField.text! + "4"
        if let price = Int(myString1) {
            priceField.text! = String(price)
        }

    }
    @IBAction func tap5Action(_ sender: Any) {
        let myString1 = priceField.text! + "5"
        if let price = Int(myString1) {
            priceField.text! = String(price)
        }

    }
    @IBAction func tap6Action(_ sender: Any) {
        let myString1 = priceField.text! + "6"
        if let price = Int(myString1) {
            priceField.text! = String(price)
        }

    }
    @IBAction func tap7Action(_ sender: Any) {
        let myString1 = priceField.text! + "7"
        if let price = Int(myString1) {
            priceField.text! = String(price)
        }

    }
    @IBAction func tap8Action(_ sender: Any) {
        let myString1 = priceField.text! + "8"
        if let price = Int(myString1) {
            priceField.text! = String(price)
        }

    }
    @IBAction func tap9Action(_ sender: Any) {
        let myString1 = priceField.text! + "9"
        if let price = Int(myString1) {
            priceField.text! = String(price)
        }

    }
    @IBAction func tap0Action(_ sender: Any) {
        let myString1 = priceField.text! + "0"
        if let price = Int(myString1) {
            priceField.text! = String(price)
        }

    }
    @IBAction func tap00Action(_ sender: Any) {
        let myString1 = priceField.text! + "00"
        if let price = Int(myString1) {
            priceField.text = String(price)
        }

    }
    @IBAction func tapCAction(_ sender: Any) {
        priceField.text = "0"
    }
    @IBAction func restart(_ segue: UIStoryboardSegue) {
        priceField.text = "0"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController = segue.destination as!  PercentViewController
        if let price = Int(priceField.text!) {
            viewController.price = price
        }
    }

}

