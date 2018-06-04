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
	let dataSource: [Int] = [-10, 0, 1, 751, 1000]
	for item in dataSource {
		do {
			print("")
			let result = try sampleErrorFunc2WithOptionalReturnType(mode: item)
			print(result != nil ? "\(String(describing: result))" : "nil")
			if let result = result {
				print("result: \(result) item: \(item)")
			} else {
				print("there is an error")
			}
		} catch SampleError1.asNumer(let a) {
			print("UUID asNumer a=\(a)")
		} catch {
			print("UUID asSimpleResultA: \(error)")
		}
	}
	jsonTest()
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
	case 900...:
		throw SampleError1.asNumer(mode)
	default: // > 100
		throw SampleError1.asSimpleResultA
	}
}


// JSON
func jsonTest() {
	struct People: Codable, CustomStringConvertible {
		let name: String
		var age: Int
		var description: String {
			return name + " \(age)"
		}
	}
	let group = [People.init(name: "鲁班七号", age: 4), People.init(name: "姜子牙", age: 100)]
	let path1 = URL.init(fileURLWithPath: "./group.json")
	let path2 = URL.init(fileURLWithPath: "./person.json")
	let encoder = JSONEncoder.init()
	let decoder = JSONDecoder.init()
	
	do {
		let d = try encoder.encode(group)
		try d.write(to: path1)
		let load = try Data.init(contentsOf: path1)
		let gs = try decoder.decode([People].self, from: load)
		print(gs)
		
		let personJson = try encoder.encode(group[0])
		try personJson.write(to: path2)
		let personData = try Data.init(contentsOf: path2)
		let person = try decoder.decode(People.self, from: personData)
		print(person)
	} catch  {
		print(error)
	}
}
//------------------------------------------------------------------
//                    ....　補助エリア
//------------------------------------------------------------------
