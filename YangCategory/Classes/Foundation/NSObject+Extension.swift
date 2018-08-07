//
//  NSObject+Extension.swift
//  Pods-YangCategory_Example
//
//  Created by yanghuang on 2018/8/7.
//

import Foundation

class DeallocObject: NSObject {
    typealias Execute = () -> ()
    let execute: Execute
    init(execute: @escaping Execute) {
        self.execute = execute
        super.init()
    }
    deinit {
        execute()
    }
}

extension NSObject {
    
    private struct AssociatedKeys {
        static var deallocObject = "AssociatedKeys.deallocObject"
    }
    public func re_dealloc(exe: @escaping () -> ()) {
        objc_setAssociatedObject(self, &AssociatedKeys.deallocObject, DeallocObject(execute: exe), .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
}
