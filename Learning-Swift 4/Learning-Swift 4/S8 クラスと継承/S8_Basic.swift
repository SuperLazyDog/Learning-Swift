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
	
	//---------------------------------------------
	//               イニシャライザ
	//---------------------------------------------
	
	//---------------------------------------------
	//             継承とサブクラスの定義
	//---------------------------------------------
	print("\n\n")
	print(SubscriptSample2.init()[2] ?? "nil")
	
	//---------------------------------------------
	//                 クラスと型
	//---------------------------------------------
	print(FirstChildClass.self == type(of: firstChildClass))
	print(type(of: Int(1)))
	print(type(of: Swift4BasicLearningSelector.S1))
//	print(FirstChildClass.self.Type == FirstChildClass.Type)
	let sampleProtocolType: CustomStringConvertible.Type = ClassAndTypeTest.self
	print(sampleProtocolType)
	// 类与协议的合成, 表示采用协议的类或其子类
	typealias Sample = ClassAndTypeTest & CustomStringConvertible & Equatable
	//---------------------------------------------
	//                 解放時処理
	//---------------------------------------------
	var deinitTest: DeinitSampleClass? = DeinitSampleClass()
	deinitTest = nil
	deinitTest = DeinitSampleClass()
	deinitTest = nil
	deinitTest = DeinitSampleClass()
	var _ = deinitTest // 消除被改写但没有被读取的警告
	
}

//------------------------------------------------------------------
//                     クラス定義　補助エリア
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
//                   イニシャライザ　補助エリア
//------------------------------------------------------------------
class BasicInitializerClass {
	var a: String
	init(a: String) {
		self.a = a
	}
}

class FirstChildInitializerClass: BasicInitializerClass {
	var b: String
	init(a: String, b: String) {
		self.b = b
		super.init(a: a)
	}
	override convenience init(a: String) {
		self.init(a: a, b: "")
	}
}

//------------------------------------------------------------------
//                  継承とサブクラスの定義　補助エリア
//------------------------------------------------------------------
class SubscriptSample {
	var array: Array<Int> = [1, 2, 3, 4, 5*5]
	subscript(id: Int) -> Int? {
		return id < array.count ? array[id] : nil
	}
}

class SubscriptSample2: SubscriptSample {
	override subscript(id: Int) -> Int? {
		return id < self.array.count ? (super[id]! * super[id]!) : nil
	}
}


//------------------------------------------------------------------
//                    クラスと型　補助エリア
//------------------------------------------------------------------
class ClassAndTypeTest: CustomStringConvertible {
	var description: String = "\(ClassAndTypeTest.self)"
}

//------------------------------------------------------------------
//                    解放時処理　補助エリア
//------------------------------------------------------------------
class DeinitSampleClass {
	deinit {
		print("deinited")
	}
}
//------------------------------------------------------------------
//                    ....　補助エリア
//------------------------------------------------------------------
