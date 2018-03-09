//
//  S10_basic.swift
//  Learning-Swift 4
//
//  Created by 徐伟达 on 2018/3/9.
//  Copyright © 2018年 徐伟达. All rights reserved.
//

import Foundation

//------------------------------------------------------------------
//                         テスト関数
//------------------------------------------------------------------
func S10BasicTest() {
	print("//-------------------------------------------")
	print("//                S10 拡張")
	print("//-------------------------------------------")
	//---------------------------------------------
	//                 拡張の宣言
	//---------------------------------------------
	
	//---------------------------------------------
	//            拡張定義とプロトコルへの適合
	//---------------------------------------------
	
	//---------------------------------------------
	//            	　集合とプロトコル
	//---------------------------------------------
	let setSample: Set<String> = ["a", "a", "b"]
	print("setSample.count = \(setSample.count)")
	let setSample2 = Set<Int>.init(0...100)
//	Set<Int>.init(<#T##sequence: Sequence##Sequence#>)
	print(setSample2)
	print();print();print();print();
	print(setSample2.sorted())
	
	struct SampleOptionSet: OptionSet {
		typealias RawValue = UInt
		let rawValue: UInt
		static let optionA: SampleOptionSet = SampleOptionSet.init(rawValue: 1 << 0)
		static let optionB: SampleOptionSet = SampleOptionSet.init(rawValue: 1 << 1)
		static let optionC: SampleOptionSet = SampleOptionSet.init(rawValue: 1 << 2)
		static let optionD: SampleOptionSet = SampleOptionSet.init(rawValue: 1 << 3)
	}
	
}

//------------------------------------------------------------------
//                拡張定義とプロトコルへの適合　補助エリア
//------------------------------------------------------------------
class ExtensionSampleClass {
	
}
protocol ExtensionSampleProtocol {
	var sampleString: String { get }
}
extension ExtensionSampleClass: ExtensionSampleProtocol {
	var sampleString: String {
		return "ExtensionSampleClass"
	}
}
//内部已有一部分或全部实现
class ExtensionSampleClass2 {
	var sampleData: Int = 0
	
}
protocol ExtensionSampleProtocol2 {
	var sampleString: String { get }
	var sampleData: Int { get }
}
extension ExtensionSampleClass2: ExtensionSampleProtocol2 {
	var sampleString: String {
		return "ExtensionSampleClass"
	}
}
//------------------------------------------------------------------
//                    ....　補助エリア
//------------------------------------------------------------------
