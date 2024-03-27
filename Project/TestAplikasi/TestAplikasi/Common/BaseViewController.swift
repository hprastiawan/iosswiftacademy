//
//  BaseViewController.swift
//  TestAplikasi
//
//  Created by Macbook on 31/10/23.
//

import UIKit
import MyPackage1
import MyLibraryContoh

class BaseViewController: UIViewController {

    lazy var loadingIndicator = PopUpLoading(on: view)

    let car = Car(brand: "Tesla", year: 2019, mileage: 180.5)

    override func viewDidLoad() {
        super.viewDidLoad()
        

    }

}
