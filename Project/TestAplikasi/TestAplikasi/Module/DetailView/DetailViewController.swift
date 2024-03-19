//
//  DetailViewController.swift
//  TestAplikasi
//
//  Created by Macbook on 26/10/23.
//

import UIKit

class DetailViewController: UIViewController {

    var person: Person?

    var closureData: ((String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tabBarController?.tabBar.isHidden = true
    }


    @IBAction func actionButton(_ sender: Any) {

    }

}
