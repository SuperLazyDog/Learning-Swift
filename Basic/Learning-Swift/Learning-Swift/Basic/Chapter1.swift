//
//  Chapter1.swift
//  Learning-Swift
//
//  Created by Weida Xu on 2017/8/7.
//  Copyright © 2017年 Weida Xu. All rights reserved.
//

import Foundation

//-------------------------------------------------------
//                       第一章
//-------------------------------------------------------

class Chapter1 {
    //-------------------------------------------------
    //                     属性
    //-------------------------------------------------
    private var doubleNum : Double = 10; //初始化可以用其他类型的字面量
    private let isLearning : Bool; //是否正在学习中，为以后强化做准备
    private var testTarget: [String] = ["one", "two", "three"];
    
    //-------------------------------------------------
    //                    构造函数
    //-------------------------------------------------
    init(isLearning isLearningNow : Bool = true) {
        isLearning = isLearningNow
    }
    
    //-------------------------------------------------
    //                    实例方法
    //-------------------------------------------------
    //---------------------------
    //           测试类型转换与字符
    //---------------------------
    @discardableResult func castTest(num : Int) -> Double {
        let doubleNum : Double = Double(num)
        self.doubleNum = doubleNum;
        return doubleNum;
    }
    
    func showDoubleNum(asInt : Bool = false) -> Void {
        if asInt {
            print(Int(doubleNum));
            return;
        }
        print(doubleNum);
    }
    
}
