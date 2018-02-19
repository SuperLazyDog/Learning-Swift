//
//  S2_Basic.swift
//  Learning-Swift 4
//
//  Created by 徐伟达 on 2018/2/19.
//  Copyright © 2018年 徐伟达. All rights reserved.
//

import Foundation

func S2BasicTest() {
	print("//-------------------------------------------")
	print("//                S2 関数")
	print("//-------------------------------------------")
	//---------------------------------------------
	//               関数定義の基本
	//---------------------------------------------
	// 基本定义
//	func test(a: Int, _:Bool) {}
//	func test(aa: Int, _ a: Bool) {}
//	test(a: <#T##Int#>, <#T##Bool#>)
//	test(aa: <#T##Int#>, <#T##a: Bool##Bool#>)
	//---------------------------------------------
	//          関数定義におけるさまざまな設定
	//---------------------------------------------
	// 改变参数自身 inout
//	func test2(sample a: inout Int) {} // 定义
//	test2(sample: &<#T##Int#>) // 呼出
	// 默认值
//	func test2_2(_ a: Int = 1, _ b: Int = 2, _ c: Int = 3, d: Int _ e: Int = 5) {}
	//---------------------------------------------
	//               オーバーロード
	//---------------------------------------------
	func test2_3(a: Int) {}
	
	//重载版本
//	func test2_3(a: Bool) {} // 参数类型, 不能只有参数类型不同
	func test2_3(a: Int, b: Int) {} // 参数数量
	func test2_3(labelSample a: Int) {} // 标签
//	func test2_3(aa a: Int) -> Bool { return false } // 返回值类型, 不能只是返回值不同
	
	// 参数类型不同的测试 结论:不能只有参数类型不同
//	func compare(_ a: Int, _ b: Int) -> Bool {return false}
//	func compare(_ a: String, _ b: String) -> Bool {return false}
	
	//---------------------------------------------
	//                 タプル
	//---------------------------------------------
	
	//---------------------------------------------
	//              Swiftの演算子
	//---------------------------------------------
	
	//---------------------------------------------
	//               演算子の定義
	//---------------------------------------------
}

//类型不同的重载不能用在被嵌套函数
//func test2_3(a: Bool) {}
//func test2_3(a: Int) {}
//
//func mySwap(_ a: inout String, _ b: inout String) {}
//func mySwap(_ a: inout Int, _ b: inout Int) {}

