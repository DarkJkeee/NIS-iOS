//
//  RoundedCornerButton.swift
//  FancyApp
//
//  Created by Глеб Бурштейн on 30.01.2021.
//

import UIKit

@IBDesignable
class RoundedCornerButton: UIButton {

    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }

}
