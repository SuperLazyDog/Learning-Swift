//
//  S8_Basic.swift
//  Learning-Swift 4
//
//  Created by 徐伟达 on 2018/3/5.
//  Copyright © 2018年 徐伟达. All rights reserved.
//

import Foundation

//------------------------------------------------------------------
//                         テスト関数
//------------------------------------------------------------------
func S8BasicTest() {
	print("//-------------------------------------------")
	print("//              S8 クラスと継承")
	print("//-------------------------------------------")
	//---------------------------------------------
	//                 クラスの定義
	//---------------------------------------------
	let nullClass = NullClass.init()
	print(nullClass)
	
	let firstChildClass = FirstChildClass.init()
	print(firstChildClass)
	firstChildClass.printName()
	
	//動的結合とキャスト
//	print()
//	print("nullClass is NullClass: \(nullClass is NullClass)")
//	print("nullClass is FirstChildClass: \(nullClass is FirstChildClass)")
//
//
//	print("firstChildClass is NullClass: \(firstChildClass is NullClass)")
//	print("firstChildClass is FirstChildClass: \(firstChildClass is FirstChildClass)")
//
//	(firstChildClass as NullClass).printName()
//	((nullClass as? FirstChildClass) ?? SecondChildClass.init()).printName()
	
	// クラスメソッドとクラスプロパティ
	print()
	NullClass.sayHello()
	FirstChildClass.sayHello()
	SecondChildClass.sayHello() // 这个的clas属性/方法没改写
}

//------------------------------------------------------------------
//                    クラス定義　補助エリア
//------------------------------------------------------------------
protocol ClassNameAchievable {
	var className: String { get }
	func printName()
}

class NullClass: ClassNameAchievable, CustomStringConvertible {
	static var staticClassName: String = "NullClass" // static属性/方法 不可在子类改写
	
	class var classClassName: String {
		return "NullClass"
	}
	
	class func sayHello() {
		print("hello in \(self.classClassName)")
	}
	
	var className: String {
		return "NullClass"
	}
	var description: String {
		return self.className
	}
	func printName() {
		print("printName: \(self)")
	}
}

class FirstChildClass: NullClass {
	override class var classClassName: String { // class属性/方法 可在子类改写
		return "FirstChildClass"
	}
	
	override class func sayHello() {
		print("hello in " + self.classClassName)
	}
	override var className: String {
		return "FirstChildClass"
	}
	
}

class SecondChildClass: FirstChildClass {
	override var className: String {
		return "SecondChildClass"
	}
}

//------------------------------------------------------------------
//                    ....　補助エリア
//------------------------------------------------------------------
