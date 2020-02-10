//
//  DesignableTextField.swift
//  19Sports
//
//  Created by Jeremy Xue on 2019/8/26.
//  Copyright © 2019 jeremyxue. All rights reserved.
//

import UIKit

@IBDesignable
open
class DesignableTextField: UITextField {
	internal unowned var coreLocale:CoreLocale?
	@IBInspectable
	public var bundleIdentifier:String = "" {
		didSet {
			setupLocale()
		}
	}
	
	@IBInspectable
	public var localePlaceHolderKey:String = "" {
		didSet {
			setupLocale()
		}
	}
	
	private func setupLocale() {
		guard
			!bundleIdentifier.isEmpty,
			!localePlaceHolderKey.isEmpty else {return}
		if let coreLocale = CoreLocale.CoreLocaleDic[bundleIdentifier] {
			self.coreLocale = coreLocale
		}
		guard let coreLocale = coreLocale else {return}
		coreLocale.add(self)
		setNeedsLayout()
		
	}
	
	@IBInspectable
	public
	var leftImage: UIImage? {
		didSet {
			self.leftViewMode = .always
			self.leftView = UIImageView(image: leftImage)
		}
	}
	
	@IBInspectable
	public
	var placeholderColor: UIColor = .white {
		didSet {
			self.attributedPlaceholder = NSAttributedString(string: self.placeholder ?? "",
															attributes: [NSAttributedString.Key.foregroundColor: placeholderColor])
		}
	}
	
	@IBInspectable
	public
	var borderWidth: CGFloat = 0.0 {
		didSet {
			layer.borderWidth = borderWidth
		}
	}
	
	@IBInspectable
	public
	var borderColor: UIColor = .black {
		didSet {
			layer.borderColor = borderColor.cgColor
		}
	}
	
	@IBInspectable
	public
	var cornerRadius: CGFloat = 0.0 {
		didSet {
			self.layer.cornerRadius = cornerRadius
			self.layer.masksToBounds = cornerRadius > 0.0
		}
	}
	
}
