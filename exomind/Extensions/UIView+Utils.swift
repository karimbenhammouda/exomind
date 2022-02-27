//
//  UIView+Utils.swift
//  exomind
//
//  Created by Karim BEN HAMMOUDA on 27/02/2022.
//

import UIKit

extension UIView {
    func setRadius(_ radius: CGFloat? = nil) {
        layer.cornerRadius = radius ?? frame.height / 2
        layer.masksToBounds = true
    }
}
