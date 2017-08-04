//: Playground - noun: a place where people can play

import UIKit

// 2017 02 16 周四 14:25
//p134 tuple and switch


//2017 02 17 周五 02:03
//p133 tuple and switch
var day: (Int, Int) = (10, 21)
switch day {
case (1, 1): print("元旦")
case (2, 11): print("建国纪念日")
case (5, 3): print("宪法纪念日")
case (2, 1...28): print("寒假")
case (10, let d) where d != 21: print("10月是你出生的月份")
case (10, let d) where d == 21: print("10/\(d)是你生日")
default: break
}

var myTest: Int? = nil, myTestB: Int? = nil, myTestC: Int? = nil //100
let myTestResult = myTest ?? myTestB ?? myTestC ?? 0

var a_d: Int = 5
switch a_d {
case 1: print("one")
case let i where i == 2: print("Two")
case let i where i < 8 && i > 6 : print("3?")
default: break
}

var a_num = 1
for var t in 1..<2 {
    a_num += t
    t += 5
    print(a_num, t)
}

var a_tuple: (String, Int?) = ("??", nil)
typealias People = (String, Int?)

var a_m: People = ("Xu Weida", Int("17"))

switch a_m {
case let (name, age?) where age >= 18:
    print("\(name),免許も取れるよ")
case let (name, (15...18)?):
    print("\(name), 高校生")
case (let name, nil):
    print("\(name), 年齢不明")
default: break
}

var a_ops: People? = ("Chen Qingyin", 18)
switch a_ops {
case let (name, 18?)?:
    print("\(name), 18")
default:
    break
}

// ~137 over 03:15

//138 07:13
enum Direction: Int {
    case up = 0
    case down
    case right
    case left
    case wrong
    static var defaultDirection = Direction.up
    init() {
        self = Direction.defaultDirection
    }
    func clockwise() -> Direction {
        switch self {
        case .up:
            return .right
        case .right:
            return .down
        case .down:
            return .left
        case .left:
            return .up
        default:
            return .wrong
        }
    }
    var horizontal: Bool {
        switch self {
        case .right, .left:
            return true
        default:
            return false
        }
    }
    
    mutating func turnBack() {
        self = Direction(rawValue: (self.rawValue + 2)%4)!
    }
}

let b_a = Direction.up.hashValue
let b_aa = Direction.up.rawValue
let b_aaa: Direction = Direction(rawValue: 2) ?? .wrong
if b_aaa != .wrong {
    print(b_aaa)
}

if let c = Direction(rawValue: 2) {
    print(c)
}
let b_d = Direction.up
var b_x: Direction = .right
b_d == b_x
b_d.hashValue
b_d.clockwise()

Direction.defaultDirection = .right
let b_e = Direction()
let b_g = Direction.right
let b_h = Direction(rawValue: 2)

enum WebColor {
    case name (String)
    case code (String)
    case white, black, red
}
let b_background = WebColor.name("indigo")
let turquois: WebColor = .code("#40E0D0")
let textColor = WebColor.black

enum Ticket {
    case ticket (Int, Bool, turnTicket: Bool)
    case card (Int, Bool)
    case oldpass
    mutating func pay(_ u: Int) -> Bool {
        switch self {
        case .ticket(let fare, _, turnTicket: _):
            return u <= fare
        case .card(let point, let flag):
            if point < u {
                return false
            }
            self = .card(point-u, flag)
        default:
            break
        }
        return true
    }
}
var b_myTicket: Ticket = .card(210, false)//.ticket(520, true, turnTicket: false)

switch b_myTicket {
case let .ticket(fare, flag, _):
    print("normal:\(fare) " + (flag ? "children":"adult"))
case .oldpass:
    print("oldpass")
case let .card(r, true) where r < 110:
    print("please charge | children card")
case let .card(r, false) where r < 230:
    print("please charge | adult card")
case .card:
    print("card")
}
let b_tickets: [String : Ticket] = ["Tokyo" : Ticket.ticket(300, false, turnTicket: false),
                                    "Kyoto" : .ticket(500, true, turnTicket: false)]
let b_name = "Tokyo"
if let t = b_tickets[b_name], case Ticket.ticket(300, _, turnTicket: _) = t{
    print("300 ticket")
}

if case Ticket.ticket(300, _, turnTicket: _)? = b_tickets[b_name] {
    print("also 300 ticket")
}
let b_ticketArray: [Ticket] = [Ticket.oldpass, Ticket.card(300, true), Ticket.ticket(520, false, turnTicket: false), Ticket.card(10000, true), Ticket.ticket(10000, true, turnTicket: false)]

for case let Ticket.ticket (fare, flag, turnTicket: isTurn) in b_ticketArray where fare > 300 {
    print("fare: \(fare), \(flag ? "children":"adult"), \(isTurn ? "turnTicket":"not turnTicket")")
}

for t in b_ticketArray {
    switch t {
    case let Ticket.ticket(fare, flag, turnTicket: isTurn):
        if fare > 30 {
            print("fare: \(fare), \(flag ? "children":"adult"), \(isTurn ? "turnTicket":"not turnTicket")")
        }
    default:
        break
    }
}

var mycard: Ticket = .card(300, false)
if mycard.pay(170) {
    print("170 payed")
}else {
    print("not 170 enough")
}
if mycard.pay(190) {
    print("190 payed")
}else {
    print("not 190 enough")
}
var opi: Int? = 90
if let x = opi {
    print(x)
}
var myLaseTest: [Int?] = [opi]

for case var num? in myLaseTest {
    print(num)
}
//154 12:24


