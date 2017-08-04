//: Playground - noun: a place where people can play

import UIKit

var str = "\(Int.max)"
var a: Range<Double> = 1.0..<2.0
var b: ClosedRange<Double> = 1.0...2.0
var c: CountableRange<Int> = 1..<2
var d: CountableClosedRange<Int>= 1...2



print(a, b, c, d, separator: "\n")
c.lowerBound
var e = true
print(e == true ? "your right":"i am right")
var f = 1...100 ~= 1000

//p107 stride 0215 08：03 
for x in stride(from: 0, to: 20, by: 4) {
    print(x, terminator: " ")
}
print("")

for x in stride(from: 3.0, through: 0.0, by: -0.6) {
    print(x, terminator: " ")
}

// プロトコル 暂时不看 108～109

//p110 配列
let cons = [ "clock", "dark", "element", "create"]
var tmp1 = cons
tmp1.insert("origin", at: 0)
let tmp = ["origin"] + cons

var s: [Int] = [1, 2, 3, 4, 5, 6]
s[0...0] = [0, 0, 0]
print(s)
s[0...2] = [1]
print(s)
s[1...2] = [3, 2]
print(s)
s[1...2] = [2, 3]
print(s)
s[1...5] = []
print(s)
s[0...0] = [1, 2, 3, 4, 5, 6]
print(s)

var s1 = s[2...5]
print(s1)
print(s1.startIndex)
print(s1.endIndex)
print(s1[5])
s1[2...5] = []
print(s, s1)

var aa: Array<Int> = [2, 5, 8, 11, 7]
var a_ : [String] = Array<String>(["2", "5", "8", "11", "7"])
var aaa = [String]()
var aaaa = [Int](0...10)
let chars = [Character]("kokoksao".characters)
print(chars)
let myDouble = [Double](repeating: 0.0, count: 10)
print(myDouble)
print(a_.count, a.isEmpty, a_.first!, a_.last!)
a_ = ["sa"] + a_[3...4] + ["over"]
print(a_)
a_[1]
a_.index(of: "over")!

var sss = ["1", "2", "3"]
sss.insert("4", at: sss.count)
print(sss)
let ssss = sss.remove(at: 3)
print(ssss)
sss.insert("4", at: 3)
let asas = [1, 2, 3, 4]
let sasa = asas.reversed()
print(sasa)
let a1 = [1, 2], a2 = [2, 1]
a1 == a2
a1 + [1] == [1] + a2

func maxOfInts(_ first: Int, _ params: Int...) -> Int {
    var m = first
    print(params.count, terminator: "  ||")
    for v in params {
        if m < v{
            m = v
        }
    }
    return m
}
let sCode = 012201
print(maxOfInts(3, 9, 2, 6))
print(maxOfInts(108, 88))
print(maxOfInts(107))
func noMeans(_ items: Any...) {
    print("ok")
}

// 117 文字列と文字 11:38
let ssstr = String(sCode)

let chs: [Character] = ["d", "\'", "e\u{0302}", "t", "r", "e"]
let ssssss = "Rasion " + String(chs) + "✌️😳✌️"
print(ssssss)
let num = Int(ssstr) ?? Int("-1") ?? -1

let gu: Character = "\u{30b0}"
let ku: Character = "\u{30af}\u{3099}"
print(gu == ku)

/*func printLong(_ s: String) {
    for ch in s.characters.reversed() {
        print(ch, terminator: " ")
    }
    print("")
}*/
func printLong(_ s: String) {
    var idx = s.startIndex
    while idx < s.endIndex {
        print(s[idx], terminator: " ")
        idx = s.index(after: idx)
    }
    print("")
    if idx == s.endIndex {
        print("over")
    }
}

printLong("sasadn")

func show(_ str: String) {
    print("Ch:\(str.characters.count)," + "US:\(str.unicodeScalars.count)," + "U16:\(str.utf16.count)")
    var a = "/"
    for cc in str.characters {
        a += "\(cc)/"
    }
    print(a)
    var b = "/"
    for cc in str.unicodeScalars {
        b += "\(cc)/"
    }
    print(b)
}

var s1111 = "我叫徐伟达"
show(s1111)
s1111.characters.count
print(s1111.startIndex)

func mySubstring(_ s:String, from f: Int, length n: Int) -> String {
    let begin = s.index(s.startIndex, offsetBy: f)
    let upto = s.index(begin, offsetBy: n)
    let range = begin..<upto
    return s[range]
}

print(mySubstring(s1111, from: 1, length: 2))

func mergeString(_ s1: String, _ s2: String) -> String {
    var merged = ""
    var x1 = s1.startIndex
    var x2 = s2.startIndex
    while x1 < s1.endIndex, x2 < s2.endIndex {
        merged += String(s1[x1])
        merged += String(s2[x2])
        x1 = s1.index(after: x1)
        x2 = s2.index(after: x2)
    }
    return merged
}

mergeString("1234567", s1111)
var index = s1111.startIndex
while index < s1111.endIndex {
    print(s1111[index], terminator: "|")
    index = s1111.index(after: index)
}
print("")

s1111.append("  hello")
print(s1111)
s1111.hasSuffix("llo")
s1111.hasPrefix("wo")
let myStart = s1111.startIndex
let myMiddle = s1111.index(myStart, offsetBy: s1111.characters.count/2)
let myBeforeEnd = s1111.index(myMiddle, offsetBy: s1111.distance(from: myMiddle, to: s1111.endIndex))
s1111.insert("1", at: myMiddle)
print(s1111)
s1111.insert(contentsOf: "1234".characters, at: myBeforeEnd)
print(s1111)
s1111.insert(contentsOf: ["1"], at: myStart)
print(s1111)

//print("resule:\(5>4 ? "yes":"no") OK?")

var myD: [String : Int] = ["Swift" : 2014, "Objective-C" : 1983]
var myE = [String : Int]()
var myF: [String : Int] = [:]
print(myD["Swift"]!)
var myG = [0, 1, 2, 3]

var myH = ["Ruby" : 1995]
print(myH)
myH["Java"] = 1995
print(myH)
myH["Python"] = 1991
print(myH)
myH["Java"] = nil
print(myH)
let myI = [String](myH.keys)
print(myI)

for (a, b) in myH {
    print("\(a)  :  \(b)")
}

for e in myH {
    print("\(e.1)  :  \(e.0)")
    print(e.value)
    print(e.key)
}

if myH.updateValue(2017, forKey: "XuWeida") ?? 0 != 0 {
    print("value 1")
}else {
    print("nil 1")
}
print(myH)
let myAA = myH.updateValue(2017, forKey: "XuWeida") ?? 0
print("\(myAA)  1")
print("-----------------------")
if myH.updateValue(2017, forKey: "XuWeida") ?? 0 != 0 {
    print("value 2")
}else {
    print("nil 2")
}
print(myH)
let myAAA = myH.updateValue(2017, forKey: "XuWeida") ?? 0
print("\(myAAA)  2")
/*myH.removeValue(forKey: "XuWeida")
print(myH)*/

// 2017 02 16 周四  14:03


