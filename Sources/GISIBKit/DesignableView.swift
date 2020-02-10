//
//  DesignableView.swift
//  IBKit
//
//  Created by Jeremy Xue on 2019/9/2.
//  Copyright © 2019 ytyubox. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
open class DesignableView: UIView {
    
    @IBInspectable
    public
    var cornerRadius: CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
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
