//
//  ViewController.swift
//  SimpleCustomClassDataStorage
//
//  Created by 徐伟达 on 2017/2/26.
//  Copyright © 2017年 徐伟达. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let userDefaults = UserDefaults.standard
        let data = MyData()
        data.valueString = "test"
        
        let archiveData = NSKeyedArchiver.archivedData(withRootObject: data)
        userDefaults.set(archiveData, forKey: "data")
        userDefaults.synchronize()
        
        if let storeData = userDefaults.data(forKey: "data") {//.object(forKey: "data") as? Data {
            if let unarchivedData = NSKeyedUnarchiver.unarchiveObject(with: storeData) as? MyData {
                if let valueString = unarchivedData.valueString {
                    print("デシリアサイズデータ：" + valueString)
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

