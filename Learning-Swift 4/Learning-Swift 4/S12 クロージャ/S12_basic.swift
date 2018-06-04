//
//  S12_basic.swift
//  Learning-Swift 4
//
//  Created by 徐伟达 on 2018/6/5.
//  Copyright © 2018年 徐伟达. All rights reserved.
//

import Foundation

//------------------------------------------------------------------
//                         テスト関数
//------------------------------------------------------------------
func S12BasicTest() {
	print("//-------------------------------------------")
	print("//                S12 クロージャ")
	print("//-------------------------------------------")
	let testClosure1 = { () in
		print("here is testClosure")
	}
	testClosure1()
	var testClosure2: ((Int)->Int)!
	testClosure2 = { (a: Int) -> Int in
		if a <= 0 {
			return a
		} else {
			return a + testClosure2(a-1)
		}
	}
	print(testClosure2(100))

}

//------------------------------------------------------------------
//                    ....　補助エリア
//------------------------------------------------------------------
