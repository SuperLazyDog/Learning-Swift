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
    //------------------------------------------------------
    //                    1.1 数据类型与变量
    //------------------------------------------------------
    //---------------------------
    //          测试数组
    //---------------------------
    func arrayTest() {
        print("//---------------------------")
        print("//          测试数组")
        print("//---------------------------")
        let arrayA : [Int] = [1, 2, 3, 4, 5];
        print(arrayA);
    }
    
    //---------------------------
    //          测试类型命名
    //---------------------------
    func typeTest() {
        print("//---------------------------")
        print("//          测试类型命名")
        print("//---------------------------")
        typealias MyInt = Int;
        let testNum : MyInt = 1234;
        print("your num: \(testNum)");
    }
    // TODO: 暂略TODO等注释
    
    //------------------------------------------------------
    //                    1.2  控制类语法
    //------------------------------------------------------
    //---------------------------
    //          if
    //---------------------------
    func ifTest(times : Int) {
        print("//---------------------------")
        print("//          if")
        print("//---------------------------")
        let num = times % 4;
        if num == 3 {
            print("num = 3");
        }else if num == 2 {
            print("num == 2");
        }else {
            print("num == 1 | 0")
        }
    }
    //---------------------------
    //          while
    //---------------------------
    func whileTest(times : Int) {
        print("//---------------------------")
        print("//          while")
        print("//---------------------------")
        var i:Int = 0
        while i < times {
            print("i = \(i)")
            i += 1
        }
    }
    //---------------------------
    //       repeat-while
    //---------------------------
    func repeat_whileTest(times : Int) {
        print("//---------------------------")
        print("//       repeat-while")
        print("//---------------------------")
        var i : Int = 0;
        repeat {
            print("i = \(i)")
            i += 1
        } while i < times
    }
    
    //---------------------------
    //         for-in
    //---------------------------
    func for_inTest(times : Int) {
        print("//---------------------------")
        print("//         for-in")
        print("//---------------------------")
        for i in 0..<times where i % 2 == 0 {
            print("i = \(i)")
        }
    }
    //---------------------------
    //          swtich
    //---------------------------
    func switchTest(num : Int) {
        print("//---------------------------")
        print("//          swtich")
        print("//---------------------------")
        switch num {
        case 1 ..< 2:
            print(" 1 <= i < 2")
        default:
            print("other")
            
        }
    }
    /*---------------------------
                标签
    -----------------------------

     没有 goto
     添加方法:
         标签名: if (只能break)
         标签名: for
         标签名: while 等
     
     传送方法:
         break 标签名
         continue 标签名
    ---------------------------*/
}
