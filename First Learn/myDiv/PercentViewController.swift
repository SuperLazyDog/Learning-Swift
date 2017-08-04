//
//  PercentViewController.swift
//  myDiv
//
//  Created by 徐伟达 on 2017/2/23.
//  Copyright © 2017年 徐伟达. All rights reserved.
//

import UIKit

class PercentViewController: UIViewController {
    var price: Int = 0
    @IBOutlet weak var percentField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func tapCAction(_ sender: Any) {
        percentField.text = "0"
    }
    @IBAction func tap0Action(_ sender: Any) {
        let nowPercent = percentField.text! + "0"
        let perTemp = Int(nowPercent) ?? -1
        if perTemp > 0 {
            percentField.text = String(perTemp)
        }
    }
    @IBAction func tap1Action(_ sender: Any) {
        let nowPercent = percentField.text! + "1"
        let perTemp = Int(nowPercent) ?? -1
        if perTemp > 0 {
            percentField.text = String(perTemp)
        }
    }
    @IBAction func tap2Action(_ sender: Any) {
        let nowPercent = percentField.text! + "2"
        let perTemp = Int(nowPercent) ?? -1
        if perTemp > 0 {
            percentField.text = String(perTemp)
        }
    }
    @IBAction func tap3Action(_ sender: Any) {
        let nowPercent = percentField.text! + "3"
        let perTemp = Int(nowPercent) ?? -1
        if perTemp > 0 {
            percentField.text = String(perTemp)
        }
    }
    @IBAction func tap4Action(_ sender: Any) {
        let nowPercent = percentField.text! + "4"
        let perTemp = Int(nowPercent) ?? -1
        if perTemp > 0 {
            percentField.text = String(perTemp)
        }
    }
    @IBAction func tap5Action(_ sender: Any) {
        let nowPercent = percentField.text! + "5"
        let perTemp = Int(nowPercent) ?? -1
        if perTemp > 0 {
            percentField.text = String(perTemp)
        }
    }
    @IBAction func tap6Action(_ sender: Any) {
        let nowPercent = percentField.text! + "6"
        let perTemp = Int(nowPercent) ?? -1
        if perTemp > 0 {
            percentField.text = String(perTemp)
        }
    }
    @IBAction func tap7Action(_ sender: Any) {
        let nowPercent = percentField.text! + "7"
        let perTemp = Int(nowPercent) ?? -1
        if perTemp > 0 {
            percentField.text = String(perTemp)
        }
    }
    @IBAction func tap8Action(_ sender: Any) {
        let nowPercent = percentField.text! + "8"
        let perTemp = Int(nowPercent) ?? -1
        if perTemp > 0 {
            percentField.text = String(perTemp)
        }
    }
    @IBAction func tap9Action(_ sender: Any) {
        let nowPercent = percentField.text! + "9"
        let perTemp = Int(nowPercent) ?? -1
        if perTemp > 0 {
            percentField.text = String(perTemp)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController = segue.destination as! ResultViewController
        if let percent = Int(percentField.text!) {
            viewController.percent = percent
            viewController.price = price
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
