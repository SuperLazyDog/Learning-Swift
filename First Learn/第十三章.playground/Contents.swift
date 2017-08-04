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


let testInt = { () in
    return 5
}

let testDouble = { () in
    return 5.0
}

let testString = { () in
    return "testString"
}

print(testInt(), testDouble(), testString(), separator: "\n")

func testIntFunc() {
    print(5)
}

/*func testIntFunc() -> () { //返回（）型，也就是不返回任何类型
    print(5)
}

func testIntFunc() -> Void {  //返回Void和（）等价，也是不返回任何类型
    print(5)
}

func func-name(arg-list) -> ret-type {
    statment
}*/


var clos: (Int, Int) -> String = {
    a, b -> String in
    return "\(a)/\(b)"
}


clos = { a, b in
 "\(a)/\(b)"
}

var test_1: (Double, Double) -> Double = { $0 + $1 }
test_1(1.1, 2.2)


let list = ["fig.pdf", "filelist1.swift", "OLD", "sample.swift"]
let slist = list.sorted()
print(list)
print(slist)
let test_2: (String, String) -> Bool = {(a: String, b: String) -> Bool in
        if a.characters.count >= b.characters.count {
            return true
        }else {
            return false
        }
    }
let sorted = list.sorted(by: {(a: String, b: String) -> Bool in
    if a.characters.count >= b.characters.count {
        return true
    }else {
        return false
    }
})
print(sorted)
print(list.sorted())

func compare(strA: String, strB: String) -> Bool {
    if strA.hasPrefix(strB) {
        return false
    }else {
        return true
    }
}

print("func test = \(list.sorted(by: compare))")

func isIncluded(str: String)  -> Bool {
    return str.hasPrefix("sam")
}
list.filter(isIncluded)

let storage = [1, 324, 64564, 125, 789, 91, 77, 12345]//创建测试库
func separate(orignArray: [Int], by filter: (Int) -> Bool) -> (paired: [Int], cantPaired: [Int]) {//分割数组的函数
    var paired: [Int] = []
    var cantPaired: [Int] = []
    for item in orignArray {
        if filter(item) {
            paired.append(item)
        }else {
            cantPaired.append(item)
        }
    }
    return (paired: paired, cantPaired: cantPaired)
}

func getOddNum(num: Int) -> Bool {//判断是否为奇数
    if num%2 != 0 {
        return true
    }else {
        return false
    }
}

func getEvenNum(num: Int) -> Bool {//判断是否为偶数
    if num%2 == 0 {
        return true
    }else {
        return false
    }
}
print("storage: \(storage)\n---------------------------------------------------")
print("getOdd:\n paired: \(separate(orignArray: storage, by: getOddNum).paired)\n cantPaired: \(separate(orignArray: storage, by: getOddNum).cantPaired)")
print("getEven:\n paired: \(separate(orignArray: storage, by: getEvenNum).paired)\n cantPaired: \(separate(orignArray: storage, by: getEvenNum).cantPaired)")

print(storage.map({(intNum: Int) -> String in
    return "\(intNum) OK!"}))

storage.reduce(1, +)