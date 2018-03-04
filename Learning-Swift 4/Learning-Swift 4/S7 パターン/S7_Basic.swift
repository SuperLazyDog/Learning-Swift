//
//  S7_Basic.swift
//  Learning-Swift 4
//
//  Created by 徐伟达 on 2018/3/5.
//  Copyright © 2018年 徐伟达. All rights reserved.
//

import Foundation

//------------------------------------------------------------------
//                         テスト関数
//------------------------------------------------------------------
func S7BasicTest() {
	print("//-------------------------------------------")
	print("//                S7 パターン")
	print("//-------------------------------------------")
	//---------------------------------------------
	//                 タプルとswitch
	//---------------------------------------------
	
	//---------------------------------------------
	//                  列挙型
	//---------------------------------------------
	// シンプルな列挙型
	enum Sample1 {
		case a, b, c, d
	}
	
	// メソッドの定義
	enum Sample2: CustomStringConvertible {
		case a, b, c, d
		func getNext() -> Sample2 {
			switch self {
			case .a:
				return .b
			case .b:
				return .c
			case .c:
				return .d
			case .d:
				return .a
			}
		}
		var description: String {
			return "\(self.hashValue)"
		}
	}
	let myEnumTest2: Sample2 = .a
	print(myEnumTest2)
	print(myEnumTest2.getNext())
	
	// 値型の列挙型
	enum Sample3: Int {
		case a=100, b, c, d
	}
	let myEnumTest3: Sample3 = .d
	print(myEnumTest3.rawValue)
	
//	if Sample3.a == Sample3.a {
//		
//	}
	// イニシャライザちタイプメソッド
	
	//---------------------------------------------
	//                共用型の列挙型
	//---------------------------------------------
	enum Sample4 {
		case a (String, String)
		case b (Int)
	}
	let myEnumTest4 = Sample4.a("1", "2")
	print(myEnumTest4)
	// オプショナル型と列挙型
	let optionalTest: Int? = 1
	if case let Optional.some(a) = optionalTest {
		print("optional value is effect, = \(a)")
	}
	if let a = optionalTest {
		print("optional value is effect, = \(a)")
	}
	
	//---------------------------------------------
	//               パターンマッチ
	//---------------------------------------------
	
	
}

//------------------------------------------------------------------
//                    ....　補助エリア
//------------------------------------------------------------------
