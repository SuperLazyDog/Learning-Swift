//: Playground - noun: a place where people can play

import UIKit

//2017年4月9日 周日 22:41

var c1 = { () -> Void in
    print("hello")
}
c1()

let c2 = { (a: Int, b: Int) -> Double in
    if b==0 {
        return 0.0
    }
    return Double(a)/Double(b)
}
c2(10,2)

if c2 is (Int, Int) -> Double {
    print("c的类型是(Int, Int) -> Double")
}else {
    print("c的类型我也不知道")
}

var funcTest: (String) -> String
func strTest(yourString str: String) -> String {
    return "我是一个小测试"
}
print(strTest(yourString: ""))
funcTest = strTest
print(funcTest(""))

var optionalFunc: (Int?, Double?) -> String?
var optionalClosure: ((Double?) -> String?)?
typealias MyClosure = (Double) -> Int
typealias MyOplCls = MyClosure?
