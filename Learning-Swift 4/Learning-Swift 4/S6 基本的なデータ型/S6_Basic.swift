//
//  S6_Basic.swift
//  Learning-Swift 4
//
//  Created by 徐伟达 on 2018/3/2.
//  Copyright © 2018年 徐伟达. All rights reserved.
//

import Foundation

//------------------------------------------------------------------
//                         テスト関数
//------------------------------------------------------------------
func S6BasicTest() {
	print("//-------------------------------------------")
	print("//                S6 基本的なデータ型")
	print("//-------------------------------------------")
	//---------------------------------------------
	//                 範囲型とStride型
	//---------------------------------------------
	// TODO: 补充例子
	//---------------------------------------------
	//                   配列
	//---------------------------------------------
//	let sample_str = "hellp" // 测试String是否采用了Collection
//	for str in sample_str {
//		print("str: \(str)")
//	}
	var arrayTest6_2_1 = [1, 2, 3]
	print(arrayTest6_2_1)
	arrayTest6_2_1[1...2] = [4, 5, 6, 7]
	print(arrayTest6_2_1)
	// 构造函数
	arrayTest6_2_1 = Array<Int>(arrayLiteral: 3, 2, 1)
	arrayTest6_2_1 = Array<Int>([9, 8, 7])
	print(arrayTest6_2_1)
	
	//---------------------------------------------
	//                文字列と文字
	//---------------------------------------------
	print("-- 构造函数 --")
	print("\u{3099}")
	//合成字符
	let gu: Character = "\u{30B0}"  // グ
	let ku: Character = "\u{30AF}\u{3099}" // ク + [゙]
	print( gu == ku )
	//主要方法
	var stringSample6_3: String = "12345"
	stringSample6_3.append(contentsOf: "996677")
	stringSample6_3.append(contentsOf: ["a", "b", "c"])
	print(stringSample6_3)
//	stringSample6_3.removeSubrange(<#T##bounds: Range<String.Index>##Range<String.Index>#>)
	print(stringSample6_3[stringSample6_3.startIndex])
	//---------------------------------------------
	//                  辞書
	//---------------------------------------------
	var dictionarySample: [String: Int]  = ["a": 1]
	print(dictionarySample.updateValue(1234, forKey: "a") ?? "nil")
	print(dictionarySample.removeValue(forKey: "a") ?? "nil")
}
//------------------------------------------------------------------
//                      配列　補助エリア
//------------------------------------------------------------------
func sample(a: Int..., b: Bool) -> Bool { return false }

//------------------------------------------------------------------
//                    ....　補助エリア
//------------------------------------------------------------------
