//: Playground - noun: a place where people can play

import UIKit
typealias StartPoint = (x: Double, y: Double, z: Double)
typealias Length = (xLength: Double, yLength: Double, zLength: Double)
typealias XYRange = (xMin: Double, xMax: Double, yMin: Double, yMax: Double)
typealias RectangleInfo = (startPoint: StartPoint, length: Length)
typealias RectangleInfoArray = [RectangleInfo]
typealias Overlapped3DAreas = [Int : (Int, Int)] //重なった面積、　重なったzの範囲
//typealias Overlapped3DAreas = [Double : (Double, Double)] //重なった面積、　重なったzの範囲
typealias ZRange = (zMin: Double, zMax: Double)

class readInputString {
    private var stringInput: [String] = []
    private var amount: Int = 0
    private var dataArray: RectangleInfoArray = []
    init() {
        //stringInput = readInput()
        stringInput = ["2", "3 0 0 1 2 2", "2 0 1 2 2 1"]
        readInputToMyData(stringInput)
    }
    private func readInput() -> [String] {
        var stringArray: [String] = []
        while let str = readLine() {
            stringArray.append(str)
        }
        return stringArray
    }
    private func readInputToMyData(_ strArr: [String]) {
        amount = Int(strArr[0])!
        var valueArray: [Double] = []
        for i in 1..<amount+1 {
            var valueTemp = ""
            for char in strArr[i].characters {
                if char != " "{
                    valueTemp.append(char)
                }else {
                    valueArray.append(Double(valueTemp)!)
                    valueTemp = ""
                }
            }
            valueArray.append(Double(valueTemp)!)
            let startPoint = (valueArray[0], valueArray[1], valueArray[2])
            let length = (valueArray[3], valueArray[4], valueArray[5])
            dataArray.append((startPoint, length))
            valueArray = []
        }
    }
    func getMyDataArray() -> RectangleInfoArray {
        return dataArray
    }
    func getDataAmount() -> Int {
        return amount
    }
    func getInputStringArray() -> [String] {
        return stringInput
    }
}


class CalculatieComplexArea {
    private let amount: Int
    private let dataArray: RectangleInfoArray
    init(_ amount: Int, _ dataArray: RectangleInfoArray) {
        self.amount = amount
        self.dataArray = dataArray
    }
    
    private func calculateArea(_ range: XYRange) -> Double {
        //面積を計算
        let xLength = getPlusNumOfMinus(range.xMax, range.xMin)
        let yLength = getPlusNumOfMinus(range.yMax, range.yMin)
        return xLength*yLength
    }
    private func calculateArea(_ xL: Double, _ yL: Double) -> Double {
        //面積を計算
        return xL*yL
    }
    private func calculateXYSite(_ rectInformation: RectangleInfo)
        -> (XYRange, zRange: (zMin: Double, zMax: Double)) {
        //XYの範囲とZの範囲を返す
        let (x, y, z) = (rectInformation.startPoint.x, rectInformation.startPoint.y, rectInformation.startPoint.z)
        let (xL, yL, zL) = (rectInformation.length.xLength, rectInformation.length.yLength, rectInformation.length.zLength)
        let (xMin, xMax, yMin, yMax) = (x, x+xL, y, y+yL)
        let returnXYR = (xMin, xMax, yMin, yMax)
        let zMax = z + zL
        return (returnXYR, (z, zMax))
        
    }
    private func isZOverlapped(_ zRange1: (zMin: Double, zMax: Double), _ zRange2: (zMin: Double, zMax: Double)) -> (Bool, (zMin: Double, zMax: Double)) {
        //zが重なるかどうかを判断
        //重なった場合、重なった範囲をも返す
        let isFOT = zRange1.zMin > zRange2.zMax
        let isTOF = zRange2.zMin > zRange1.zMax
        if isFOT || isTOF {
            return (false, (-1.0, -1.0))
        }
        if isFOT {
            return (true, (zRange1.zMin, zRange2.zMax))
        }else {
            return (true, (zRange2.zMin, zRange1.zMax))
        }
    }
    private func isXYOverlappedAreas(_ xyRange1: XYRange, _ xyRange2: XYRange) -> (Bool, Double) {
        //XYが重なるかどうかを判断
        //重なった場合、重なった面積
        let isXFOT = xyRange1.xMin > xyRange2.xMax
        let isXTOF = xyRange2.xMin > xyRange1.xMax
        let isXO = !(isXFOT || isXTOF)
        let isYFOT = xyRange1.yMin > xyRange2.yMax
        let isYTOF = xyRange2.yMin > xyRange1.yMax
        let isYO = !(isYFOT || isYTOF)
        let isOverlapped = isXO && isYO
        if isOverlapped {
            var xL, yL: Double
            //重なったxの長さを計算
            if (xyRange1.xMax < xyRange2.xMax) && (xyRange1.xMin < xyRange2.xMin) && (xyRange1.xMax > xyRange2.xMin) {
                //1が左から２と重なる
                xL = getPlusNumOfMinus(xyRange1.xMax, xyRange2.xMin)
            }else if (xyRange1.xMax > xyRange2.xMax) && (xyRange1.xMin > xyRange2.xMin) && (xyRange1.xMin < xyRange2.xMax) {
                //1が右から２と重なる
                xL = getPlusNumOfMinus(xyRange1.xMin, xyRange2.xMax)
            }else {
                //1が２に含まれるまたは逆
                let (xL1, xL2) = (getPlusNumOfMinus(xyRange1.xMax, xyRange1.xMin), getPlusNumOfMinus(xyRange2.xMax, xyRange2.xMin))
                xL = xL1 > xL2 ? xL2: xL1
            }
            if (xyRange1.yMax < xyRange2.yMax) && (xyRange1.yMin < xyRange2.yMin) && (xyRange1.yMax > xyRange2.yMin) {
                //1が下から２と重なる
                yL = getPlusNumOfMinus(xyRange1.yMax, xyRange2.yMin)
            }else if (xyRange1.yMax > xyRange2.yMax) && (xyRange1.yMin > xyRange2.yMin) && (xyRange1.yMin < xyRange2.yMax) {
                //1が上から２と重なる
                yL = getPlusNumOfMinus(xyRange1.yMin, xyRange2.yMax)
            }else {
                //1が２に含まれるまたは逆
                let (yL1, yL2) = (getPlusNumOfMinus(xyRange1.yMax, xyRange1.yMin), getPlusNumOfMinus(xyRange2.yMax, xyRange2.yMin))
                yL = yL1 > yL2 ? yL2: yL1
            }
            return (true, calculateArea(xL, yL))
        }else {
            return (false, 0.0)
        }
    }
    func getDataArray() -> RectangleInfoArray {
        return dataArray
    }
    private func calLSZNum(_ allRectInfo: RectangleInfoArray) -> (min: Int, max: Int) {
        //Zの最大値と最小値を返す
        var zMax = 0.0
        var zMin = 0.0
        var isFirstTrun = true
        for rectInfo in allRectInfo {
            let (_, zRange) = calculateXYSite(rectInfo)
            let (zSmallest, zLargest) = (Double(zRange.zMin), Double(zRange.zMax))
            if zMax < zLargest {
                zMax = zLargest
            }
            if isFirstTrun {
                isFirstTrun = false
                zMin = zSmallest
            }
            if zMin > zSmallest {
                zMin = zSmallest
            }
        }
        return (Int(zMin), Int(zMax))
        
    }
    private func getPlusNumOfMinus(_ dNum1: Double, _ dNum2: Double) -> Double {
        //差の絶対値を返す
        return dNum1 > dNum2 ? dNum1-dNum2:dNum2-dNum1
    }
    private func isInRange(_ target: Double, _ min: Double, _ max: Double) -> Bool {
        let (target, min, max) = (Int(target), Int(min), Int(max))
        if target >= min && target <= max {
            return true
        }
        return false
    }
    private func calculateOverlappingArea(_ rect1: RectangleInfo, _ rect2: RectangleInfo) -> Overlapped3DAreas {
        //二つの長方形の重なった面積とzの重なった範囲を返す
        let (xyRange1, zRange1) = calculateXYSite(rect1)
        let (xyRange2, zRange2) = calculateXYSite(rect2)
        //  zが重なるかどうか　　　　zの重なった範囲
        let (isOverlappedAtZ, overlappedZArea) = isZOverlapped(zRange1, zRange2)
        if !isOverlappedAtZ {
            return [0 : (0,0)]
        }
        let (zMin, zMax) = (Int(overlappedZArea.zMin), Int(overlappedZArea.zMax)) //zMin zMax 重なった部分の最小値と最大値
        var overlapped3DAreas: Overlapped3DAreas = [:] //重なった面積とzの範囲
        let (isXYOverLapped, areas) = isXYOverlappedAreas(xyRange1, xyRange2)
        if !isXYOverLapped {
            return [0: (0,0)]
        }else {
            overlapped3DAreas = [Int(areas): (zMin, zMax)]
            return overlapped3DAreas
        }
        
    }
     func calOverlappedAllAreasAndTrueOut(_ allRectInfo: RectangleInfoArray) -> (overlapped: Int, answer: Int) {
        var overlappedAreas: Double = 0
        var output: Double = 0
        var xyRangeArray: [XYRange] = []
        var zRangeArray: [ZRange] = []
        for i in 0..<amount {//全ての長方形の体積をそのまま足しておく
            
            let (nowXYRange, nowZRange) = calculateXYSite(allRectInfo[i])
            xyRangeArray.append(nowXYRange)
            zRangeArray.append(nowZRange)
            output += calculateArea(nowXYRange)*(getPlusNumOfMinus(nowZRange.zMax, nowZRange.zMin))
        }
        while xyRangeArray.count != 0 {
            
        }
        /*for nowturn in 1..<amount {
            var prefixs = 1
            if nowturn%2 == 1 {
                prefixs = -1
            }else {
                prefixs = 1
            }
            var nowTurnOverlappedOut: Double = 0
            for nowTarNum in 0..<amount-1 {//nowturn より一つ多くのやつを比較
                //nowTarNum は今操作しているやつの番号
                for i in 0..<nowturn +1 {//nowtrun + 1個の重複計算
                    
                }
                
            }
        }*/
        return (0, Int(output))
    }
    var combination: []
    private func chooseR(_ allRectInfo: RectangleInfoArray, _ r: Int, _ n: Int) -> Double {
        for i in 0..<amount {
            
        }
    }
}
var testRead = readInputString()
print(testRead.getInputStringArray())
print(testRead.getDataAmount(),testRead.getMyDataArray())
var output = CalculatieComplexArea(testRead.getDataAmount(), testRead.getMyDataArray())
//output.calculateOverlappingArea(output.getDataArray()[0], output.getDataArray()[1])
output.calOverlappedAllAreasAndTrueOut(output.getDataArray())
