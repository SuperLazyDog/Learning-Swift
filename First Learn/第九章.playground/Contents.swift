//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class Person : CustomStringConvertible {
    let name: String
    var age: Int
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    var description: String {
        return "\(name),\(age)"
    }
    deinit {
        print(("\(name): deinit"))
    }
}

var weida: Person! = Person(name: "weida", age: 22)
print(weida)
var yinyin: Person! = weida
print(yinyin)
print(yinyin === weida)
weida = nil
print(yinyin)
//print(weida)
yinyin = nil

struct DoNothing {
    var array: [Int]
    init(_ a: [Int]) {
        array = a
    }
    
    mutating func trouble(_ x: Int) -> Int {
        array[x] = 0
        return array[x-1]
    }
}

/*var la = [Int](0..<200_0000_0000)
var mon = 0
for x in 1...500 {
    var na = DoNothing(la)
    mon += na.trouble(x)
}*/
class OptionalChainTest {
    var num: Int?
    init(num: Int?) {
        self.num = num
    }
}

var myNum: OptionalChainTest? = OptionalChainTest(num: 12)
if myNum?.num != nil {
    print("ok")
    myNum?.num = 999
}

print((myNum?.num)!)
