//
//  UITextField+Extension.swift
//
//  Created by yanghuang on 2018/3/21.
//

import Foundation
import UIKit
    
// MARK: - Enums
public extension UITextField {
    
    /// textField类型
    ///
    /// - emailAddress: 邮箱地址
    /// - password: 密码
    /// - generic: 通用文案
    public enum TextType {
        case emailAddress
        case password
        case generic
    }
}

// MARK: - Properties
public extension UITextField {
    
    public var re_textType: TextType {
        get {
            if keyboardType == .emailAddress {
                return .emailAddress
            } else if isSecureTextEntry {
                return .password
            }
            return .generic
        }
        set {
            switch newValue {
            case .emailAddress:
                keyboardType = .emailAddress
                autocorrectionType = .no
                autocapitalizationType = .none
                isSecureTextEntry = false
                placeholder = "Email Address"
                
            case .password:
                keyboardType = .asciiCapable
                autocorrectionType = .no
                autocapitalizationType = .none
                isSecureTextEntry = true
                placeholder = "Password"
                
            case .generic:
                isSecureTextEntry = false
                
            }
        }
    }
    /// 是否为空
    public var re_isEmpty: Bool {
        return text?.isEmpty == true
    }
    
    /// 剔除前后空白
    public var re_trimmedText: String? {
        return text?.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    /// 邮箱校验
    public var re_hasValidEmail: Bool {
        return text!.range(of: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}",
                           options: String.CompareOptions.regularExpression,
                           range: nil, locale: nil) != nil
    }
    
    /// Left view tint color.
    @IBInspectable public var re_leftViewTintColor: UIColor? {
        get {
            guard let iconView = leftView as? UIImageView else { return nil }
            return iconView.tintColor
        }
        set {
            guard let iconView = leftView as? UIImageView else { return }
            iconView.image = iconView.image?.withRenderingMode(.alwaysTemplate)
            iconView.tintColor = newValue
        }
    }
    
    /// Right view tint color.
    @IBInspectable public var re_rightViewTintColor: UIColor? {
        get {
            guard let iconView = rightView as? UIImageView else { return nil }
            return iconView.tintColor
        }
        set {
            guard let iconView = rightView as? UIImageView else { return }
            iconView.image = iconView.image?.withRenderingMode(.alwaysTemplate)
            iconView.tintColor = newValue
        }
    }
    
}

// MARK: - Methods
public extension UITextField {
    
    /// Clear text.
    public func re_clear() {
        text = ""
        attributedText = NSAttributedString(string: "")
    }
    
    
    /// placeholder颜色
    public func re_setPlaceHolderTextColor(_ color: UIColor) {
        guard let holder = placeholder, !holder.isEmpty else { return }
        self.attributedPlaceholder = NSAttributedString(string: holder, attributes: [.foregroundColor: color])
    }
    
}
