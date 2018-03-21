//
//  UITableViewCellExtension.swift
//  Hero
//
//  Created by lbencs on 07/12/2017.
//

import Foundation

public extension UITableViewCell {
    ///
    ///!!! call in application:didFinishLaunchingWithOptions:
    /// Custom UITableViewCell's selected color
    /// By Swizze TableViewCell's didMoveToSuperview
    ///
    /// - Parameter backgroundColor: UIColor
    public class func re_configSelected(backgroundColor: UIColor) {
        guard self === UITableViewCell.self else { return }
        objc_setAssociatedObject(self, &AssociateKeys.selectedBackgroundColor, backgroundColor, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        tableViewCell_swizzling(self)
    }
    
    /// 获取当前Cell所处的第一个父TableView
    public var re_superTablView: UITableView? {
        
        func superTableView(view: UIView) -> UIView? {
            guard let superView = view.superview else {
                return nil
            }
            if superView.isKind(of: UITableView.classForCoder()) {
                return superView as? UITableView
            } else {
                return superTableView(view: superView)
            }
        }
        return superTableView(view: self) as? UITableView
    }
}

//Mark: - Private tools

fileprivate extension UITableViewCell {
    
    fileprivate struct AssociateKeys {
        static var selectedBackgroundColor = "selectedBackgroundColor"
    }
    
    @objc fileprivate func swizzle_didMoveToSuperview() {
        self.swizzle_didMoveToSuperview()
        //全局替换Cell选中以后的背景色
        guard selectedBackgroundView != nil else {
            return
        }
        guard selectionStyle != .none else {
            return
        }
        DispatchQueue.main.async {
            self.selectedBackgroundView = {
                let view = UIView(frame: self.contentView.bounds)
                if let color = objc_getAssociatedObject(self, &AssociateKeys.selectedBackgroundColor) as? UIColor {
                    view.backgroundColor = color
                }
                return view
            }()
        }
    }
}

private let tableViewCell_swizzling: (UITableViewCell.Type) -> Void = { TableViewCell in
    
    let originalSelector = #selector(TableViewCell.didMoveToSuperview)
    let swizzledSelector = #selector(TableViewCell.swizzle_didMoveToSuperview)
    
    if let originalMethod = class_getInstanceMethod(TableViewCell, originalSelector),
        let swizzledMethod = class_getInstanceMethod(TableViewCell, swizzledSelector) {
        method_exchangeImplementations(originalMethod, swizzledMethod)
    }
}
