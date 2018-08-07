//
//  Optional+Extension.swift
//  Pods-YangCategory_Example
//
//  Created by yanghuang on 2018/3/21.
//

import Foundation

public protocol _CollectionOrStringish {
    var isEmpty: Bool { get }
}
extension String: _CollectionOrStringish { }
extension Array: _CollectionOrStringish { }
extension Dictionary: _CollectionOrStringish { }
extension Set: _CollectionOrStringish { }
extension Optional where Wrapped: _CollectionOrStringish {
    public var isNilOrEmpty: Bool {
        switch self {
        case let .some(value): return value.isEmpty
        default: return true
        }
    }
}

struct MyRegex {
    let regex: NSRegularExpression?
    init(_ pattern: String) {
        regex = try? NSRegularExpression(pattern: pattern, options: .caseInsensitive)
    }
    
    func match(input: String) -> Bool {
        if let matches = regex?.matches(in: input, options: [], range: NSRange(location: 0, length: input.count)) {
            return matches.count > 0
        }
        
        return false
    }
}

//MARK: - 正则匹配
infix operator =~

func =~ (str: String, pattern: String) -> Bool {
    return MyRegex(pattern).match(input: str)
}
