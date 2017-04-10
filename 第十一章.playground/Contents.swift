//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

extension String {
    var length: Int {
        return self.characters.count
    }
}
let myName = "Xu Weida"
print(myName, myName.length)

class TestA {
    let a: Int
    init(a: Int) {
        self.a = a
    }
    final func getNum() -> Int {
        return a
    }
}

class TestB: TestA {
    var b: Int
    init(b: Int) {
        self.b = b
        super.init(a: b+5)
    }
}
let testB = TestB(b: 0)
testB.getNum()
protocol Dateable {
    var year: Int { get }
    var month: Int { get }
    var day: Int { get }
}

func Zeller(_ y: Int, _ m: Int, _ d: Int) -> Int {
    return 1
}

extension Dateable {
    var dayOfWeek: Int {
        return Zeller(year, month, day)
    }
}

struct SimpleDate: Dateable {
    var year: Int
    var month: Int
    var day: Int
    var dayOfWeek: Int  {
        return 2
    }
}
var testC = SimpleDate(year: 2017, month: 3, day: 21)
testC.dayOfWeek


var s: Set<String> = ["XuWeida", "ChenQingyin"]
var e = Set<Int>()
var t = Set<Int>(0...48)

struct MonthAndDay: Hashable, CustomStringConvertible {
    var month, day: Int
    init(_ m: Int, _ d: Int) {
        month = m; day = d
    }
    var hashValue: Int {
        return month*32 + day
    }
    public static func ==(lhs: MonthAndDay, rhs: MonthAndDay) -> Bool {
        return lhs.month == rhs.month && lhs.day == rhs.day
    }
    var description: String {
        return "(\(month), \(day))"
    }
}
var ds: Set<MonthAndDay> = [MonthAndDay(6, 18), MonthAndDay(1, 3), MonthAndDay(4, 16), MonthAndDay(6, 18)]
print(ds)
for i in t {
    print(i,terminator: " ")
}
print()
var emoji1 = Set<String>(["😊", "😄", "😳", "😂", "😘", "😒"])
var emoji2 = Set<String>(["😳", "😂", "😒", "🤗"])
emoji1.contains("😳")
//var emoji3 = emoji1.subtract(emoji2)
//var emoji4 = emoji2.subtract(emoji1)
var emoji5 = emoji1.union(emoji2)
var emoji6 = emoji1.intersection(emoji2)
var emoji7 = emoji1.symmetricDifference(emoji2)
print(emoji1, emoji2, emoji5, emoji6,emoji7, separator: "\n")
//print(emoji3)
//print(emoji4)
//print(emoji5)
emoji1.formUnion(emoji2)
