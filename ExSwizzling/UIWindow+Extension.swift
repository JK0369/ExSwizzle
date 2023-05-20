//
//  UIWindow+Extension.swift
//  ExSwizzling
//
//  Created by 김종권 on 2023/05/20.
//

import UIKit

fileprivate var isSwizzled = false

@available(iOS 8.0, *)
extension UIWindow {
    
    public func swizzle() {
        guard isSwizzled == false else {
            return
        }

        let sendEvent = class_getInstanceMethod(
            object_getClass(self),
            #selector(UIApplication.sendEvent(_:))
        )
        let swizzledSendEvent = class_getInstanceMethod(
            object_getClass(self),
            #selector(UIWindow.swizzledSendEvent(_:))
        )
        method_exchangeImplementations(sendEvent!, swizzledSendEvent!)
        
        isSwizzled = true
    }
}

// MARK: - Swizzle
extension UIWindow {
    @objc public func swizzledSendEvent(_ event: UIEvent) {
        print("test>>", event)
    }
}
