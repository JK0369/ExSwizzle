//
//  ViewController.swift
//  ExSwizzling
//
//  Created by 김종권 on 2023/05/20.
//

import UIKit

class BaseViewController: UIViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("viewWillAppear in BaseViewController")
    }
}

class ViewController: BaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("called?")
    }
}
