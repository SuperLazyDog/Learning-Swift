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

//capture

var globalCount = 0
func maker(_ a: Int, _ b: Int) -> ()->Int {
    var localVar = a
    return { () -> Int in
        globalCount += 1
        localVar += b
        return localVar
    }
}

var m1 = maker(10, 1)
print("m1() = \(m1()), globalCount = \(globalCount)")
print("m1() = \(m1()), globalCount = \(globalCount)")

class Friend {
    let name: String
    init(name: String) {
        self.name = name
    }
    deinit {
        print("deinit", name)
    }
    func sayName() {
        print(name + "です。")
    }
    func sayHello(message: String) {
        print("message", "、\(name)です。")
    }
    func sayHello(to s: String) {
        print(s + "さん、こんにちは。")
    }
    func sayHello(to f: Friend) {
        self.sayHello(to: f.name)
    }
}
