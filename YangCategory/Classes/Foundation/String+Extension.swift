//
//  String+Extension.swift
//  Pods-YangCategory_Example
//
//  Created by yanghuang on 2018/3/21.
//

import Foundation

//MARK: - public 转化部分
extension String {
    /// 数字字符串添加正负号
    ///  123.9 -> +123.9
    /// -123.9 -> -123.9
    ///
    public func deployWithSymbol() -> String { return _deployWithSymbol(self) }
    
    /// 数字字符串添加分隔符
    /// 123123.11 -> 123,123.11
    /// 12212321 -> 12,213,321
    ///
    public func separator() -> String { return _separator(self) }
    
    /// 判断字符串是否为纯数字字符串（不支持小数点）
    public var isPureNumber: Bool {
        return _isPureNumber(self)
    }
    
    /// Number 转化
    public var doubleValue: Double {
        return (self as NSString).doubleValue
    }
    public var timeIntervalValue: TimeInterval {
        return (self as NSString).doubleValue
    }
    public var CGFloatValue: CGFloat {
        return CGFloat((self as NSString).floatValue)
    }
    public var floatValue: Float {
        return (self as NSString).floatValue
    }
    public var boolValue: Bool {
        return (self as NSString).boolValue
    }
    public var intValue: Int {
        return Int((self as NSString).intValue)
    }
    public var longIntValue: Int64 {
        return (self as NSString).longLongValue
    }
    
    public var length: Int {
        return Int((self as NSString).length)
    }
    
    // 13位时间戳转换为Date
    public var dateFromTimeInterval_13: Date {
        return Date(timeIntervalSince1970: self.doubleValue / 1000.0)
    }
    
    // 字符串跟进格式化转date
    func formatDate(with dateFormatter: String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormatter
        formatter.timeZone = NSTimeZone.local
        return formatter.date(from: self)
    }
    
    public func converToDictionary() -> [String: Any] {
        
        guard let data = self.data(using: .utf8),
            let dic = (try? JSONSerialization.jsonObject(with: data, options: .mutableContainers)) as? [String: Any]  else {
                return [:]
        }
        
        return dic
    }
}

//MARK: - private
extension String {
    
    fileprivate func _deployWithSymbol(_ str: String) -> String {
        let flo = (str as NSString).floatValue
        if flo == 0 {
            if str.contains("-") {
                return str.replacingOccurrences(of: "%", with: "")
            }
            return str
        } else {
            //flo为负时，不需要再加-号了
            return (flo > 0 ? "+" : "") + str
        }
    }
    
    fileprivate func _separator(_ str: String) -> String {
        if !str.isPureNumber {
            return str
        }
        var i = 0
        var float = str.contains(".")
        var separatorStr = str.reversed().reduce("") {(result: String, char: Character) in
            
            if char == Character(".") {
                float = false
            }
            if char != Character("."), float == false {
                i += 1
                return (i % 3 == 0 ? ("," + String(char)) : String(char)) + result
            } else {
                return String(char) + result
            }
        }
        let range = (separatorStr as NSString).range(of: ",")
        let range_add = (separatorStr as NSString).range(of: "+,")
        let range_sub = (separatorStr as NSString).range(of: "-,")
        if range.location == 0 || range_add.location == 0 || range_sub.location == 0 {
            separatorStr = (separatorStr as NSString).replacingCharacters(in: range, with: "")
        }
        return separatorStr
    }
    
    fileprivate func _isPureNumber(_ str: String) -> Bool {
        let scan: Scanner = Scanner(string: str)
        var val: Float = 0
        return scan.scanFloat(&val) && scan.isAtEnd
    }

}
