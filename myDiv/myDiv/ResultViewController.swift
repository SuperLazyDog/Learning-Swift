//
//  ResultViewController.swift
//  myDiv
//
//  Created by 徐伟达 on 2017/2/23.
//  Copyright © 2017年 徐伟达. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    var (price, percent) = (0, 0)
    @IBOutlet weak var resultField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let resPercent = Double(100-percent) / 100.0
        let result = Int(Double(price) * resPercent)
        resultField.text = String(result)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
