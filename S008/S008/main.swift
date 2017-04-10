//
//  main.swift
//  S008
//
//  Created by 徐伟达 on 2017/3/14.
//  Copyright © 2017年 徐伟达. All rights reserved.
//

import Foundation

print("Hello, World!")
if let str = readLine() {
    print(str)
}
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
    }
    
    private func diceMoveToRight(_ dice: Dice, _ position: Positon) -> (Dice, Positon) {
        //右へと移動する
        //サイコロの状態と新しい位置を返す
        var newDiceStatus = dice
        var newPositionStatus = position
        newDiceStatus.horizontalData = [dice.backSide, dice.horizontalData[0], dice.horizontalData[1]]
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
        newDiceStatus.backSide = dice.verticalData[2]
        newPositionStatus.y += 1
        return (newDiceStatus, newPositionStatus)
    }
    
    private func decideWhereToGo(_ dice: Dice, _ position: Positon, _ map: Map) -> (Direction, Cost) {
        //どこへ移動すればよいかを判断
        if position.x >= w {
            let downCost = toGetCost(dice.verticalData[0], map[position.y+1][position.x])
            return (Direction.down, downCost)
        }
        if position.y >= h {
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
    }
    
    private func toGetCost(_ num1:Int, _ num2: Int) -> Int {
        //コストを計算する
        return num1 > num2 ?  (num1-num2):(num2-num1)
    }
    
    //右下に到達するかどうかを判断
    private func isArrived(_ position: Positon) -> Bool {
        if position.y == h && position.x == w {
            return true
        }
        return false
    }
    
    //移動とともにコスト計算をする関数
    //この関数のための変数
    private var costSumArray: [Int] = [0]
    private var positionArray: [Positon] = [(0,0)]
    private var diceArray: [Dice] // 初期化の時に
    private let startProcess = 0
    private func getAllCostSum(_ dice: Dice, _ position: Positon, _ map: Map, _ nowProcess: Int){
        //private func getAllCostSum(_ dice:inout Dice, _ position: inout Positon, _ map: Map, _ nowProcess: Int){
        //private func getAllCostSum(nowProcess: Int){
        //まだ計算する必要のあるポジションを全部終わらせるまで再帰呼び出しを繰り返す
        //最初のポジションから
        
        if positionArray.count != 0 {//すべてのポジションを計算済むまで
            while !isArrived(position) {
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
            }
            positionArray.remove(at: nowProcess)
        }
    }
    
    func getCostSumArray() -> [Int] {
        //getAllCostSum(diceArray[0], positionArray[0], map, startProcess)
        return costSumArray
    }
    func getDiceArray() -> [Dice] {
        return diceArray
    }
    func getStartProcess() -> Int {
        return startProcess
    }
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
    
}
//------------------------------------------------------------------------------------------
//var dicePosition: Dice = ([1,2,3,4], [1,2,3,4])
//print(dicePosition.horizontalData[0])
//--------------------------------------
//playground 删除
 /*let commandLineMessage = readDataFromInput()
 print(commandLineMessage.getStringLine())
 print(commandLineMessage.getMapData())
 let map = commandLineMessage.getMapData()
 let dice = commandLineMessage.getDiceData()
 print(map,dice)*/
//--------------------------------------
/*let costArray = moveDiceAndCalculateCost(([4,1,3],[2,1,5],6), [[1, 4, 6, 3], [1, 2, 6, 1], [3, 4, 6, 3]])
//print(costArray.getCostSumArray())
print("diceArray: ", costArray.getDiceArray())
print("(h,w) = ", costArray.getHW())
print("costSumArray :", costArray.getCostSumArray())
print("positonArray: ",costArray.getPositionArray())
print("startProcess: ", costArray.getStartProcess())*/
//print(costArray.diceMoveToDown(costArray.diceArray[0], costArray.positionArray[0]))
//print(costArray.decideWhereToGo(costArray.diceArray[0], costArray.positionArray[0], costArray.map))
//print(costArray.getCostSumArray())
