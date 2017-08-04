//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/*enum Test {
    case test1(Int, Bool)
}
var a: Test = .test1(5, false)

func convInt(_ s: String) throws -> Int? {
    if s == "" {
        throw FooError.ooal
    }
    return Int(s)
}*/

enum FormatError: Error {
    case notHex(Character)
    case space
}

func hex(_ C: UnicodeScalar) throws -> Int {
    var d = 0
    switch  C {
    case UnicodeScalar("A")...UnicodeScalar("F"):
        d = 0x41 - 10
    case UnicodeScalar("a")...UnicodeScalar("f"):
        d = 0x61 - 10
    case UnicodeScalar("0")...UnicodeScalar("9"):
        d = 0x30
    default:
        throw FormatError.notHex(Character(C))
    }
    return Int(C.value) - d
}

func hexToBytes(_ s: String) throws -> [UInt8] {
    let s = s + ""
    var bytes = [UInt8]()
    var first: Int? = nil
    do {
        for uc in s.unicodeScalars {
            if let v = first {
                if uc == " " {
                    throw FormatError.space
                }
                let w = try hex(uc)
                bytes.append(UInt8((v << 4)|w))
                first = nil
            }else if uc != " " {
                first = try hex(uc)
            }
        }
    }catch FormatError.space {
        print("16進数は偶数桁で読み込みます")
    }
    return bytes
}

enum numTest: Int, Error  {
    case _0, _1, _2, _3
    case nothing = 999
}

func errorTest(by num: Int) throws -> String {
    switch num {
    case 0:
        throw numTest._0
    case 1:
        throw numTest._1
    case 2:
        throw numTest._2
    case 3:
        throw numTest._3
    case 10:
        throw numTest.nothing
    default:
        return "OK" + " \(num)"
    }
}

for i in 0...10 {
    do {
        try print(errorTest(by: i))
    }catch numTest._0 {
        print("wrong 0")
    }catch numTest._1 {
        print("wrong 1")
    }catch numTest._2 {
        print("wrong 2")
    }catch numTest._3 {
        print("wrong 3")
    }catch {
        print("unknow")
    }
}

protocol Test: class, CustomStringConvertible {
    var num1: Int { get set }
    var num2: Int { get set }
    func getSum() -> Int
    func sum() //num1 变为num1+num2
}

extension Test {//文字输出num1
     var description: String {
        return "\(num1)"
    }
}

extension Test {
    func getSum() -> Int {
        return num1 + num2
    }
    func sum() { //改变自身的变量，要加mutating
        self.num1 += self.num2
    }
}

class TestClass: Test {
    var num1: Int
    var num2: Int
    init() {
        num1 = 0; num2 = 0
    }
    convenience init(_ num1: Int, _ num2: Int) {
        self.init()
        self.num1 = num1; self.num2 = num2
    }
}

var test = TestClass(1, 2)
print(test)
test.sum()
print(test)
/*print("即将开始测试")
try errorTest(by: 0)
print("测试结束")
print("因为异常没有被捕捉，所以这两句话不会运行")*/
print("即将开始测试")
do {
    try errorTest(by: 0)
}catch {
    print("---测试中---")
}
print("测试结束")
print("因为异常被捕捉，所以这两句话会运行")
print("-----------")
for i in [3, 5] {
    print("即将开始测试")
    if let myTest = try? errorTest(by: i) {
        print("测试中，", terminator: "")
        print("没有抛出异常, 测试值\(myTest)")
    }else {
        print("测试中，", terminator: "")
        print("抛出异常")
    }
    print("测试结束")
    print("-----------")
}

print("即将开始测试")
print("正常值： ", try! errorTest(by: 6))
print("测试结束")
//----------------------------------------
func errorTest(by doubleNum: Double) throws -> String? {
    switch doubleNum {
    case 0..<1:
        throw numTest._0
    case 1..<2:
        throw numTest._1
    case 2..<3:
        throw numTest._2
    case 3..<4:
        throw numTest._3
    case 10..<11:
        throw numTest.nothing
    default:
        if doubleNum > 10000.0 {
            return nil
        }else {
            return "\(doubleNum)"
        }
    }
}


for d in [2.6, 8.4, 12345.54321] {
    print("即将开始测试")
    if let x = try? errorTest(by: d) {
        print("测试中", terminator: " ")
        print("正常, 测试值 = \(d); 结果 = \(x)")
    }else {
        print("测试中, 异常")
    }
    print("测试结束")
    print("-----------")
}
print("\n\n\n")

for d in [2.6, 8.4, 12345.54321] {
    print("即将开始测试")
    switch try? errorTest(by: d) {
    case let result??:
        print("测试中", terminator: " ")
        print("正常, 测试值 = \(d); 结果 = \(result)")
    case nil?:
        print("测试中", terminator: " ")
        print("正常, 测试值 = \(d); 结果 = nil")
    case nil:
        print("测试中, 异常, 测试值 = \(d)")
    }
    print("测试结束")
    print("-----------")
}