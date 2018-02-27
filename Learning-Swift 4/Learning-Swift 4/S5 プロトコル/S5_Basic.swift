//
//  S5_Basic.swift
//  Learning-Swift 4
//
//  Created by 徐伟达 on 2018/2/27.
//  Copyright © 2018年 徐伟达. All rights reserved.
//

import Foundation

//------------------------------------------------------------------
//                         テスト関数
//------------------------------------------------------------------
func S5BasicTest() {
	print("//-------------------------------------------")
	print("//                S5 プロトコル")
	print("//-------------------------------------------")
	//---------------------------------------------
	//                 プロトコル
	//---------------------------------------------
	struct MyTest5_1: SampleProtocol { // 采用上面协议的结构体
		var sampleString: String {
			return "sample protocol 5.1"
		}
	}
	let myTest5_1: MyTest5_1 = MyTest5_1()
	print(myTest5_1.sampleString)
	//---------------------------------------------
	//               プロトコルの宣言
	//---------------------------------------------
	
	//---------------------------------------------
	//              プロトコルと付属型
	//---------------------------------------------
	struct MyTest5_3: SampleProtocol5_2, CustomStringConvertible, CustomDebugStringConvertible {
		var data: Int = 0
		func merge(newOne: MyTest5_3) -> MyTest5_3 {
			return MyTest5_3(data: self.data + newOne.data)
		}
		var description: String {
			return String.init(describing: self.data)
		}
		
		var debugDescription: String {
			return "Debug" + String.init(describing: self.data)
		}
	}
	let myTest5_3: MyTest5_3 = MyTest5_3()
	let myTest5_3_2 = myTest5_3.merge(newOne: MyTest5_3(data: 9))
	print(myTest5_3, myTest5_3_2, separator: "\n")
	
}

//------------------------------------------------------------------
//                    プロトコル　補助エリア
//------------------------------------------------------------------
protocol SampleProtocol {
	var sampleString: String { get }
//	static var sampleString2: String { get }
//	static func + (lhs: Self, rhs: Self) -> Int
}
//------------------------------------------------------------------
//                    プロトコルと付属型　補助エリア
//------------------------------------------------------------------
protocol SampleProtocol5_2 {
	func merge(newOne: Self) -> Self
}

//系统自带protocol: Equatable
//public protocol Equatable {
//	static func ==(lhs:Self, rhs: Self) -> Bool
//}

protocol SampleProtocol5_2_2 {
	associatedtype SampleData: Equatable where SampleData: CustomStringConvertible, SampleData: CustomDebugStringConvertible
}
//------------------------------------------------------------------
//                    ....　補助エリア
//------------------------------------------------------------------
