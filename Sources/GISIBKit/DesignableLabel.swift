//
//  DesignableLabel.swift
//  IBKit
//
//  Created by Jeremy Xue on 2019/9/11.
//  Copyright © 2019 ytyubox. All rights reserved.
//

import UIKit

@IBDesignable
open
class DesignableLabel: UILabel {
	internal unowned var coreLocale:CoreLocale?
	@IBInspectable
	public var bundleIdentifier:String = "" {
		didSet {
			setupLocale()
		}
	}
	@IBInspectable
	public var localeTextKey:String = "" {
		didSet {
			setupLocale()
		}
	}
	private func setupLocale() {
		guard
			!bundleIdentifier.isEmpty,
			!localeTextKey.isEmpty else {return}
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
}
