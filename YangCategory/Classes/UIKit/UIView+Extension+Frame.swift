//
//  UIView+Extension+Frame.swift
//
//  Created by lbencs on 22/01/2018.
//

import Foundation


public extension UIView {
    var re_x: CGFloat {
        get {
            return frame.origin.x
        }
        set {
            frame.origin.x = newValue
        }
    }
    var re_y: CGFloat {
        get {
            return frame.origin.y
        }
        set {
            frame.origin.y = newValue
        }
    }
    var re_width: CGFloat {
        get {
            return frame.size.width
        }
        set {
            frame.size.width = newValue
        }
    }
    var re_height: CGFloat {
        get {
            return frame.size.height
        }
        set {
            frame.size.height = newValue
        }
    }
    var re_size: CGSize {
        get {
            return frame.size
        }
        set {
            frame.size = newValue
        }
    }
}

extension UIView {
    var re_bottom: CGFloat {
        return frame.maxY
    }
    var re_left: CGFloat {
        return re_x
    }
    var re_right: CGFloat {
        return frame.maxX
    }
    var re_top: CGFloat {
        return re_y
    }
}
