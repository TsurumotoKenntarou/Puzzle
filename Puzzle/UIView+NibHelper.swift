//
//  UIView+NibHelper.swift
//  hapipuro
//
//  Created by 松川旭洋 on 2016/07/14.
//  Copyright © 2016年 Teruhiro Matsukawa. All rights reserved.
//

import UIKit

protocol NibHelper {}

extension NibHelper where Self: UIView {
    static func instantiate() -> Self {
        let nib = UINib(nibName: self.className(), bundle: nil)
        return nib.instantiate(withOwner: nil, options: nil)[0] as! Self
    }
}

extension UIView: NibHelper {}
