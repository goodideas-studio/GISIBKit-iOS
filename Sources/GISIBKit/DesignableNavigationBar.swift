//
//  DesignableNavigationBar.swift
//  IBKit
//
//  Created by Jeremy Xue on 2019/9/10.
//  Copyright © 2019 ytyubox. All rights reserved.
//

import UIKit

@IBDesignable
open class DesignableNavigationBar: UINavigationBar {
    
    @IBInspectable
    public
    var isHideShadow: Bool = false {
        didSet {
            self.shadowImage = isHideShadow ? UIImage() : nil
        }
    }
}
