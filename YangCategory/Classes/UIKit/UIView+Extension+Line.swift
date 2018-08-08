//
//  UIView+Extension+Line.swift
//  Pods-YangCategory_Example
//
//  Created by yanghuang on 2018/8/7.
//

import UIKit
import SnapKit

let kTopLineTag = 1999999
let kBottomLineTag = 1999998
let kLeftLineTag = 1999997
let kRightLineTag = 1999996

public extension UIView {
    
    static let kLineColor = UIColor(red: 0.93, green: 0.93, blue: 0.93, alpha: 1.0)
    
    @discardableResult
    func re_addTopSeparateLine(leftMargin: CGFloat, rightMargin: CGFloat, color: UIColor = kLineColor) -> UIView {
        var view = self.viewWithTag(kTopLineTag)
        if view == nil {
            view = UIView()
            view?.tag = kTopLineTag
            view?.backgroundColor = color
            self.addSubview(view!)
        }
        view?.snp.makeConstraints {
            $0.top.equalTo(self)
            $0.left.equalTo(self).offset(leftMargin)
            $0.right.equalTo(self).offset(-rightMargin)
            $0.height.equalTo(1.0 / UIScreen.main.scale)
        }
        
        return view!
    }

    @discardableResult
    func re_addBottomSeparateLine(leftMargin: CGFloat, rightMargin: CGFloat, color: UIColor = kLineColor) -> UIView {
        var view = self.viewWithTag(kBottomLineTag)
        if view == nil {
            view = UIView()
            view?.tag = kBottomLineTag
            view?.backgroundColor = color
            self.addSubview(view!)
        }
        view?.snp.makeConstraints {
            $0.bottom.equalTo(self)
            $0.left.equalTo(self).offset(leftMargin)
            $0.right.equalTo(self).offset(-rightMargin)
            $0.height.equalTo(1.0 / UIScreen.main.scale)
        }
        
        return view!
    }
    
    @discardableResult
    func re_addLeftSeparateLine(topMargin: CGFloat, bottomMargin: CGFloat, color: UIColor = kLineColor) -> UIView {
        var view = self.viewWithTag(kLeftLineTag)
        if view == nil {
            view = UIView()
            view?.tag = kLeftLineTag
            view?.backgroundColor = color
            self.addSubview(view!)
        }
        view?.snp.makeConstraints {
            $0.left.equalTo(self)
            $0.top.equalTo(self).offset(topMargin)
            $0.bottom.equalTo(self).offset(-bottomMargin)
            $0.width.equalTo(1.0 / UIScreen.main.scale)
        }
        
        return view!
    }
    
    @discardableResult
    func re_addRightSeparateLine(topMargin: CGFloat, bottomMargin: CGFloat, color: UIColor = kLineColor) -> UIView {
        var view = self.viewWithTag(kBottomLineTag)
        if view == nil {
            view = UIView()
            view?.tag = kBottomLineTag
            view?.backgroundColor = color
            self.addSubview(view!)
        }
        view?.snp.makeConstraints {
            $0.right.equalTo(self)
            $0.top.equalTo(self).offset(topMargin)
            $0.bottom.equalTo(self).offset(-bottomMargin)
            $0.width.equalTo(1.0 / UIScreen.main.scale)
        }
        
        return view!
    }
    
}
