//
//  UIButtonExtensions.swift
//  SwifterSwift
//
//  Created by Omar Albeik on 8/22/16.
//  Copyright © 2016 SwifterSwift
//


#if os(iOS) || os(tvOS)
    
import UIKit
    
// MARK: - Properties
public extension UIButton {
    
    /// Set The Image from color for UICongtrolState
    public func re_set(backgroundColor color: UIColor?, for state: UIControlState) {
        setImage(color?.re_toImage, for: state)
    }
    
	/// SwifterSwift: Image of disabled state for button; also inspectable from Storyboard.
	@IBInspectable public var re_imageForDisabled: UIImage? {
		get {
			return image(for: .disabled)
		}
		set {
			setImage(newValue, for: .disabled)
		}
	}
	
	/// SwifterSwift: Image of highlighted state for button; also inspectable from Storyboard.
	@IBInspectable public var re_imageForHighlighted: UIImage? {
		get {
			return image(for: .highlighted)
		}
		set {
			setImage(newValue, for: .highlighted)
		}
	}
	
	/// SwifterSwift: Image of normal state for button; also inspectable from Storyboard.
	@IBInspectable public var re_imageForNormal: UIImage? {
		get {
			return image(for: .normal)
		}
		set {
			setImage(newValue, for: .normal)
		}
	}
	
	/// SwifterSwift: Image of selected state for button; also inspectable from Storyboard.
	@IBInspectable public var re_imageForSelected: UIImage? {
		get {
			return image(for: .selected)
		}
		set {
			setImage(newValue, for: .selected)
		}
	}
	
	/// SwifterSwift: Title color of disabled state for button; also inspectable from Storyboard.
	@IBInspectable public var re_titleColorForDisabled: UIColor? {
		get {
			return titleColor(for: .disabled)
		}
		set {
			setTitleColor(newValue, for: .disabled)
		}
	}
	
	/// SwifterSwift: Title color of highlighted state for button; also inspectable from Storyboard.
	@IBInspectable public var re_titleColorForHighlighted: UIColor? {
		get {
			return titleColor(for: .highlighted)
		}
		set {
			setTitleColor(newValue, for: .highlighted)
		}
	}
	
	/// SwifterSwift: Title color of normal state for button; also inspectable from Storyboard.
	@IBInspectable public var re_titleColorForNormal: UIColor? {
		get {
			return titleColor(for: .normal)
		}
		set {
			setTitleColor(newValue, for: .normal)
		}
	}
	
	/// SwifterSwift: Title color of selected state for button; also inspectable from Storyboard.
	@IBInspectable public var re_titleColorForSelected: UIColor? {
		get {
			return titleColor(for: .selected)
		}
		set {
			setTitleColor(newValue, for: .selected)
		}
	}
	
	/// SwifterSwift: Title of disabled state for button; also inspectable from Storyboard.
	@IBInspectable public var re_titleForDisabled: String? {
		get {
			return title(for: .disabled)
		}
		set {
			setTitle(newValue, for: .disabled)
		}
	}
	
	/// SwifterSwift: Title of highlighted state for button; also inspectable from Storyboard.
	@IBInspectable public var re_titleForHighlighted: String? {
		get {
			return title(for: .highlighted)
		}
		set {
			setTitle(newValue, for: .highlighted)
		}
	}
	
	/// SwifterSwift: Title of normal state for button; also inspectable from Storyboard.
	@IBInspectable public var re_titleForNormal: String? {
		get {
			return title(for: .normal)
		}
		set {
			setTitle(newValue, for: .normal)
		}
	}
	
	/// SwifterSwift: Title of selected state for button; also inspectable from Storyboard.
	@IBInspectable public var re_titleForSelected: String? {
		get {
			return title(for: .selected)
		}
		set {
			setTitle(newValue, for: .selected)
		}
	}
	
}

// MARK: - Methods
public extension UIButton {
	
	private var re_states: [UIControlState] {
		return [.normal, .selected, .highlighted, .disabled]
	}
	
	/// SwifterSwift: Set image for all states.
	///
	/// - Parameter image: UIImage.
	public func re_setImageForAllStates(_ image: UIImage) {
		re_states.forEach { self.setImage(image, for: $0) }
	}
	
	/// SwifterSwift: Set title color for all states.
	///
	/// - Parameter color: UIColor.
	public func re_setTitleColorForAllStates(_ color: UIColor) {
		re_states.forEach { self.setTitleColor(color, for: $0) }
	}
	
	/// SwifterSwift: Set title for all states.
	///
	/// - Parameter title: title string.
	public func re_setTitleForAllStates(_ title: String) {
		re_states.forEach { self.setTitle(title, for: $0) }
	}
	
}
#endif
