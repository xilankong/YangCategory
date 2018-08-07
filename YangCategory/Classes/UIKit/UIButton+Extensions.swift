//
//  UIButtonExtensions.swift
//
//  Created by yanghuang on 2018/3/21.
//

import UIKit
    
// MARK: - Properties
public extension UIButton {
    
    /// 颜色转图片
    public func re_set(backgroundColor color: UIColor?, for state: UIControlState) {
        setImage(color?.re_toImage, for: state)
    }
	
}
