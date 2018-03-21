//
//  UIControl+Extension.swift
//  iReal
//
//  Created by lbencs on 22/01/2018.
//  Copyright © 2018 lbencs. All rights reserved.
//

import Foundation
import UIKit

extension UIControl {
    @IBInspectable
    var re_highlightedColor: UIColor? {
        get{
            return objc_getAssociatedObject(self, &AssociatedKeys.highlightedColor) as? UIColor
        }
        set{
            objc_setAssociatedObject(self, &AssociatedKeys.highlightedColor, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            addObserver(self, forKeyPath: "highlighted", options: NSKeyValueObservingOptions.new, context: nil)
            re_dealloc {
                self.removeObserver(self, forKeyPath: "highlighted")
            }
        }
    }
}


extension UIControl {
    
    private struct AssociatedKeys {
        static var highlightedColor = "AssociatedKeys.highlightedColor"
        static var backgroundColor = "AssociatedKeys.beackgroundColor"
    }
    private var re_backgroundColor: UIColor? {
        get{
            return objc_getAssociatedObject(self, &AssociatedKeys.backgroundColor) as? UIColor
        }
        set{
            objc_setAssociatedObject(self, &AssociatedKeys.backgroundColor, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    open override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "highlighted" {
            switch state {
            case .normal:
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
                    UIView.animate(withDuration: 0.1, animations: {
                        self.backgroundColor = self.re_backgroundColor
                    })
                })
            case .highlighted:
                re_backgroundColor = backgroundColor
                UIView.animate(withDuration: 0.1, animations: {
                    self.backgroundColor = self.re_highlightedColor
                })
            default: break
            }
        }
    }
}
