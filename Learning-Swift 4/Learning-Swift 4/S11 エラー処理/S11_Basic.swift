//
//  S11_Basic.swift
//  Learning-Swift 4
//
//  Created by 徐伟达 on 2018/3/24.
//  Copyright © 2018年 徐伟达. All rights reserved.
//

import Foundation

//------------------------------------------------------------------
//                         テスト関数
//------------------------------------------------------------------
func S11BasicTest() {
	print("//-------------------------------------------")
	print("//                S11 エラー処理")
	print("//-------------------------------------------")
	//---------------------------------------------
	//                  エラー処理構文
	//---------------------------------------------
//	do {
//		try sampleErrorFunc1(throwError: false)
//	} catch {
//		puts("error catched from sampleErrorFunc1")
//	}
//	switch SampleError1.asNumer(1) {
//	case SampleError1.asNumer(let a):
//		puts("asNumer: \(a)")
//	default:
//		puts("default")
//	}
	var dataSource: [Int] = [-10, 0, 1, 1000]
	for item in dataSource {
		do {
			print("//---------------------------------------------------------")
			let result = try sampleErrorFunc2WithOptionalReturnType(mode: item)
			print(result != nil ? "\(result)" : "nil")
			if let result = result {
				print("result: \(result) temp: \(temp)")
			} else {
				print("there is an error")
			}
		} catch {
			print(error)
		}
	}
	
}

//------------------------------------------------------------------
//                    エラー処理構文　補助エリア
//------------------------------------------------------------------
enum SampleError1: Error {
	case asSimpleResultA, asSimpleResultB
	case asString(String)
	case asNumer(Int)
}
func sampleErrorFunc1(throwError: Bool) throws -> String {
	if throwError {
		return "sampleErrorFunc1 ok"
	} else {
		throw SampleError1.asNumer(1)
	}
}
// 抛出可选型的函数
func sampleErrorFunc2WithOptionalReturnType(mode: Int) throws -> Bool? {
	switch mode {
	case 1...100:
		return true
	case ..<0:
		return false
	case 0:
		return nil
	default: // > 100
		throw SampleError1.asSimpleResultA
	}
}
//------------------------------------------------------------------
//                    ....　補助エリア
//------------------------------------------------------------------
