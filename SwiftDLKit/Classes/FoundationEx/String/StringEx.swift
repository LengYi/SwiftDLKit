import Foundation

// 字符串截取替换删除
public extension String {
    // 字符串长度
    var length: Int {
        return self.count
    }
    
    // 转换成16进制
    var hex: String {
        let data = self.data(using: .utf8)!
        return data.map { String(format: "%02x", $0) }.joined()
    }
    
    // 删除所有空格和回车符
    func deleteAllSpaceAndWrap() -> String {
        let str = self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).replacingOccurrences(of: " ", with: "")
        return str
    }
    
    // 替换字符串
     func replaceString(originString: String, desString: String) -> String {
        let str = NSString.init(string: self).replacingOccurrences(of: originString, with: desString)
        return str
    }
    
    func rangeWithSubString(subString: String) -> NSRange {
        let str = NSString.init(string: self)
        let range = str.range(of: subString)
        return range
    }
    
    func index(from: Int) -> Index {
        return self.index(startIndex, offsetBy: from)
    }
    
    // 获取指定位置之后的字符串
    func subString(from: Int) -> String {
        let fromIndex = index(from: from)
        return String(self[fromIndex...])
    }
    
    // 获取指定位置之前的字符串
    func subString(to: Int) -> String {
        let toIndex = index(from: to)
        return String(self[..<toIndex])
    }
    
    // 获取指定位置字符串
    func subString(start: Int, length: Int = -1) -> String {
        var len = length
        if len == -1 {
            len = self.count - start
        }
        
        let st = self.index(startIndex, offsetBy:start)
        let en = self.index(st, offsetBy:len)
        return String(self[st ..< en])
    }
    
    func subString(with r: Range<Int>) -> String {
        let startIndex = index(from: r.lowerBound)
        let endIndex = index(from: r.upperBound)
        return String(self[startIndex..<endIndex])
    }
    
    func toNSRange(_ range: Range<String.Index>) -> NSRange {
        guard let from = range.lowerBound.samePosition(in: utf16), let to = range.upperBound.samePosition(in: utf16) else {
            return NSMakeRange(0, 0)
        }
        return NSMakeRange(utf16.distance(from: utf16.startIndex, to: from), utf16.distance(from: from, to: to))
    }
    
    func toRange(_ range: NSRange) -> Range<String.Index>? {
        guard let from16 = utf16.index(utf16.startIndex, offsetBy: range.location, limitedBy: utf16.endIndex) else { return nil }
        guard let to16 = utf16.index(from16, offsetBy: range.length, limitedBy: utf16.endIndex) else { return nil }
        guard let from = String.Index(from16, within: self) else { return nil }
        guard let to = String.Index(to16, within: self) else { return nil }
        return from ..< to
    }
}

// 数据转换
public extension String {
    var intValue: Int {
        if let number = self.numberValue {
            return number.intValue
        }
        
        return 0
    }
    
    var floatValue: Float {
        if let number = self.numberValue {
            return number.floatValue
        }
        
        return 0.0
    }
    
    var doubleValue: Double {
        if let number = self.numberValue {
            return number.doubleValue
        }
        
        return 0.0
    }
    
    var numberValue: NSNumber? {
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.decimalSeparator = "."
        if let result = formatter.number(from: self) {
            return result
        } else {
            formatter.decimalSeparator = ","
            if let result = formatter.number(from: self) {
                return result
            }
        }
        return nil
    }
    
    static func stringValue(data: Data) -> String {
        if let str = String.init(data: data, encoding: .utf8) {
            return str
        }
        return ""
    }
}

// 文件路径
public extension String {
    static func documentPath() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentDir = paths[0]
        return documentDir
    }
    
    static func cachePath() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)
        let cachesDir = paths[0]
        return cachesDir
    }
    
    static func libraryPath() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)
        let cachesDir = paths[0]
        return cachesDir
    }
    
    static func tmpPath() -> String {
        return NSTemporaryDirectory()
    }
    
    static func homePath() -> String {
        return NSHomeDirectory()
    }
    
    static func findFiles(path: String, types: [String]) -> [String] {
        do {
            let files = try FileManager.default.contentsOfDirectory(atPath: path)
            if files.count == 0 {
                return files
            } else {
                let resultArr = NSArray(array: files).pathsMatchingExtensions(types)
                return resultArr
            }
        }
        catch {
            return []
        }
    }
    
    // 获取文件内容
    static func readFile(path: String) -> String {
        do {
            let content = try String.init(contentsOfFile: path)
            return content
        }
        catch {
            return ""
        }
    }
    
    static func writeFile(path: String, content: String) {
        do {
            try content.write(toFile: path, atomically: true, encoding: .utf8)
        }
        catch {
            print("writeFile Failed")
        }
    }
}

public extension String {
    func urlEnCode() -> String {
        let charset = CharacterSet(charactersIn: "\"#%/<>?@^`{|}")
        if let enUrl = self.addingPercentEncoding(withAllowedCharacters: charset) {
            return enUrl
        }
        return self
    }
    
     func urlDecoded() -> String {
        return removingPercentEncoding ?? self
    }
}

// 正则表达式
public extension String {
    func isPhoneNum() -> Bool {
        let mobile = "^1((3[0-9]|4[57]|5[0-35-9]|7[0678]|8[0-9])\\d{8}$)"
        let  CM = "(^1(3[4-9]|4[7]|5[0-27-9]|7[8]|8[2-478])\\d{8}$)|(^1705\\d{7}$)";
        let  CU = "(^1(3[0-2]|4[5]|5[56]|7[6]|8[56])\\d{8}$)|(^1709\\d{7}$)";
        let  CT = "(^1(33|53|77|8[019])\\d{8}$)|(^1700\\d{7}$)";
        let regextestmobile = NSPredicate(format: "SELF MATCHES %@",mobile)
        let regextestcm = NSPredicate(format: "SELF MATCHES %@",CM )
        let regextestcu = NSPredicate(format: "SELF MATCHES %@" ,CU)
        let regextestct = NSPredicate(format: "SELF MATCHES %@" ,CT)
        
        if ((regextestmobile.evaluate(with: self) == true)
            || (regextestcm.evaluate(with: self)  == true)
            || (regextestct.evaluate(with: self) == true)
            || (regextestcu.evaluate(with: self) == true)) {
            return true
        } else {
            return false
        }
    }
    
    func isEmailAddress() -> Bool {
        let mailPattern = "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", mailPattern)
        guard predicate.evaluate(with: self) else {
            return false
        }
        return true
    }
}

