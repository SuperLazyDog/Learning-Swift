//: Playground - noun: a place where people can play

import UIKit

var myTest: Int! = Int("123")
print(myTest)
var myArray: [Int?] = [1, 2]
myArray[0]!

var ta = ("sa", "ikou")
ta.0

func nickname(name: String?, age: Int) -> String {
   /* if let n = name {
        return n + "(\(age))"
    }else {
        return "名無し" + "(\(age))"
    }*/
    /*guard let n = name else {
        return "名無し" + "(\(age))"
    }
    return n + "(\(age))"*/
    let n = name ?? "名無し"
    return n + "(\(age))"
}

print(nickname(name: nil, age: 18))
print(nickname(name: "Xu Weida", age: 18))
var n: String!
print(nickname(name: n, age: 12))

func quote(yourString s: String) -> String! {
    return s != "" ? "「" + s + "」" : nil
}

var myString: String?
if myString == nil {
    print("mystring is nil")
}

var a: Int? = 100
var b: Int! = 200
swap(&a!, &b!)

var sss: String? = nil


