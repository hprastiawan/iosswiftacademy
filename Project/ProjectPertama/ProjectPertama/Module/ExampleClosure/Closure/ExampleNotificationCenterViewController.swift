//
//  ExampleNotificationCenterViewController.swift
//  ProjectPertama
//
//  Created by Macbook on 24/04/24.
//

import UIKit



//class SenderViewController: UIViewController {
//
//    @IBAction func sendData(_ sender: UIButton) {
//        // Kirim notifikasi dengan data
//        let data: [String: Any] = ["message": "Hello, world!"]
//        NotificationCenter.default.post(name: .DataNotification, object: nil, userInfo: data)
//    }
//}


class ExampleNotificationCenterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)
    // Daftarkan observer untuk notifikasi "DataNotification"

    NotificationCenter.default.addObserver(self, selector: #selector(handleDataNotification(_:)), name: .DataNotification, object: nil)

  }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    @objc func handleDataNotification(_ notification: Notification) {
        // Ambil data dari userInfo
        if let userInfo = notification.userInfo {
            if let message = userInfo["message"] as? String {
                // Tampilkan alert dengan pesan yang diterima
                let alert = UIAlertController(title: "Data Received", message: message, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                present(alert, animated: true, completion: nil)
            }
        }
    }
}

