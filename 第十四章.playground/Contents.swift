//: Playground - noun: a place where people can play

import UIKit


func mySwap<T>(_ a: inout T, _ b: inout T) {
    let t = a;
    a = b;
    b = t;
}

var testDic: [Int : String] = [1: "one"]
testDic[1]
testDic[4] = "four"
print(testDic)
/*func +<Key, Value>(lhs: [Key : Value], rhs: [Key : Value]) -> [Key : Value] {
    var dic = lhs
    for (k,v) in rhs {
        dic
    }
}*/

struct PickForever<T> {
    var list: [T]
    var index = 0
    init(_ a:[T]) {
        list = a
    }
    mutating func pick() -> T {
        if index >= list.count {
            index = 0
        }
        let rtn = list[index]
        index += 1
        return rtn
    }
}

extension PickForever where T: Comparable {
    mutating func sort() {
        list.sort()
    }
}

extension PickForever where T: Hashable {
    mutating func makeUnique() {
        let tmp = Set<T>(list)
        list = [T](tmp)
    }
}
