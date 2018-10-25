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
