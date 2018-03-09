//
//  S9_basic.swift
//  Learning-Swift 4
//
//  Created by 徐伟达 on 2018/3/8.
//  Copyright © 2018年 徐伟达. All rights reserved.
//

import Foundation

//------------------------------------------------------------------
//                         テスト関数
//------------------------------------------------------------------
func S9BasicTest() {
	print("//-------------------------------------------")
	print("//              S9 メモリ管理")
	print("//-------------------------------------------")
	//---------------------------------------------
	//               参照型データとARC
	//---------------------------------------------
	// 测试类内可选型属性
//	class Sample {
//		var a: Int?
//	}
//	var sample = Sample.init()
//	guard var a = sample.a else {
//		print("nil")
//		return
//	}
	//---------------------------------------------
	//                強い参照の循環
	//---------------------------------------------
	
	//---------------------------------------------
	//              オプショナルチェーン
	//---------------------------------------------
	struct OptionalChainSampleData {
		var data: Int = 1
	}
	class OptionalChainTestClass {
		var complexData: OptionalChainSampleData?
		init() {
		}
		init(complexData: OptionalChainSampleData) {
			self.complexData = complexData
		}
	}
	func getSampleData() -> Int {
		print("runned")
		return 1;
	}
//	let optionalChainTest = OptionalChainTestClass.init(complexData: OptionalChainSampleData.init())
	let optionalChainTest = OptionalChainTestClass.init()
	optionalChainTest.complexData?.data = getSampleData()
	if (optionalChainTest.complexData?.data = getSampleData()) != nil {
		print("ok")
	}
	//---------------------------------------------
	//                  キーパス
	//---------------------------------------------
	let keyPath1 = \OptionalChainTestClass.complexData?.data
	print(type(of: keyPath1))
	print(optionalChainTest[keyPath: keyPath1] ?? "nil")
}
//------------------------------------------------------------------
//                    ....　補助エリア
//------------------------------------------------------------------
