//
//  UIView+Extension.swift
//  NKSmile
//
//  Created by 鶴本賢太朗 on 2016/10/07.
//  Copyright © 2016年 鶴本賢太朗. All rights reserved.
//

import UIKit

extension UIView {
    // MARK: 親Viewの幅を取得する
    internal func getSuperViewWidth() -> CGFloat {
        return superview?.frame.width ?? UIScreen.main.bounds.size.width
    }
    
    // MARK: 親Viewの高さを取得する
    internal func getSuperViewHeight() -> CGFloat {
        return superview?.frame.height ?? UIScreen.main.bounds.size.height
    }
}
