//
//  S4_basic.swift
//  Learning-Swift 4
//
//  Created by 徐伟达 on 2018/2/25.
//  Copyright © 2018年 徐伟达. All rights reserved.
//

import Foundation

//------------------------------------------------------------------
//                         テスト関数
//------------------------------------------------------------------
func S4BasicTest() {
	print("//-------------------------------------------")
	print("//                S4 オプショナル")
	print("//-------------------------------------------")
	//---------------------------------------------
	//               オプショナル型
	//---------------------------------------------
//	var a = String.init(describing: <#T##Subject#>) // 可选型直接放到字符串会警告，不警告用这个
	//---------------------------------------------
	//              オプショナル束縛構文
	//---------------------------------------------
	let myOptional4_2: Int? = 1
	// if-let
	//	if let myOptional4_2 = myOptional4_2, 1 < 2 { // 可以用, 分隔多个条件
	if let myOptional4_2 = myOptional4_2 {
		print("if-let myoptional4_2 has value: \(myOptional4_2)")
	} else {
		print("if-let myoptional4_2 is nil")
	}
	//guard
	guard let myOptional4_2_true = myOptional4_2 else {
		print("guard error, myOptional4_2 is nil")
		return
	}
	let myOptional4_3: Int? = 2
	// nil合体演算子
	let myOptional4_3_test1 = myOptional4_2 ?? 0 // ??结果的类型和右边相同
	print(myOptional4_3_test1) // 1
	let myOptional4_3_test2 = myOptional4_2 ?? myOptional4_3
	print(String.init(describing: myOptional4_3_test2)) // Optional(1)
	
}

//------------------------------------------------------------------
//                    ....　補助エリア
//------------------------------------------------------------------
