//
//  BaseViewController.swift
//  TestAplikasi
//
//  Created by Macbook on 31/10/23.
//

import UIKit

class BaseViewController: UIViewController {

    lazy var loadingIndicator = PopUpLoading(on: view)

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
