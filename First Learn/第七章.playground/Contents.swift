//: Playground - noun: a place where people can play

import UIKit

// 2017 02 17 周五 15:03
var a,b,c: Int?
a = 1; b = a! + 1; c = b! + 1

let test = c ?? b ?? a ?? 0
print(test)

//p158 2017 02 18 周六 04:27
infix operator ~ : RangeFormationPrecedence
func ~ (n: Int, w: Int) -> String {
    var str = String(n)
    let pad = w - str.characters.count
    if pad > 0 {
        str = String(repeating: " ", count: pad) + str
    }
    return str
}

postfix operator %

postfix func % (n: Int) -> Double {
    return 0.01 * Double(n)
}

postfix func % (d: Double) -> Double {
    return 0.01 * d
}

var price: Double = 760
print(price * 85% * 108%)

infix operator >?: AssignmentPrecedence

@discardableResult
func >?(lhs: inout Double, rhs: Double) -> Double{
    if lhs < rhs {
        lhs = rhs
    }
    return lhs
}

var a_myDouble: Double = 198
print(a_myDouble >? 222)

prefix operator ~!
@discardableResult
prefix func ~! (n: inout Int) -> Int {
    n = -n
    return n
}
var n = 8

enum Suit : String {
    case spade, club, diamond, heart
}

func ~=(m: Suit, str: String) -> Bool {
    let low = str.lowercased()
    return m.rawValue.hasPrefix(low)
}
print(Suit.club ~= "club")

infix operator &|& : LogicalDisjunctionPrecedence
func &|& (lhs: Bool, rhs: @autoclosure () -> Bool) -> Bool {
    if lhs {
        return false
    }
    return !rhs()
}

print("✌️😳✌️")

precedencegroup RoundPrecedence {
    higherThan: AdditionPrecedence
    lowerThan: MultiplicationPrecedence
}

infix operator %%: RoundPrecedence

func %%(lhs: Int, rhs: Int) -> Int {
    return lhs - lhs%rhs
}

print(873151 %% 100)
print(1 + 7231 %% 10 * 2)

struct Time: Comparable, CustomStringConvertible {
    let hour, min: Int
    static func ==(lhs: Time, rhs: Time) -> Bool {
        return lhs.hour == rhs.hour && lhs.min == rhs.min
    }
    static func <(lhs: Time, rhs: Time) -> Bool {
        if lhs.hour == rhs.hour {
            return lhs.min < rhs.min
        }
        return lhs.hour < rhs.hour
    }
    var description: String {
        let h = hour < 10 ? " \(hour)":"\(hour)"
        let m = min < 10 ? "0\(min)":"\(min)"
        return h + ":" + m
    }
}

let t1 = Time(hour: 9, min: 0)
let t2 = Time(hour: 18, min: 30)
let t3 = Time(hour: 12, min: 15)
print(t1 != t2)
print([t1, t2, t3].sorted())
if case t1..<t2 = t3 {
    print("OK")
}
var num: Double = 2.0 + ((21.0-27.0) / 60.0)
//p168 over 06:25

//2017/03/02 22:29 TEST
var myTest = "1+2"
var myInt = Int(myTest)

