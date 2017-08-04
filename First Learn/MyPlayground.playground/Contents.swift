//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
// 自分の得意な言語で
// Let's チャレンジ！！
//-----------------------定義---------------------------------------------------------------
typealias hData = [Int]
typealias vData = hData
typealias BSide = Int
//サイコロの各面の数字、裏側はbackSideで表す
typealias Dice = (horizontalData: hData, verticalData: vData, backSide: BSide)
typealias Map = [[Int]] //行を単位の整数配列
typealias Positon = (x: Int, y: Int)
typealias Cost = Int
enum Direction: Int {
    case right
    case down
    case both
    case wrong
    case left
    case above
    case noAbove
    case noRight
    case noLeft
    case noDown
    case allIsOk
    case downRight
    /*case downAbove
    case leftRight
    case aboveLeft
    case aboveRight
    case leftDown
    case rightDown*/
}
//------------------------------------------------------------------------------------------


//----------------------クラス--------------------------------------------------------------

//-----------------------------------------------------
//             class readDataFromInput
//入力からデータを読み込み、サイコロと地図のデータを作成
//-----------------------------------------------------
class readDataFromInput {
    private var dicePosition: Dice = (horizontalData: [4,1,3], verticalData: [2,1,5], backSide: 6)
    private var mapData: Map = []
    private var inputStringLine: [String] = []
    init() {
        readInputStringLineArray(&inputStringLine)
        createMapData(&mapData, inputStringLine)
    }
    
    private func readInputStringLineArray(_ inputStringArray: inout [String]) {
        while let str = readLine() {
            inputStringArray += [str]
        }
    }
    
    func getStringLine() -> [String] {//読み取った文字列の配列を返す
        return inputStringLine
    }
    func getMapData() -> Map {
        return mapData
    }
    func getDiceData() -> Dice {
        return dicePosition
    }
    private func createMapData(_ mapData :inout  Map, _ inputStringLine: [String]) {
        //let (hLine, vLine) = (0, 0)
        var isfirst = true
        var isLineFirstEle = true
        var count = -1
        for str in inputStringLine {
            //
            if isfirst {
                isfirst = false
            }else {
                for char in str.characters {
                    if let point = Int(String(char)) {
                        if isLineFirstEle {
                            mapData.append([point])
                            count += 1
                            //print("thank you, this create new array unit")
                            isLineFirstEle = false
                        }else{
                            mapData[count] += [point]
                            //print("count:", count)
                        }
                    }
                }
                //count += 1
                //print(isLineFirstEle)
                isLineFirstEle = true
                //print("ok")
            }
        }
    }
    
}
//-----------------------------------------------------
//            class moveDiceAndCalculateCost
//サイコロを地図に移動し、コストを計算する
//左上から右下へすべてをカバー
//-----------------------------------------------------
class moveDiceAndCalculateCost {
    private let map: Map
    private let dice: Dice
    private var countOfGoType = 0
    //private var coseOfTypeInArray: [Int] = []
    private let startPosition: Positon = (x: 0, y: 0)
    private let (w, h): (Int, Int)
    init(_ dice: Dice, _ map: Map) {
        self.dice = dice
        diceArray = [dice]
        self.map = map
        h = self.map.count
        w = self.map[0].count
        mapArray = [map]
    }
    //------------------------------------------------------------------------------------------------
    //移動処理
    private func diceMoveToRight(_ dice: Dice, _ position: Positon) -> (Dice, Positon) {
        //右へと移動する
        //サイコロの状態と新しい位置を返す
        var newDiceStatus = dice
        var newPositionStatus = position
        newDiceStatus.horizontalData = [dice.backSide, dice.horizontalData[0], dice.horizontalData[1]]
        newDiceStatus.verticalData[1] = dice.horizontalData[0]
        newDiceStatus.backSide = dice.horizontalData[2]
        newPositionStatus.x += 1
        return (newDiceStatus, newPositionStatus)
    }
    
    private func diceMoveToDown(_ dice: Dice, _ position: Positon) -> (Dice, Positon) {
        //下へと移動する
        //サイコロの状態と新しい位置を返す
        var newDiceStatus = dice
        var newPositionStatus = position
        newDiceStatus.verticalData = [dice.backSide, dice.verticalData[0], dice.verticalData[1]]
        newDiceStatus.horizontalData[1] = dice.verticalData[0]
        newDiceStatus.backSide = dice.verticalData[2]
        newPositionStatus.y += 1
        return (newDiceStatus, newPositionStatus)
    }
    private func diceMoveToAbove(_ dice: Dice, _ position: Positon) -> (Dice, Positon) {
        //上へと移動する
        //サイコロの状態と新しい位置を返す
        var newDiceStatus = dice
        var newPositionStatus = position
        newDiceStatus.verticalData = [dice.verticalData[1], dice.verticalData[2],dice.backSide]
        newDiceStatus.horizontalData[1] = dice.verticalData[2]
        newDiceStatus.backSide = dice.verticalData[0]
        newPositionStatus.y -= 1
        return (newDiceStatus, newPositionStatus)
    }
    private func diceMoveToLeft(_ dice: Dice, _ position: Positon) -> (Dice, Positon) {
        //左へと移動する
        //サイコロの状態と新しい位置を返す
        var newDiceStatus = dice
        var newPositionStatus = position
        newDiceStatus.horizontalData = [dice.horizontalData[1], dice.horizontalData[2], dice.backSide]
        newDiceStatus.verticalData[1] = dice.horizontalData[2]
        newDiceStatus.backSide = dice.horizontalData[0]
        newPositionStatus.x -= 1
        return (newDiceStatus, newPositionStatus)
    }
    //------------------------------------------------------------------------------------------------
    //移動したらところをマークする
    private func hasPassed(position: Positon, map: Map) -> Map {
        var newMap = map
        newMap[position.y][position.x] = -1
        return newMap
    }
    //------------------------------------------------------------------------------------------------
    //------------------------------------------------------------------------------------------------
    //どこへ移動するかを判断
    /*private func decideWhereToGo(_ dice: Dice, _ position: Positon, _ map: Map) -> (Direction, Cost) {
        //どこへ移動すればよいかを判断
        if position.x >= w-1 {
            let downCost = toGetCost(dice.verticalData[0], map[position.y+1][position.x])
            return (Direction.down, downCost)
        }
        if position.y >= h-1 {
            let rightCost = toGetCost(dice.horizontalData[0], map[position.y][position.x+1])
            return (Direction.right, rightCost)
        }
        let (diceLeftNum, diceAboveNum) = (dice.horizontalData[0], dice.verticalData[0])
        let (mapRightNum, mapDownNum) =  (map[position.y][position.x+1], map[position.y+1][position.x])
        let (rightCost, downCost) = (toGetCost(diceLeftNum, mapRightNum), toGetCost(diceAboveNum, mapDownNum))
        if rightCost > downCost {
            return (Direction.down, downCost)
        }else if rightCost < downCost {
            return (Direction.right, rightCost)
        }else {
            return (Direction.both, downCost)
        }
    }*/
    private func costOfGoRight(_ dice: Dice, _ position: Positon, _ map: Map) -> Cost {
        let diceLeftNum = dice.horizontalData[0]
        let mapRightNum =  map[position.y][position.x+1]
        let rightCost = toGetCost(diceLeftNum, mapRightNum)
        return rightCost

    }
    private func costOfGoDown(_ dice: Dice, _ position: Positon, _ map: Map) -> Cost {
        let diceAboveNum = dice.verticalData[0]
        let mapDownNum =  map[position.y+1][position.x]
        let downCost = toGetCost(diceAboveNum, mapDownNum)
        return downCost
    }
    
    private func costOfGoAbove(_ dice: Dice, _ position: Positon, _ map: Map) -> Cost {
        let diceDownNum = dice.verticalData[2]
        let mapAboveNum =  map[position.y-1][position.x]
        let aboveCost = toGetCost(diceDownNum, mapAboveNum)
        return aboveCost
    }

    private func costOfGoLeft(_ dice: Dice, _ position: Positon, _ map: Map) -> Cost {
        let diceRightNum = dice.horizontalData[3]
        let mapLeftNum =  map[position.y][position.x-1]
        let leftCost = toGetCost(diceRightNum, mapLeftNum)
        return leftCost
        
    }

    /*private func costOfGoBoth(_ dice: Dice, _ position: Positon, _ map: Map) -> (Cost, Cost) {
        let (diceLeftNum, diceAboveNum) = (dice.horizontalData[0], dice.verticalData[0])
        let (mapRightNum, mapDownNum) =  (map[position.y][position.x+1], map[position.y+1][position.x])
        let (rightCost, downCost) = (toGetCost(diceLeftNum, mapRightNum), toGetCost(diceAboveNum, mapDownNum))
        return (rightCost, downCost)
    }*/
    
    private func toGetCost(_ num1:Int, _ num2: Int) -> Int {
        //コストを計算する
        return num1 > num2 ?  (num1-num2):(num2-num1)
    }
    
    //右下に到達するかどうかを判断
    private func isArrived(_ position: Positon) -> Bool {
        //print("\n\n")
        //print("到達するかどうかを判断中")
        if position.y+1 == h && position.x+1 == w {
            //print("isArrived: true\n x: \(position.x), y: \(position.y), OK!!!!!!!!!!!!!!!!!!!!!!!!!!!")
            return true
        }
        //print("isArrived: false\nx: \(position.x), y: \(position.y), \nw:\(w-1), h:\(h-1)")
        return false
    }
    
    private func isTouchedEdge(_ position: Positon) -> (Bool, Direction) {
        if position.y+1 == h && position.x+1 != w {
            return (true, .right)
        }else if  position.y+1 != h && position.x+1 == w {
            return (true, .down)
        }else if position.y+1 == h && position.x+1 == w {
            return (false, .wrong)
        }
        return (false, .both)
    }
    
    private func canGoToRight(_ position: Positon) -> Bool {
        let newMap = self.map
        if newMap[position.y][position.x+1] != -1 {
            return true
        }
        return false
    }
    private func canGoToLeft(_ position: Positon) -> Bool {
        let newMap = self.map
        if newMap[position.y][position.x-1] != -1 {
            return true
        }
        return false
    }
    private func canGoToAbove(_ position: Positon) -> Bool {
        let newMap = self.map
        if newMap[position.y-1][position.x] != -1 {
            return true
        }
        return false
    }
    private func canGoToDown(_ position: Positon) -> Bool {
        let newMap = self.map
        if newMap[position.y+1][position.x] != -1 {
            return true
        }
        return false
    }

    private func newWhereToGo(_ position: Positon) -> Direction {
        //let map = self.map
        if position.y+1 == h && position.x+1 != w {
            // noDown
            return .noDown
            /*if map[position.y][position.x+1] == -1 {//noRight
                return .aboveLeft
            }else if map[position.y][position.x-1] == -1  {//noLeft
                return .aboveRight
            }else if map[position.y-1][position.x] == -1  {//noAbove
                return .leftRight
            }*/
        }else if position.x == 0 && position.y == 0 {
            return .downRight
            
        }else if  position.y+1 != h && position.x+1 == w {
            //noRight
            return .noRight
            /*if map[position.y][position.x-1] == -1  {//noLeft
                return .downAbove
            }else if map[position.y+1][position.x] == -1  {//noDown
                return .aboveLeft
            }else if map[position.y-1][position.x] == -1  {//noAbove
                return .leftDown
            }*/
        }else if position.y == 0 && position.x+1 != w {
            //noAbove
            return .noAbove
            /*if map[position.y][position.x+1] == -1 {//noRight
                return .leftDown
            }else if map[position.y][position.x-1] == -1  {//noLeft
                return .rightDown
            }else if map[position.y+1][position.x] == -1  {//noDown
                return .leftRight
            }*/
        }else if position.y+1 != h && position.x == 0 {
            //noLeft
            return .noLeft
            /*if map[position.y][position.x+1] == -1 {//noRight
                return .downAbove
            }else if map[position.y+1][position.x] == -1  {//noDown
                return .aboveRight
            }else if map[position.y-1][position.x] == -1  {//noAbove
                return .rightDown
            }*/

        }else if position.y+1 != h && position.x+1 != w {
            /*if map[position.y][position.x+1] == -1 {//noRight
                return .noRight
            }else if map[position.y][position.x-1] == -1  {//noLeft
                return .noLeft
            }else if map[position.y+1][position.x] == -1  {//noDown
                return .noDown
            }else if map[position.y-1][position.x] == -1  {//noAbove
                return .noAbove
            }*/
            return .allIsOk
        }
        return .wrong
    }
    //------------------------------------------------------------------------------------------------
    //------------------------------------------------------------------------------------------------
    //移動とともにコスト計算をする関数
    //この関数のための変数
    private var outArray = [0]
    private var costSumArray: [Int] = [0]
    private var positionArray: [Positon] = [(0,0)]
    private var mapArray: [Map] // 初期化の時に
    private var diceArray: [Dice] // 初期化の時に
    private let startProcess = 0
    private var count = 1
    private var nowProcess = 0
    //private func getAllCostSum(_ dice: Dice, _ position: Positon, _ map: Map, _ nowProcess: Int){
    @discardableResult
    private func getAllCostSum(_ nowProcess: Int) -> Bool {
        //private func getAllCostSum(_ dice:inout Dice, _ position: inout Positon, _ map: Map, _ nowProcess: Int){
        //private func getAllCostSum(nowProcess: Int){
        //まだ計算する必要のあるポジションを全部終わらせるまで再帰呼び出しを繰り返す
        //最初のポジションから
        //関数一回の実行を一つのポジションの全ての移動をカバーするとする
        while !isArrived(positionArray[nowProcess]) {
            //print( isArrived(positionArray[nowProcess]))
            //いまのポジションを終わらせるまで
            //終わったら次のポジションへ
            //--------------------------------------------------------------------------
            /*let (whereToGo, cost) = decideWhereToGo(diceArray[nowProcess], positionArray[nowProcess], map)
            if whereToGo == Direction.right {
                print("right", terminator: " ")
                //移動する時、サイコロと座標を更新する
                //コストをコストにプラスする
                let (newDice, newPosition) = diceMoveToRight(diceArray[nowProcess], positionArray[nowProcess])
                costSumArray[nowProcess] += cost//新コスト
                diceArray[nowProcess] = newDice//新サイコロ
                positionArray[nowProcess] = newPosition//新座標
                print("nowProcess:\(nowProcess)  cost:\(costSumArray[nowProcess]), newDice:\(diceArray[nowProcess]), newPositon\(positionArray[nowProcess])")
            }else if whereToGo == Direction.down {
                print("down", terminator: " ")
                let (newDice, newPosition) = diceMoveToDown(diceArray[nowProcess], positionArray[nowProcess])
                costSumArray[nowProcess] += cost
                diceArray[nowProcess] = newDice
                positionArray[nowProcess] = newPosition
                print("nowProcess:\(nowProcess)  cost:\(costSumArray[nowProcess]), newDice:\(diceArray[nowProcess]), newPositon\(positionArray[nowProcess])")
            }else {
                print("both", terminator: " ")
                let (tempDice, tempPosition) = (diceArray[nowProcess], positionArray[nowProcess])
                let tempCost = costSumArray[nowProcess]
                //どっちでもいい場合、先に右へ
                let (newDice, newPosition) = diceMoveToRight(tempDice, tempPosition)
                print("\n----最初に右へ", terminator: "")
                costSumArray[nowProcess] += cost
                diceArray[nowProcess] = newDice
                positionArray[nowProcess] = newPosition
                print("nowProcess:\(nowProcess)  cost:\(costSumArray[nowProcess]), newDice:\(diceArray[nowProcess]), newPositon\(positionArray[nowProcess])")

                //下への新しいポジションを作る
                let (newDice2, newPosition2) = diceMoveToDown(tempDice, tempPosition)
                print("----次に下へ", terminator: "")
                costSumArray.append(tempCost + cost)
                diceArray.append(newDice2)
                positionArray.append(newPosition2)
                count += 1
                let newNowProcess = nowProcess + 1
                print("nowProcess:\(newNowProcess)  cost:\(costSumArray[newNowProcess]), newDice:\(diceArray[newNowProcess]), newPositon\(positionArray[newNowProcess])")*/
            //--------------------------------------------------------------------------
            //let (_, cost) = decideWhereToGo(diceArray[nowProcess], positionArray[nowProcess], map)
            //let (rightCost, downCost) = (costOfGoRight(diceArray[nowProcess], positionArray[nowProcess], map), costOfGoDown(diceArray[nowProcess], positionArray[nowProcess], map))
            //let (_, whereToGo) = isTouchedEdge(positionArray[nowProcess])
            let whereToGo = newWhereToGo(positionArray[nowProcess])
            print(whereToGo)
            let nowPosition = positionArray[nowProcess]
            print(" 获得  whereToGo")
            //右　左　下　上
            if whereToGo == .allIsOk {

                let (canGoLeft, canGoRight, canGoAbove, canGoDown) = (canGoToLeft(nowPosition),
                                                                      canGoToRight(nowPosition),
                                                                      canGoToAbove(nowPosition),
                                                                      canGoToDown(nowPosition))
                let (tempDice, tempPosition, tempMap) = (diceArray[nowProcess], positionArray[nowProcess], mapArray[nowProcess])
                let tempCost = costSumArray[nowProcess]
                if !canGoDown && !canGoAbove && !canGoLeft && !canGoRight {//周りが全部移動した
                    print("allIsOk -- break")
                    costSumArray[nowProcess] = -1
                    break
                }
                if canGoRight {
                    print("allIsOk -- right")
                    let rightCost = costOfGoRight(tempDice, positionArray[nowProcess], map)
                    let newMap = hasPassed(position: nowPosition, map: map)
                    let (newDice, newPosition) = diceMoveToRight(tempDice, positionArray[nowProcess])
                    costSumArray[nowProcess] += rightCost//新コスト
                    diceArray[nowProcess] = newDice//新サイコロ
                    positionArray[nowProcess] = newPosition//新座標
                    mapArray[nowProcess] = newMap
                }
                if canGoLeft && !canGoRight {
                    print("allIsOk -- left")
                    let leftCost = costOfGoLeft(tempDice, positionArray[nowProcess], map)
                    let newMap = hasPassed(position: nowPosition, map: map)
                    let (newDice, newPosition) = diceMoveToLeft(tempDice, positionArray[nowProcess])
                    costSumArray[nowProcess] += leftCost//新コスト
                    diceArray[nowProcess] = newDice//新サイコロ
                    positionArray[nowProcess] = newPosition//新座標
                    mapArray[nowProcess] = newMap
                }else if canGoLeft && canGoRight {//add
                    print("allIsOk -- left add")
                    let leftCost = costOfGoLeft(tempDice, positionArray[nowProcess], map)
                    let newMap = hasPassed(position: nowPosition, map: map)
                    let (newDice2, newPosition2) = diceMoveToLeft(tempDice, positionArray[nowProcess])
                    costSumArray.append(tempCost + leftCost)
                    diceArray.append(newDice2)
                    positionArray.append(newPosition2)
                    mapArray.append(newMap)
                    count += 1
                }
                
                if canGoDown && !canGoRight && !canGoLeft {
                    print("allIsOk -- down")
                    let downCost = costOfGoDown(tempDice, positionArray[nowProcess], map)
                    let newMap = hasPassed(position: nowPosition, map: map)
                    let (newDice, newPosition) = diceMoveToDown(tempDice, positionArray[nowProcess])
                    costSumArray[nowProcess] += downCost//新コスト
                    diceArray[nowProcess] = newDice//新サイコロ
                    positionArray[nowProcess] = newPosition//新座標
                    mapArray[nowProcess] = newMap
                }else if canGoDown && (canGoLeft || canGoRight) {//add
                    print("allIsOk -- down add")
                    let downCost = costOfGoDown(tempDice, positionArray[nowProcess], map)
                    let newMap = hasPassed(position: nowPosition, map: map)
                    let (newDice2, newPosition2) = diceMoveToDown(tempDice, positionArray[nowProcess])
                    costSumArray.append(tempCost + downCost)
                    diceArray.append(newDice2)
                    positionArray.append(newPosition2)
                    mapArray.append(newMap)
                    count += 1
                }
                if canGoAbove && !canGoRight && !canGoLeft && !canGoDown {
                    print("allIsOk -- above")
                    let aboveCost = costOfGoAbove(tempDice, positionArray[nowProcess], map)
                    let newMap = hasPassed(position: nowPosition, map: map)
                    let (newDice, newPosition) = diceMoveToAbove(tempDice, positionArray[nowProcess])
                    costSumArray[nowProcess] += aboveCost//新コスト
                    diceArray[nowProcess] = newDice//新サイコロ
                    positionArray[nowProcess] = newPosition//新座標
                    mapArray[nowProcess] = newMap
                }else if canGoAbove && (canGoRight || canGoLeft || canGoDown) {//add
                    print("allIsOk -- above add")
                    let aboveCost = costOfGoAbove(tempDice, positionArray[nowProcess], map)
                    let newMap = hasPassed(position: nowPosition, map: map)
                    let (newDice2, newPosition2) = diceMoveToAbove(tempDice, positionArray[nowProcess])
                    costSumArray.append(tempCost + aboveCost)
                    diceArray.append(newDice2)
                    positionArray.append(newPosition2)
                    mapArray.append(newMap)
                    count += 1
                }
            }else if whereToGo == .noRight {
                let tempCost = costSumArray[nowProcess]
                let (tempDice, tempPosition, tempMap) = (diceArray[nowProcess], positionArray[nowProcess], mapArray[nowProcess])
                let (canGoLeft,canGoAbove, canGoDown) = (canGoToLeft(nowPosition),
                                                                      canGoToAbove(nowPosition),
                                                                      canGoToDown(nowPosition))
                if !canGoDown && !canGoAbove && !canGoLeft{//周りが全部移動した
                    print("noRight -- break")
                    costSumArray[nowProcess] = -1
                    break
                }
                if canGoLeft {
                    print("noRight -- left")
                    let leftCost = costOfGoLeft(tempDice, positionArray[nowProcess], map)
                    let newMap = hasPassed(position: nowPosition, map: map)
                    let (newDice, newPosition) = diceMoveToLeft(tempDice, positionArray[nowProcess])
                    costSumArray[nowProcess] += leftCost//新コスト
                    diceArray[nowProcess] = newDice//新サイコロ
                    positionArray[nowProcess] = newPosition//新座標
                    mapArray[nowProcess] = newMap
                }
                
                if canGoDown && !canGoLeft {
                    print("noRight -- down")
                    let downCost = costOfGoDown(tempDice, positionArray[nowProcess], map)
                    let newMap = hasPassed(position: nowPosition, map: map)
                    let (newDice, newPosition) = diceMoveToDown(tempDice, positionArray[nowProcess])
                    costSumArray[nowProcess] += downCost//新コスト
                    diceArray[nowProcess] = newDice//新サイコロ
                    positionArray[nowProcess] = newPosition//新座標
                    mapArray[nowProcess] = newMap
                }else if canGoDown && (canGoLeft) {//add
                    print("noRight -- down add")
                    let downCost = costOfGoDown(tempDice, positionArray[nowProcess], map)
                    let newMap = hasPassed(position: nowPosition, map: map)
                    let (newDice2, newPosition2) = diceMoveToDown(tempDice, positionArray[nowProcess])
                    costSumArray.append(tempCost + downCost)
                    diceArray.append(newDice2)
                    positionArray.append(newPosition2)
                    mapArray.append(newMap)
                    count += 1
                }
                if canGoAbove && !canGoLeft && !canGoDown {
                    print("noRight -- above")
                    let aboveCost = costOfGoAbove(tempDice, positionArray[nowProcess], map)
                    let newMap = hasPassed(position: nowPosition, map: map)
                    let (newDice, newPosition) = diceMoveToAbove(tempDice, positionArray[nowProcess])
                    costSumArray[nowProcess] += aboveCost//新コスト
                    diceArray[nowProcess] = newDice//新サイコロ
                    positionArray[nowProcess] = newPosition//新座標
                    mapArray[nowProcess] = newMap
                }else if canGoAbove && (canGoLeft || canGoDown) {//add
                    print("noRight -- above add")
                    let aboveCost = costOfGoAbove(tempDice, positionArray[nowProcess], map)
                    let newMap = hasPassed(position: nowPosition, map: map)
                    let (newDice2, newPosition2) = diceMoveToAbove(tempDice, positionArray[nowProcess])
                    costSumArray.append(tempCost + aboveCost)
                    diceArray.append(newDice2)
                    positionArray.append(newPosition2)
                    mapArray.append(newMap)
                    count += 1
                }
            }else if whereToGo == .noLeft {
                let tempCost = costSumArray[nowProcess]
                let (tempDice, tempPosition, tempMap) = (diceArray[nowProcess], positionArray[nowProcess], mapArray[nowProcess])
                let (canGoRight,canGoAbove, canGoDown) = (canGoToRight(nowPosition),
                                                         canGoToAbove(nowPosition),
                                                         canGoToDown(nowPosition))
                if !canGoDown && !canGoAbove {//周りが全部移動した
                    print("noLeft -- break")
                    costSumArray[nowProcess] = -1
                    break
                }
                if canGoRight {
                    print("noLeft -- right")
                    let rightCost = costOfGoRight(tempDice, tempPosition, map)
                    let newMap = hasPassed(position: nowPosition, map: map)
                    let (newDice, newPosition) = diceMoveToRight(tempDice, tempPosition)
                    costSumArray[nowProcess] += rightCost//新コスト
                    diceArray[nowProcess] = newDice//新サイコロ
                    positionArray[nowProcess] = newPosition//新座標
                    mapArray[nowProcess] = newMap
                }
                
                if canGoDown && !canGoRight {
                    print("noLeft -- down")
                    let downCost = costOfGoDown(tempDice, tempPosition, map)
                    let newMap = hasPassed(position: nowPosition, map: map)
                    let (newDice, newPosition) = diceMoveToDown(tempDice, tempPosition)
                    costSumArray[nowProcess] += downCost//新コスト
                    diceArray[nowProcess] = newDice//新サイコロ
                    positionArray[nowProcess] = newPosition//新座標
                    mapArray[nowProcess] = newMap
                }else if canGoDown && (canGoRight) {//add
                    print("noLeft -- down add")
                    let downCost = costOfGoDown(tempDice, tempPosition, map)
                    let newMap = hasPassed(position: nowPosition, map: map)
                    let (newDice2, newPosition2) = diceMoveToDown(tempDice, tempPosition)
                    costSumArray.append(tempCost + downCost)
                    diceArray.append(newDice2)
                    positionArray.append(newPosition2)
                    mapArray.append(newMap)
                    count += 1
                }
                if canGoAbove && !canGoRight && !canGoDown {
                    print("noLeft -- above")
                    let aboveCost = costOfGoAbove(tempDice, tempPosition, map)
                    let newMap = hasPassed(position: nowPosition, map: map)
                    let (newDice, newPosition) = diceMoveToAbove(tempDice, tempPosition)
                    costSumArray[nowProcess] += aboveCost//新コスト
                    diceArray[nowProcess] = newDice//新サイコロ
                    positionArray[nowProcess] = newPosition//新座標
                    mapArray[nowProcess] = newMap
                }else if canGoAbove && (canGoRight || canGoDown) {//add
                    print("noLeft -- above add")
                    let aboveCost = costOfGoAbove(tempDice, tempPosition, map)
                    let newMap = hasPassed(position: nowPosition, map: map)
                    let (newDice2, newPosition2) = diceMoveToAbove(tempDice, tempPosition)
                    costSumArray.append(tempCost + aboveCost)
                    diceArray.append(newDice2)
                    positionArray.append(newPosition2)
                    mapArray.append(newMap)
                    count += 1
                }
                
            }else if whereToGo == .noAbove {
                let tempCost = costSumArray[nowProcess]
                let (tempDice, tempPosition, tempMap) = (diceArray[nowProcess], positionArray[nowProcess], mapArray[nowProcess])
                let (canGoLeft, canGoRight, canGoDown) = (canGoToLeft(nowPosition),
                                                                      canGoToRight(nowPosition),                                                                      canGoToDown(nowPosition))
                if !canGoDown && !canGoLeft && !canGoRight {//周りが全部移動した
                    print("noAbove -- break")
                    costSumArray[nowProcess] = -1
                    break
                }
                
                if canGoRight {
                    print("noAbove -- right")
                    let rightCost = costOfGoRight(tempDice, tempPosition, map)
                    let newMap = hasPassed(position: tempPosition, map: map)
                    let (newDice, newPosition) = diceMoveToRight(tempDice, tempPosition)
                    costSumArray[nowProcess] += rightCost//新コスト
                    diceArray[nowProcess] = newDice//新サイコロ
                    positionArray[nowProcess] = newPosition//新座標
                    mapArray[nowProcess] = newMap
                }
                if canGoLeft && !canGoRight {
                    print("noAbove -- left")
                    let leftCost = costOfGoLeft(tempDice, tempPosition, map)
                    let newMap = hasPassed(position: tempPosition, map: map)
                    let (newDice, newPosition) = diceMoveToLeft(tempDice, tempPosition)
                    costSumArray[nowProcess] += leftCost//新コスト
                    diceArray[nowProcess] = newDice//新サイコロ
                    positionArray[nowProcess] = newPosition//新座標
                    mapArray[nowProcess] = newMap
                }else if canGoLeft && canGoRight {//add
                    print("noAbove -- left add")
                    let leftCost = costOfGoLeft(tempDice, tempPosition, map)
                    let newMap = hasPassed(position: tempPosition, map: map)
                    let (newDice2, newPosition2) = diceMoveToLeft(tempDice, tempPosition)
                    costSumArray.append(tempCost + leftCost)
                    diceArray.append(newDice2)
                    positionArray.append(newPosition2)
                    mapArray.append(newMap)
                    count += 1
                }
                
                if canGoDown && !canGoRight && !canGoLeft {
                    print("noAbove -- down")
                    print("ok")
                    let downCost = costOfGoDown(tempDice, tempPosition, map)
                    let newMap = hasPassed(position: nowPosition, map: map)
                    let (newDice, newPosition) = diceMoveToDown(tempDice, tempPosition)
                    costSumArray[nowProcess] += downCost//新コスト
                    diceArray[nowProcess] = newDice//新サイコロ
                    positionArray[nowProcess] = newPosition//新座標
                    mapArray[nowProcess] = newMap
                }else if canGoDown && (canGoLeft || canGoRight) {//add
                    print("noAbove -- down add")
                    print("ok")
                    let downCost = costOfGoDown(tempDice, tempPosition, map)
                    let newMap = hasPassed(position: nowPosition, map: map)
                    let (newDice2, newPosition2) = diceMoveToDown(tempDice, tempPosition)
                    costSumArray.append(tempCost + downCost)
                    diceArray.append(newDice2)
                    positionArray.append(newPosition2)
                    mapArray.append(newMap)
                    count += 1
                }
            }else if whereToGo == .noDown {
                let tempCost = costSumArray[nowProcess]
                let (tempDice, tempPosition, tempMap) = (diceArray[nowProcess], positionArray[nowProcess], mapArray[nowProcess])
                let (canGoLeft, canGoRight, canGoAbove) = (canGoToLeft(nowPosition),
                                                                      canGoToRight(nowPosition),
                                                                      canGoToAbove(nowPosition))
                if !canGoAbove && !canGoLeft && !canGoRight {//周りが全部移動した
                    print("noDown -- break")
                    costSumArray[nowProcess] = -1
                    break
                }
                if canGoRight {
                    print("noDown -- right")
                    let rightCost = costOfGoRight(tempDice, tempPosition, map)
                    let newMap = hasPassed(position: nowPosition, map: map)
                    let (newDice, newPosition) = diceMoveToRight(tempDice, tempPosition)
                    costSumArray[nowProcess] += rightCost//新コスト
                    diceArray[nowProcess] = newDice//新サイコロ
                    positionArray[nowProcess] = newPosition//新座標
                    mapArray[nowProcess] = newMap
                }
                if canGoLeft && !canGoRight {
                    print("noDown -- left")
                    let leftCost = costOfGoLeft(tempDice, tempPosition, map)
                    let newMap = hasPassed(position: nowPosition, map: map)
                    let (newDice, newPosition) = diceMoveToLeft(tempDice, tempPosition)
                    costSumArray[nowProcess] += leftCost//新コスト
                    diceArray[nowProcess] = newDice//新サイコロ
                    positionArray[nowProcess] = newPosition//新座標
                    mapArray[nowProcess] = newMap
                }else if canGoLeft && canGoRight {//add
                    print("noDown -- left add")
                    let leftCost = costOfGoLeft(tempDice, tempPosition, map)
                    let newMap = hasPassed(position: nowPosition, map: map)
                    let (newDice2, newPosition2) = diceMoveToLeft(tempDice, tempPosition)
                    costSumArray.append(tempCost + leftCost)
                    diceArray.append(newDice2)
                    positionArray.append(newPosition2)
                    mapArray.append(newMap)
                    count += 1
                }
                
                if canGoAbove && !canGoRight && !canGoLeft {
                    print("noDown -- above")
                    let aboveCost = costOfGoAbove(tempDice, tempPosition, map)
                    let newMap = hasPassed(position: nowPosition, map: map)
                    let (newDice, newPosition) = diceMoveToAbove(tempDice, tempPosition)
                    costSumArray[nowProcess] += aboveCost//新コスト
                    diceArray[nowProcess] = newDice//新サイコロ
                    positionArray[nowProcess] = newPosition//新座標
                    mapArray[nowProcess] = newMap
                }else if canGoAbove && (canGoRight || canGoLeft) {//add
                    print("noDown -- above add")
                    let aboveCost = costOfGoAbove(tempDice, tempPosition, map)
                    let newMap = hasPassed(position: nowPosition, map: map)
                    let (newDice2, newPosition2) = diceMoveToAbove(tempDice, tempPosition)
                    costSumArray.append(tempCost + aboveCost)
                    diceArray.append(newDice2)
                    positionArray.append(newPosition2)
                    mapArray.append(newMap)
                    count += 1
                }
            }else if whereToGo == .downRight {
                let tempCost = costSumArray[nowProcess]
                let (tempDice, tempPosition, tempMap) = (diceArray[nowProcess], positionArray[nowProcess], mapArray[nowProcess])
                let (canGoRight, canGoDown) = (canGoToRight(nowPosition),canGoToDown(nowPosition))
                if !canGoDown && !canGoRight {//周りが全部移動した
                    print("downRight-- break")
                    costSumArray[nowProcess] = -1
                    break
                }
                if canGoRight {
                    print("downRight -- right")
                    let rightCost = costOfGoRight(tempDice, tempPosition, map)
                    let newMap = hasPassed(position: nowPosition, map: map)
                    let (newDice, newPosition) = diceMoveToRight(tempDice, tempPosition)
                    costSumArray[nowProcess] += rightCost//新コスト
                    diceArray[nowProcess] = newDice//新サイコロ
                    positionArray[nowProcess] = newPosition//新座標
                    mapArray[nowProcess] = newMap
                }
                
                if canGoDown && !canGoRight {
                    print("downRight -- down")
                    let downCost = costOfGoDown(tempDice, tempPosition, map)
                    let newMap = hasPassed(position: nowPosition, map: map)
                    let (newDice, newPosition) = diceMoveToDown(tempDice, tempPosition)
                    costSumArray[nowProcess] += downCost//新コスト
                    diceArray[nowProcess] = newDice//新サイコロ
                    positionArray[nowProcess] = newPosition//新座標
                    mapArray[nowProcess] = newMap
                }else if canGoDown && (canGoRight) {//add
                    print("downRight -- down add")
                    let downCost = costOfGoDown(tempDice, tempPosition, map)
                    let newMap = hasPassed(position: nowPosition, map: map)
                    let (newDice2, newPosition2) = diceMoveToDown(tempDice, tempPosition)
                    costSumArray.append(tempCost + downCost)
                    diceArray.append(newDice2)
                    positionArray.append(newPosition2)
                    mapArray.append(newMap)
                    count += 1
                }
            }
            /*if whereToGo == Direction.right {
                let rightCost = costOfGoRight(diceArray[nowProcess], positionArray[nowProcess], map)
                print("right", terminator: " ")
                //移動する時、サイコロと座標を更新する
                //コストをコストにプラスする
                let (newDice, newPosition) = diceMoveToRight(diceArray[nowProcess], positionArray[nowProcess])
                costSumArray[nowProcess] += rightCost//新コスト
                diceArray[nowProcess] = newDice//新サイコロ
                positionArray[nowProcess] = newPosition//新座標
                print("nowProcess:\(nowProcess)  cost:\(costSumArray[nowProcess]), newDice:\(diceArray[nowProcess]), newPositon\(positionArray[nowProcess])")
            }else if whereToGo == Direction.down {
                let downCost = costOfGoDown(diceArray[nowProcess], positionArray[nowProcess], map)
                print("down", terminator: " ")
                let (newDice, newPosition) = diceMoveToDown(diceArray[nowProcess], positionArray[nowProcess])
                costSumArray[nowProcess] += downCost
                diceArray[nowProcess] = newDice
                positionArray[nowProcess] = newPosition
                print("nowProcess:\(nowProcess)  cost:\(costSumArray[nowProcess]), newDice:\(diceArray[nowProcess]), newPositon\(positionArray[nowProcess])")
            }else {
                let (rightCost, downCost) = (costOfGoRight(diceArray[nowProcess], positionArray[nowProcess], map), costOfGoDown(diceArray[nowProcess], positionArray[nowProcess], map))
                print("both", terminator: " ")
                let (tempDice, tempPosition) = (diceArray[nowProcess], positionArray[nowProcess])
                let tempCost = costSumArray[nowProcess]
                //どっちでもいい場合、先に右へ
                let (newDice, newPosition) = diceMoveToRight(tempDice, tempPosition)
                print("\n----最初に右へ", terminator: "")
                costSumArray[nowProcess] += rightCost
                diceArray[nowProcess] = newDice
                positionArray[nowProcess] = newPosition
                print("nowProcess:\(nowProcess)  cost:\(costSumArray[nowProcess]), newDice:\(diceArray[nowProcess]), newPositon\(positionArray[nowProcess])")
                
                //下への新しいポジションを作る
                let (newDice2, newPosition2) = diceMoveToDown(tempDice, tempPosition)
                print("----次に下へ", terminator: "")
                costSumArray.append(tempCost + downCost)
                diceArray.append(newDice2)
                positionArray.append(newPosition2)
                count += 1
                //let newNowProcess = nowProcess + 1
                //print("nowProcess:\(newNowProcess)  cost:\(costSumArray[newNowProcess]), newDice:\(diceArray[newNowProcess]), newPositon\(positionArray[newNowProcess])")
            
            }*/
            
            /*let (_, whereToGo) = isTouchedEdge(positionArray[nowProcess])
            print(whereToGo)
            if whereToGo == Direction.right {
                let rightCost = costOfGoRight(diceArray[nowProcess], positionArray[nowProcess], map)
                print("right", terminator: " ")
                //移動する時、サイコロと座標を更新する
                //コストをコストにプラスする
                let (newDice, newPosition) = diceMoveToRight(diceArray[nowProcess], positionArray[nowProcess])
                costSumArray[nowProcess] += rightCost//新コスト
                diceArray[nowProcess] = newDice//新サイコロ
                positionArray[nowProcess] = newPosition//新座標
                print("nowProcess:\(nowProcess)  cost:\(costSumArray[nowProcess]), newDice:\(diceArray[nowProcess]), newPositon\(positionArray[nowProcess])")
            }else if whereToGo == Direction.down {
                let downCost = costOfGoDown(diceArray[nowProcess], positionArray[nowProcess], map)
                print("down", terminator: " ")
                let (newDice, newPosition) = diceMoveToDown(diceArray[nowProcess], positionArray[nowProcess])
                costSumArray[nowProcess] += downCost
                diceArray[nowProcess] = newDice
                positionArray[nowProcess] = newPosition
                print("nowProcess:\(nowProcess)  cost:\(costSumArray[nowProcess]), newDice:\(diceArray[nowProcess]), newPositon\(positionArray[nowProcess])")
            }else {
                let (rightCost, downCost) = (costOfGoRight(diceArray[nowProcess], positionArray[nowProcess], map), costOfGoDown(diceArray[nowProcess], positionArray[nowProcess], map))
                print("both", terminator: " ")
                let (tempDice, tempPosition) = (diceArray[nowProcess], positionArray[nowProcess])
                let tempCost = costSumArray[nowProcess]
                //どっちでもいい場合、先に右へ
                let (newDice, newPosition) = diceMoveToRight(tempDice, tempPosition)
                print("\n----最初に右へ", terminator: "")
                costSumArray[nowProcess] += rightCost
                diceArray[nowProcess] = newDice
                positionArray[nowProcess] = newPosition
                print("nowProcess:\(nowProcess)  cost:\(costSumArray[nowProcess]), newDice:\(diceArray[nowProcess]), newPositon\(positionArray[nowProcess])")
                
                //下への新しいポジションを作る
                let (newDice2, newPosition2) = diceMoveToDown(tempDice, tempPosition)
                print("----次に下へ", terminator: "")
                costSumArray.append(tempCost + downCost)
                diceArray.append(newDice2)
                positionArray.append(newPosition2)
                count += 1
                let newNowProcess = nowProcess + 1
                print("nowProcess:\(newNowProcess)  cost:\(costSumArray[newNowProcess]), newDice:\(diceArray[newNowProcess]), newPositon\(positionArray[newNowProcess])")*/
            
            
            
            
                
                /*if !isArrived(positionArray[newNowProcess]) {
                    print("判断中")
                    getAllCostSum(newNowProcess)//新しい走り方を作る
                }*/
                //------------------------------------------------------------------------------------------
            //}
        }
        print("thank you!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
        print("PostionArray:\(positionArray)\nDiceArray:\(diceArray)\nCostSumArray:\(costSumArray)")
        //count += 1
        self.nowProcess += 1
        return true
        
        //if positionArray.count != 0 {//すべてのポジションを計算済むまで
            /*while !isArrived(position) {
                //いまのポジションを終わらせるまで
                //終わったら次のポジションへ
                let (whereToGo, cost) = decideWhereToGo(dice, position, map)
                if whereToGo == Direction.right {
                    let (newDice, newPosition) = diceMoveToRight(dice, position)
                    costSumArray[nowProcess] += cost
                    diceArray[nowProcess] = newDice
                    positionArray[nowProcess] = newPosition
                    getAllCostSum(diceArray[nowProcess], positionArray[nowProcess], map, nowProcess)
                }else if whereToGo == Direction.down {
                    let (newDice, newPosition) = diceMoveToDown(dice, position)
                    costSumArray[nowProcess] += cost
                    diceArray[nowProcess] = newDice
                    positionArray[nowProcess] = newPosition
                    getAllCostSum(diceArray[nowProcess], positionArray[nowProcess], map, nowProcess)
                }else {
                    //どっちでもいい場合、先に右へ
                    let (newDice, newPosition) = diceMoveToRight(dice, position)
                    costSumArray[nowProcess] += cost
                    diceArray[nowProcess] = newDice
                    positionArray[nowProcess] = newPosition
                    getAllCostSum(diceArray[nowProcess], positionArray[nowProcess], map, nowProcess)
                    //下への新しいポジションを作る
                    let (newDice2, newPosition2) = diceMoveToDown(dice, position)
                    costSumArray.append(costSumArray[nowProcess])
                    diceArray.append(newDice2)
                    positionArray.append(newPosition2)
                    let newNowProcess = nowProcess + 1
                    getAllCostSum(diceArray[newNowProcess], positionArray[newNowProcess], map, newNowProcess)
                    //------------------------------------------------------------------------------------------
                }
            }*/
            //positionArray.remove(at: nowProcess)
        //}
    }
    //------------------------------------------------------------------------------------------------
    //------------------------------------------------------------------------------------------------
    //結果を求める
    private func getCostSumArray() -> [Int] {
        repeat {
            getAllCostSum(nowProcess)
        }while nowProcess < costSumArray.count
        return costSumArray
    }
    func getCostSumArrayResult() -> [Int] {
        return outArray
    }
    private func getSmallestCost(_ costSumArray: [Int]) -> Int {
        var smallestNumTemp = 0
        for i in costSumArray {
            if i >= 0 {
                smallestNumTemp = costSumArray[0]
                break
            }
        }
        for i in costSumArray {
            if i >= 0 {
                if smallestNumTemp > i {
                    smallestNumTemp = i
                }
            }
        }
        return smallestNumTemp
    }
    func getTheResultOfSmallestCost() -> Int {
        let array = getCostSumArray()
        outArray = array
        return getSmallestCost(array)
    }
    //------------------------------------------------------------------------------------------------
    //内部プロパティを取得
    func getDiceArray() -> [Dice] {
        return diceArray
    }
    /*func getStartProcess() -> Int {
        return startProcess
    }*/
    func getMap() -> Map {
        return map
    }
    func getPositionArray() -> [Positon] {
        return positionArray
    }
    /*func getCostSumArray() -> [Int] {
        return costSumArray
    }*/
    func getHW() -> (Int, Int)
    {
        return (h, w)
    }
    //------------------------------------------------------------------------------------------------
    
}
//------------------------------------------------------------------------------------------
//var dicePosition: Dice = ([1,2,3,4], [1,2,3,4])
//print(dicePosition.horizontalData[0])
//--------------------------------------
//playgroundのための删除
/*let commandLineMessage = readDataFromInput()
print(commandLineMessage.getStringLine())
print(commandLineMessage.getMapData())
let map = commandLineMessage.getMapData()
let dice = commandLineMessage.getDiceData()
print(map,dice)*/
//--------------------------------------
//let costArray = moveDiceAndCalculateCost(dice, map)
let dice = ([4,1,3],[2,1,5],6)
let mapArray2 = [[6,4,6,3],[3,5,6,2],[1,4,6,3]]//入力例2
let mapArray1 = [[1, 4, 6, 3], [1, 2, 6, 1], [3, 4, 6, 3]] //入力例１
let mapArray3 = [[4,5,3], [5,1,2], [2,3,6]]
let mapArray4 = [[4,5,3], [3,1,2], [2,3,6], [3,2,6], [2,3,6], [2,3,6], [2,3,6], [3,2,6], [2,3,6], [2,3,6], [5,1,2], [5,1,2]]
let mapArray5 = [[1, 4, 2], [2, 6, 5], [4, 5, 3]]
let costArray = moveDiceAndCalculateCost(dice, mapArray1)
//print(costArray.getCostSumArray())
//print("startProcess: ", costArray.getStartProcess())
print("positonArray: ",costArray.getPositionArray())
print("diceArray: ", costArray.getDiceArray())
print("(h,w) = ", costArray.getHW())
//print("costSumArray :", costArray.getCostSumArray())
//print(costArray.diceMoveToDown(costArray.diceArray[0], costArray.positionArray[0]))
//print(costArray.decideWhereToGo(costArray.diceArray[0], costArray.positionArray[0], costArray.map))
print("\n\n\n")
print("-------------output-------------")
print(costArray.getTheResultOfSmallestCost())
print(costArray.getCostSumArrayResult(),costArray.getCostSumArrayResult().count)
