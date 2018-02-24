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
	//               メソッド
	//---------------------------------------------
	let myTest3_2 = MyTest3_2.init()
	!myTest3_2
	print(myTest3_2 + 100)
	//---------------------------------------------
	//               プロパティ
	//---------------------------------------------
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
//                    ....　補助エリア
//------------------------------------------------------------------
