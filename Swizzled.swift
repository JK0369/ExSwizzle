//
//  Swizzled.swift
//  ExSwizzling
//
//  Created by 김종권 on 2023/05/20.
//

import UIKit

fileprivate var swizzleEnabled = false

extension UIViewController {
    static let methodSwizzled: Void = {
        guard !swizzleEnabled else { return }
        swizzleEnabled = true
        
        // #selector: swift의 메소드나 함수를 참조하는 방법 (Selector 타입)
        let originalSelector = #selector(viewWillAppear(_:))
        // class_getInstanceMethod: Objecitve-C 런타임 라이브러리에서 제공하며, 메소드를 검색하는데 사용
        let originalMethod = class_getInstanceMethod(UIViewController.self, originalSelector)
        
        let swizzledSelector = #selector(swizzledViewWillAppear(_:))
        let swizzledMethod = class_getInstanceMethod(UIViewController.self, swizzledSelector)
        
        guard let originalMethod, let swizzledMethod else { return }
        method_exchangeImplementations(originalMethod, swizzledMethod)
    }()
    
    @objc private func swizzledViewWillAppear(_ animated: Bool) {
        // Swizzling된 메서드에서 추가적인 동작 수행
        print("Swizzled viewWillAppear called for \(self)")
    }
}
