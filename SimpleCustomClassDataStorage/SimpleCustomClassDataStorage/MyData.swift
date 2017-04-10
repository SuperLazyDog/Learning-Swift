//
//  MyData.swift
//  SimpleCustomClassDataStorage
//
//  Created by 徐伟达 on 2017/2/26.
//  Copyright © 2017年 徐伟达. All rights reserved.
//

import Foundation

class MyData: NSObject, NSCoding{
    var valueString: String?
    
    override init() {
        
    }
    required init?(coder aDecoder: NSCoder) {
        valueString = aDecoder.decodeObject(forKey: "valueString") as? String
    }
    func encode(with aCoder: NSCoder) {
        aCoder.encode(valueString, forKey: "valueString")
    }
    
}
