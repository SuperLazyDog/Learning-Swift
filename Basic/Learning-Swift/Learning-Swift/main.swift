//
//  main.swift
//  Learning-Swift
//
//  Created by Weida Xu on 2017/8/4.
//  Copyright © 2017年 Weida Xu. All rights reserved.
//

import Foundation

//------------------------------------------------------------------------------
//                                  说明
//这是我复习swift时候为自己创建的模板项目
//主要是为了提高实际开发的效率
//把swift的所有部分都做一份自己的模板
//------------------------------------------------------------------------------

//-------------------------------------------------------
//                     文件的链接测试
//-------------------------------------------------------
print("//-------------------------------------------------------");
print("//                     文件的链接测试");
print("//-------------------------------------------------------");
var linkTest = LinkTest();
linkTest.putsA();

//-------------------------------------------------------
//                       第一章
//-------------------------------------------------------
print("//-------------------------------------------------------");
print("//                       第一章");
print("//-------------------------------------------------------");
var chapter1 = Chapter1();
chapter1.showDoubleNum();
chapter1.castTest(num: 1234);
chapter1.showDoubleNum(asInt: true);
chapter1.arrayTest();
chapter1.typeTest();

chapter1.ifTest(times: 19827);
