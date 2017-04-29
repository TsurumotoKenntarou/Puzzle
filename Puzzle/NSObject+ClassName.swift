//
//  NSObject+ClassName.swift
//  hapipuro
//
//  Created by 松川旭洋 on 2016/07/06.
//  Copyright © 2016年 Teruhiro Matsukawa. All rights reserved.
//

import Foundation

extension NSObject {
    class func className() -> String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}
