//
//  UIWindow+Extension.swift
//
//  Created by lbencs on 24/01/2018.
//

import Foundation

public extension UIWindow {
    
    public static var re_maxSupportedWindowLevel = UIWindowLevelNormal

    /// 当前屏幕显示的第一个window
    public static var re_frontWindow: UIWindow? {
        let reversedWindows = UIApplication.shared.windows.reversed()
        for window in reversedWindows {
            if window.screen == UIScreen.main,
                window.isKeyWindow,
                !window.isHidden, window.alpha > 0,
                window.windowLevel >= UIWindowLevelNormal,
                window.windowLevel <= re_maxSupportedWindowLevel
            {
                return window
            }
        }
        return nil
    }
}
