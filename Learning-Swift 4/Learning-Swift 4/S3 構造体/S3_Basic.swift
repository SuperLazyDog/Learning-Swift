//
//  S3_Basic.swift
//  Learning-Swift 4
//
//  Created by 徐伟达 on 2018/2/19.
//  Copyright © 2018年 徐伟达. All rights reserved.
//

import Foundation

//------------------------------------------------------------------
//                         テスト関数
//------------------------------------------------------------------
func S3BasicTest() {
	print("//-------------------------------------------")
	print("//                S3 構造体")
	print("//-------------------------------------------")
	//---------------------------------------------
	//               構造体の定義
	//---------------------------------------------
	struct MyTest3_1 {
		var intA: Int
		var intB: Int
		var isNeedUpdata: Bool
		
		init(asDefault _: Bool) {
			self.intA = 1
			self.intB = 1
			isNeedUpdata = false;
		}
		
		init(intA a: Int, intB b: Int) {
			self.init(asDefault: true)
			isNeedUpdata = !isNeedUpdata ? !isNeedUpdata : isNeedUpdata
			self.intA = a
			self.intB = b
		}
	}
	//---------------------------------------------
	//               メソッド
	//---------------------------------------------
	struct MyTest3_2 {
		
	}
}

//------------------------------------------------------------------
//                    ....　補助エリア
//------------------------------------------------------------------
