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
chapter1.castTest(num: 1234);//测试类型转换与字符
chapter1.showDoubleNum(asInt: true);
chapter1.arrayTest();//测试数组定义
chapter1.typeTest();//测试类型命名

chapter1.ifTest(times: 19827); //if
chapter1.whileTest(times: 4) // while
chapter1.repeat_whileTest(times: 4) //repeat_while
chapter1.for_inTest(times: 10) // for_in_where
chapter1.switchTest(num: 1) //switch
