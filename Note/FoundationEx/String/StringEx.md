# String 常用方法总结归类

## Usage
~~~
import SwiftDLKit 
~~~

## Example

~~~
//
//  StringTestManager.swift
//  SwiftDLKit
//
//  Created by zj-db1140 on 2018/10/25.
//  Copyright © 2018年 CocoaPods. All rights reserved.
//

import Foundation
class StringTestManager {
    static func test() {
        self.testSubString()
        self.testDataChange()
        self.testPath()
        self.testUrlEncode()
        self.testPredicate()
    }
    
    static func testSubString() {
        let str = "Hello World!"
        print("\(str) 长度 \(str.length)")
        print("\(str) 16进制格式 \(str.hex)")
        print("\(str) 删除所有空格和回车符 \(str.deleteAllSpaceAndWrap())")
        print("\(str) 替换字符串 \(str.replaceString(originString: "llo", desString: "999"))")
        print("\(str) Wor字符串位置 \(str.rangeWithSubString(subString: "Wor"))")
        print("\(str) 获取指定位置之后的字符串 \(str.subString(from: 3))")
        print("\(str) 获取指定位置之前的字符串 \(str.subString(to: 3))")
        print("\(str) 获取指定位置字符串 \(str.subString(start: 1, length: 4))")
    }
    
    static func testDataChange() {
        print("\n")
        let str = "10.98"
        print("\(str) intValue \(str.intValue)")
        print("\(str) floatValue \(str.floatValue)")
        print("\(str) doubleValue \(str.doubleValue)")
        
        if let strData = str.data(using: .utf8) {
           print("\(str.hex) stringValue \(String.stringValue(data: strData))")
        }
        
    }
    
    static func testPath() {
        print("\n")
        print("DocumentPath ==> \(String.documentPath())")
        print("CachePath ==> \(String.cachePath())")
        print("LibraryPath ==> \(String.libraryPath())")
        print("TmpPath ==> \(String.tmpPath())")
        print("HomePath ==> \(String.homePath())")
    }
    
    static func testUrlEncode() {
        let str = "https://blog.csdn.net?filter=19736&jql=assignee = 娃哈哈 AND status = Active"
        print("\n \(str)")
        print("\n urlEncode = \(str.urlEnCode())")
        print("\n urlDecoded = \(str.urlDecoded())")
    }
    
    static func testPredicate() {
        print("\n")
        var str1 = "13215013599"
        var str2 = "11215013599"
        
        str1.isPhoneNum() ? print("\(str1) 是手机号码") : print("\(str1) 不是手机号码")
        str2.isPhoneNum() ? print("\(str2) 是手机号码") : print("\(str2) 不是手机号码")
        
         str1 = "707689819@qq.com"
         str2 = "707689819"
        
        str1.isEmailAddress() ? print("\(str1) 是邮箱地址") : print("\(str1) 不是邮箱地址")
        str2.isEmailAddress() ? print("\(str2) 是邮箱地址") : print("\(str2) 不是邮箱地址")
    }
}

~~~

## Output result

~~~
Hello World! 长度 12
Hello World! 16进制格式 48656c6c6f20576f726c6421
Hello World! 删除所有空格和回车符 HelloWorld!
Hello World! 替换字符串 He999 World!
Hello World! Wor字符串位置 {6, 3}
Hello World! 获取指定位置之后的字符串 lo World!
Hello World! 获取指定位置之前的字符串 Hel
Hello World! 获取指定位置字符串 ello


10.98 intValue 10
10.98 floatValue 10.98
10.98 doubleValue 10.98
31302e3938 stringValue 10.98


DocumentPath ==> /Users/zj-db1140/Library/Developer/CoreSimulator/Devices/D1477D32-660F-4745-9683-3E063CB3DB30/data/Containers/Data/Application/8E42AD17-E803-41CB-9F36-A12CAA03D6ED/Documents
CachePath ==> /Users/zj-db1140/Library/Developer/CoreSimulator/Devices/D1477D32-660F-4745-9683-3E063CB3DB30/data/Containers/Data/Application/8E42AD17-E803-41CB-9F36-A12CAA03D6ED/Library/Caches
LibraryPath ==> /Users/zj-db1140/Library/Developer/CoreSimulator/Devices/D1477D32-660F-4745-9683-3E063CB3DB30/data/Containers/Data/Application/8E42AD17-E803-41CB-9F36-A12CAA03D6ED/Library
TmpPath ==> /Users/zj-db1140/Library/Developer/CoreSimulator/Devices/D1477D32-660F-4745-9683-3E063CB3DB30/data/Containers/Data/Application/8E42AD17-E803-41CB-9F36-A12CAA03D6ED/tmp/
HomePath ==> /Users/zj-db1140/Library/Developer/CoreSimulator/Devices/D1477D32-660F-4745-9683-3E063CB3DB30/data/Containers/Data/Application/8E42AD17-E803-41CB-9F36-A12CAA03D6ED

 https://blog.csdn.net?filter=19736&jql=assignee = 娃哈哈 AND status = Active

 urlEncode = %68%74%74%70%73%3A//%62%6C%6F%67%2E%63%73%64%6E%2E%6E%65%74?%66%69%6C%74%65%72%3D%31%39%37%33%36%26%6A%71%6C%3D%61%73%73%69%67%6E%65%65%20%3D%20%E5%A8%83%E5%93%88%E5%93%88%20%41%4E%44%20%73%74%61%74%75%73%20%3D%20%41%63%74%69%76%65

 urlDecoded = https://blog.csdn.net?filter=19736&jql=assignee = 娃哈哈 AND status = Active


13215013599 是手机号码
11215013599 不是手机号码
707689819@qq.com 是邮箱地址
707689819 不是邮箱地址

~~~