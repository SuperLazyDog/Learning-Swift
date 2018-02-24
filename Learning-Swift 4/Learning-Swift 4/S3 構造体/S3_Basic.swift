//
//  S3_Basic.swift
//  Learning-Swift 4
//
//  Created by 徐伟达 on 2018/2/19.
//  Copyright © 2018年 徐伟达. All rights reserved.
//

import Foundation

//------------------------------------------------------------------
//                         テスト関数
//------------------------------------------------------------------
func S3BasicTest() {
	print("//-------------------------------------------")
	print("//                S3 構造体")
	print("//-------------------------------------------")
	//---------------------------------------------
	//               構造体の定義
	//---------------------------------------------
	struct MyTest3_1 {
		var intA: Int
		var intB: Int
		var isNeedUpdata: Bool
		
		init(asDefault _: Bool) {
			self.intA = 1
			self.intB = 1
			isNeedUpdata = false;
		}
		
		init(intA a: Int, intB b: Int) {
			self.init(asDefault: true)
			isNeedUpdata = !isNeedUpdata ? !isNeedUpdata : isNeedUpdata
			self.intA = a
			self.intB = b
		}
	}
	//---------------------------------------------
	//                メソッド
	//---------------------------------------------
	let myTest3_2 = MyTest3_2.init()
	!myTest3_2
	print(myTest3_2 + 100)
	//---------------------------------------------
	//                プロパティ
	//---------------------------------------------
	struct MyTest3_3 {
		var a: Int = 1, b: Int = 2
		var sum: Int {
//			mutating get {
			get {
				return a + b
			}
			set {
				a += newValue
			}
		}
	}
	var myTest3_3: MyTest3_3 = MyTest3_3.init()
	print("Sum1: \(myTest3_3.sum), a: \(myTest3_3.a), b: \(myTest3_3.b)")
	//               100 + 3 = 103
	myTest3_3.sum = (100 + myTest3_3.sum)
	//上一行相当于 myTest3_3.sum = 103
	
	print("Sum2: \(myTest3_3.sum), a: \(myTest3_3.a), b: \(myTest3_3.b)")
//	let myTest3_3_v2 = myTest3_3
//	myTest3_3_v2.sum
	// 监听器
	var myTest3_4: Int = 1 {
		willSet {
			print("newValue: \(newValue)")
		}
		didSet {
			print("oldValue \(oldValue)")
		}
	}
	myTest3_4 = 3
	
}

//------------------------------------------------------------------
//                     3.2メソッド　補助エリア
//------------------------------------------------------------------
struct MyTest3_2 {
	var a: Int = 999;
	//运算符定义
	static prefix func !(item: MyTest3_2) {
		print("a + 1 = \(item.a+1), hello")
	}
	static func +(lhs: MyTest3_2, rhs: Int) -> String {
		let str: String = "\(lhs.a) + \(rhs) = \(lhs.a + rhs)"
		return str
	}
	static func +=(lhs: MyTest3_2, rhs: Int) -> String {
		let str: String = "\(lhs.a) + \(rhs) = \(lhs.a + rhs)"
		return str
	}
}

//------------------------------------------------------------------
//                    プロパティ　補助エリア
//------------------------------------------------------------------
//全局范围也可以定义计算型属性
var auxVal3_2 = 1 // auxiliary adj. 辅助的
var globalProperty3_2: Int {
	get {
		return auxVal3_2*auxVal3_2
	}
	set {
		auxVal3_2 += newValue
	}
}

//------------------------------------------------------------------
//                    ....　補助エリア
//------------------------------------------------------------------
