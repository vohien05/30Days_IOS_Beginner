//
//  RoundBorderButton.swift
//  Quizzler_Clone
//
//  Created by Thien Tran on 9/25/20.
//

import UIKit

@IBDesignable
class  RoundBorderButton: UIButton {
    @IBInspectable var rBorderWidth : CGFloat = 0 {
        didSet {
            layer.borderWidth = rBorderWidth
        }
    }
    
    @IBInspectable var rBorderColor : UIColor? {
        didSet {
            layer.borderColor = rBorderColor?.cgColor
        }
    }
    
    @IBInspectable var rBoderRadius : CGFloat = 0 {
        didSet {
            layer.cornerRadius = rBoderRadius
        }
    }
}
