//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

protocol Human {
    var name: String { get }
    var petPhrase: String { get set }
    init(name: String)
    func sayHello(to: Human)
}

class Citizen: Human {
    let name: String
    var petPhrase: String = ""
    required init(name: String) {
        self.name = name
    }
    func sayHello(to p: Human) {
        print("hello,\(p.name))")
    }
}
enum Sex {
    case Male, Female
}
protocol HealthInfo: Human {
    var weight: Double { get set }
    var height: Double { get set }
    var sex: Sex? { get }
}

struct Person: HealthInfo {
    var name: String
    var sex: Sex?
    var (weight, height) = (0.0, 0.0)
    var petPhrase: String = "superb"
    init(name: String) {
        self.name = name
        sex = nil
    }
    init(name :String, sex: Sex) {
        self.name = name
        self.sex = sex
    }
    func sayHello(to p: Human) {
        if let w = p as? HealthInfo, self.sex == w.sex {
            print("hello, \(p.name)")
        }else {
            print("hello")
        }
    }
}

protocol SimpleVecter {
    associatedtype Element
    var x: Element { get set }
    var y: Element { get set }
}

struct VectorFloat: SimpleVecter {
    typealias Element = Float
    var x: Float
    var y: Float
}

struct VectorDouble: SimpleVecter, CustomStringConvertible {
    var x, y: Double
    var description: String {
        return "[\(x), \(y)]"
    }
    init(x: VectorDouble.Element, y: VectorDouble.Element) {
        (self.x, self.y) = (x, y)
    }
    init(vectorFload d: VectorFloat) {
        self.init(x: Double(d.x), y: Double(d.y))
    }
}

struct VectorGrade: SimpleVecter, CustomStringConvertible {
    enum Element {
        case A, B, C, D, X
    }
    var x, y: Element
    var description: String {
        return "[\(x), \(y)]"
    }
}

protocol VectorInteger {
    associatedtype Element: Integer
    var x: Element { get set }
    var y: Element { get set }
}

struct VectorInt: VectorInteger, CustomStringConvertible {
    var x: Int
    var y: Int
    var description: String {
        return "[\(x),\(y)]"
    }
    static func +(lhs: VectorInt, rhs: VectorInt) -> VectorInt {
        return VectorInt(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }
}

protocol NameList {
    associatedtype List: Collection = [String]
    func printAll()
}

struct MemberList: NameList {
    var list: MemberList.List
    func printAll() {
        print(list)
    }
}

struct GradeList: NameList {
    var list: [String: Int]
    var a: Int
    func printAll() {
        print(list)
    }
}

protocol Heart {
    associatedtype Beat
    var sound: Beat { get }
}
protocol Hybrid: Heart {
    associatedtype Cycle: Integer
    typealias Text = String
    func pr(_: Beat) -> Text
}
struct Gear: Hybrid {
    typealias Cycle = Int
    var sound: UInt
    var noise: Cycle
    func pr(_ a: UInt) -> Hybrid.Text {
        return "\(sound + a) - \(noise)"
    }
}

