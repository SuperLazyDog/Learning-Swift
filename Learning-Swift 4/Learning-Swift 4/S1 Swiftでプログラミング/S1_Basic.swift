//
//  S1_Basic.swift
//  Learning-Swift 4
//
//  Created by 徐伟达 on 2018/2/17.
//  Copyright © 2018年 徐伟达. All rights reserved.
//

import Foundation

func S1BasicTest() {
	print("//-------------------------------------------")
	print("//           S1 Swiftでプログラミング")
	print("//-------------------------------------------")
	//---------------------------------------------
	//               データ型と変数
	//---------------------------------------------
	//識別子
//	let `if` = 1
//	print("if = \(`if`)")
	//---------------------------------------------
	//                制御構文
	//---------------------------------------------
	controlGrammer(of: "if", num: 10)
	controlGrammer(of: "for-in", num: 3)
	//---------------------------------------------
	//               簡単な実行方法
	//---------------------------------------------
}

func controlGrammer(of selector : String = "", num : Int = 0) {
	if selector == "" {
		return
	}else {
		switch selector {
		//TODO: 补充省略部分
		case "if":
			//if
			print("//-----------------------------")
			print("            if test")
			print("//-----------------------------")
			if num > 0 {
				print("num: \(num) > 0")
			} else if num == 0 {
				print("num: \(num) == 0")
			} else {
				print("num: \(num) < 0")
			}
		case "while":
			break
		case "for":
			break
		case "for-in":
			//for-in
			print("//-----------------------------")
			print("            for-in test")
			print("//-----------------------------")
			var innerNum = num
			if innerNum < 0 {
				innerNum = -innerNum
			}
			for i in 0..<innerNum {
				print("i = \(i)")
			}
		case "while":
			break
		default:
			print("default: str = \(selector)")
		}
	}
	
}
