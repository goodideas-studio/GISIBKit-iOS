//
//  DesignableButton.swift
//  19Sports
//
//  Created by Jeremy Xue on 2019/8/26.
//  Copyright © 2019 jeremyxue. All rights reserved.
//

import UIKit

@IBDesignable
open
class DesignableButton: UIButton {
	internal unowned var coreLocale:CoreLocale?
	@IBInspectable
	public var bundleIdentifier:String = "" {
		didSet {
			setupLocale()
		}
	}
	
	@IBInspectable
	public var localeNormalTitleKey:String = "" {
		didSet {
			setupLocale()
		}
	}
	private func setupLocale() {
		guard
			!bundleIdentifier.isEmpty,
			!localeNormalTitleKey.isEmpty else {return}
		if let coreLocale = CoreLocale.CoreLocaleDic[bundleIdentifier] {
			self.coreLocale = coreLocale
		}
		guard let coreLocale = coreLocale else {return}
		coreLocale.add(self)
	}
    @IBInspectable
    public
    var cornerRadius: CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
            self.layer.masksToBounds = cornerRadius > 0.0
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
    var shadowColor: UIColor = .black {
        didSet {
            layer.shadowOpacity = 1
            layer.shadowColor = shadowColor.cgColor
        }
    }
    
    @IBInspectable
    public
    var shadowRadius: CGFloat = 0 {
        didSet {
            layer.shadowRadius = shadowRadius
        }
    }
    
    @IBInspectable
    public
    var shadowOffset: CGSize = .zero {
        didSet {
            layer.shadowOffset = shadowOffset
        }
    }
    
}
