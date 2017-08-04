//: Playground - noun: a place where people can play

import UIKit

//p170 2017 02 18 周六 11:25

class Time {
    var hour = 0, min: Int = 0
    init(hour: Int, min: Int) {
        self.hour = hour; self.min = min
    }
    func advance(min: Int) {
        let m = self.min + min
        if m >= 60 {
            self.min = m % 60
            let t = self.hour + m/60
            self.hour = t % 24
        }else {
            self.min = m
        }
    }
    func inc() {
        self.advance(min: 1)
    }
    func toString() -> String {
        let h = hour<10 ? " \(hour)":"\(hour)"
        let m = min<10 ? " \(min)":"\(min)"
        return h + ":" + m
    }
}

let t1 = Time(hour: 13, min: 20)
let t2 = t1
print(t1.toString())
t1.inc()
print(t2.toString())

class Time12: Time, CustomStringConvertible {
    var pm: Bool
    init(hour: Int, min: Int, pm: Bool) {
        self.pm = pm
        super.init(hour: hour, min: min)
    }
    override convenience init(hour: Int, min: Int) {
        let isPm = hour >= 12
        self.init(hour: isPm ? hour-12:hour, min: min, pm: isPm)
    }
    override func advance(min: Int) {
        super.advance(min: min)
        if hour >= 12 {
            if hour/12 % 2 == 1 {
                pm = !pm
            }
            hour %= 12
        }
    }
    var description: String {
        return toString() + " " + (pm ? "PM":"AM")
    }
}

var array = [Time]()
array.append(Time(hour: 13, min: 10))
array.append(Time12(hour: 13, min: 20))
array.append(Time12(hour: 1, min: 30, pm: true))

for t in array {
    if t is Time12 {
        print(t)
    }else {
        print(">", t.toString())
    }
}

if let u = array[2] as? Time12 {
    print(u.pm ? "PM":"AM")
}

/*class A: CustomStringConvertible {
    static var className: String {
        return "A"
    }
    static var total = 0
    class var level: Int {
        return 1
    }
    static func point() -> Int {
        return 1000
    }
    class func say() -> String {
        return "Ah."
    }
    init() {
        A.total += 1
    }
    var description: String {
        return "\(A.total):\(A.className)" + "Level=\(A.level),\(A.point()),\(A.say())"
    }
}

class B: A {
    override class var level: Int {
        return 2
    }
    override init() {
        super.init()
        B.total += 1
    }
    override var description: String {
        return "\(B.total):\(B.className)" + "Level=\(B.level),\(B.point()),\(B.say())"
    }
}

let aa = A()
print(aa)
let bb = B()
print(aa, bb, separator: "\n")*/
class A {
    class func show() {
        print("A")
    }
    class func who() {
        show()
    }
    func who() {
        type(of: self).who()
    }
    
}

class B: A {
    override  class func show() {
        print("B")
    }
}

let a = A(), b = B()
a.who()
b.who()
//183 15:57
//2017 02 20 星期一 08:01
class DayOfMonth: CustomStringConvertible {
    var month, day: Int
    init(month: Int, day: Int) {
        self.month = month; self.day = day
    }
    var description: String {
        return DayOfMonth.twoDigits(month) + "/" + DayOfMonth.twoDigits(day)
    }
    class func twoDigits(_ n: Int) -> String {
        let i = n%100
        if (i < 10) {
            return "0\(i)"
        }
        return "\(i)"
    }
}

func dayOfWeek(_ y: Int, _ m: Int, _ d: Int) -> Int {
    let leap = y + y/4 - y/100 + y/400
    return (leap + (13*m + 8)/5 + d)
}

class DateInfo: DayOfMonth {
    var year, dow: Int
    init(_ y:Int, _ m: Int, _ d: Int) {
        year = y; dow = dayOfWeek(y, m, d)
        super.init(month: m, day: d)
    }
}
class CalenarDate: DateInfo {
    static let namesOfDays = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
    var dweek = String()
    override init(_ y: Int, _ m: Int, _ d: Int) {
        super.init(y, m, d)
        dweek = CalenarDate.namesOfDays[dow]
    }
    convenience init(_ m: Int, _ d: Int, year: Int = 2020) {
        self.init(m, d, year)
    }
    override var day: Int {
        didSet {
            dow = dayOfWeek(year, month, day)
            dweek = CalenarDate.namesOfDays[dow]
        }
    }
    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}
//9:06 p185 回头看第77页
//2017/02/21 09:23 P77
var aaa:String = "O"
var myString: String {
get {
    return aaa
}
set {
    aaa = newValue + "ok"
}
}

myString = "123 "
print(aaa)

struct Stock {
    let buyingPrice: Int
    var high = false
    var count = 0
    init(price: Int) {
        buyingPrice = price
        self.price = price
    }
    var price: Int {
        willSet {
            count += 1
            high = newValue > buyingPrice
        }
        didSet {
            print("\(oldValue) => \(price)")
        }
    }
}

class ICCard {
    static let Deposit = 500
    var money = 0
    required init(charge: Int) {
        money = charge - ICCard.Deposit
    }
}


//2017/02/22 周三 09:28
class Icocai: ICCard {
    static var serial = 0
    let idnumber: Int
    init(id: Int, money: Int) {
        idnumber = id
        super.init(charge: money)
    }
    required init(charge: Int) {
        Icocai.serial += 1
        idnumber = Icocai.serial
        super.init(charge: charge)
    }
}

class Suica: ICCard {
    var name = String()
}

class NamePlate {
    let name, title: String
    init() {
        name = "招待者"; title = ""
    }
    init?(name: String, title: String) {
        if name == "" {
            return nil
        }
        self.name = name
        self.title = title
    }
}

class SpeakerNamePlate: NamePlate {
    override init?(name: String, title: String) {
        if title == "" {
            return nil
        }
        super.init(name: name, title: title)
    }
    convenience init?(name: String) {
        if name == "" {
            return nil
        }
        self.init(name: name, title: "講演者")
    }
}

let plate = NamePlate(name: "Xu Weida", title: "nothing")!
class GuestNamePlate: NamePlate {
    override init(name: String, title: String) {
        if name == "" {
            super.init()
        }else {
            super.init(name: name, title: title)!
        }
    }
}

class Prop {
    var attr = 0
}

class PropA: Prop {
    /*override var attr: Int {
        get {
            return super.attr & 1
        }
        set {
            super.attr = newValue
        }
    }*/
    override var attr: Int {
        willSet {
            print("A will set")
        }
        didSet {
            print("A did set")
        }
    }
}

class PropB: PropA {
    /*override var attr: Int {
        get {
            return super.attr
        }
        set {
            super.attr = newValue/10 * 10
        }
    }*/
    override var attr: Int {
        willSet {
            print("B will set")
        }
        didSet {
            print("B did set")
        }
    }
}

class Recipe {
    let amount = [6.6, 8.9, 7.5, 9.1]
    subscript (idx: Int) -> Double {
        return idx < amount.count ? amount[idx] : 0.0
    }
}

class Arrange: Recipe {
    private var custom: [Double] = []
    override init() {
        super.init()
        custom = amount
    }
    override subscript(idx: Int) -> Double {
        get {
            return idx < custom.count ? custom[idx]:0.0
        }
        set {
            if idx < custom.count {
                custom[idx] = newValue
            }
        }
    }
    func recall(at idx: Int) {
        self[idx] = super[idx]
    }
}

var tTest = PropB()
tTest.attr = 1

let s = ["john", "smith"] as Set<String>
let c = "j" as Character
var myT = [Arrange(), Recipe()]
print("\(type(of: myT))")

class Avatar {
    class func say() {
        print("Avatar")
    
    }
    required init() {
    }
}

class Player: Avatar {
    override class func say() {
        print("Player")
    }
    let name: String
    init(name: String) {
        self.name = name
        super.init()
    }
    required convenience init() {
        self.init(name: "none")
    }
}

var meta: Avatar.Type = Player.self
meta.say();print("    1")
let p: Avatar = meta.init()
if type(of: p) == Player.self{
    print((p as! Player).name)
}

let q = Avatar()
meta = type(of: q)
meta.say()
class testA {
    var a: Int = 0
    required init() {
        
    }
}
class testB: testA {
    var b: Int = 0
    required init() {
        b = 1
        super.init()
        super.a = 5
    }
}
var myS = testB()
myS.a
myS.b
var xasa: testB.Type = testB.self


class WordReader {
    var fptr: UnsafeMutablePointer<FILE>? = nil
    init?(open: String) {
        fptr = fopen(open, "r")
        if fptr == nil {
            return nil
        }
    }
    deinit {
        print("[[deinit]]")
        self.close()
    }
    func close() {
        if let fp = fptr {
            fclose(fp)
            fptr = nil
        }
    }
    func getWord() -> String? {
        guard let fp = fptr else {
            return nil
        }
        var ch: Int
        repeat {
            ch = Int(fgetc(fp))
            if ch < 0{
                return nil
            }
        }while ch <= 0x20
        var s = String(UnicodeScalar(ch)!)
        ch = Int(fgetc(fp))
        while ch >= 0x20 {
            s.append(String(UnicodeScalar(ch)!))
            ch = Int(fgetc(fp))
        }
        return s
    }
}
var myStringA = readLine()

class FileAttribute {
    let filename: String
    lazy var size: Int = self.getFileSize()
    init(file: String) {
        filename = file
    }
    func getFileSize() -> Int {
        var buffer = stat()
        stat(filename, &buffer)
        print("[getFileSize]")
        return Int(buffer.st_size)
    }
}
//p205 over 2017/02//22 16:52
//总算搞定第八章了，真是枯燥


