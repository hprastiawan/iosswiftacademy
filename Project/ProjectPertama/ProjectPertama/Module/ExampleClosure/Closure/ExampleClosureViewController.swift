//
//  ExampleClosureViewController.swift
//  ProjectPertama
//
//  Created by Macbook on 24/04/24.
//


import UIKit

// Buat notifikasi nama "DataNotification"
extension Notification.Name {
    static let DataNotification = Notification.Name("DataNotification")
}

class CustomView: UIView {

    // Closure untuk menangani aksi button
    var buttonAction: (() -> Void)?

    // Button di dalam UIView
    private lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Tap Me", for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        // Tambahkan button ke dalam UIView
        addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: centerXAnchor),
            button.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // Method untuk menangani aksi ketika tombol ditekan
    @objc private func buttonTapped() {
        // Panggil closure jika ada
        buttonAction?()
    }
}

class ExampleClosureViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

//        NotificationCenter.default.addObserver(self, selector: #selector(handleDataNotification(_:)), name: .DataNotification, object: nil)


        // Membuat instance dari CustomView
        let customView = CustomView(frame: CGRect(x: 100, y: 100, width: 200, height: 100))
        customView.backgroundColor = .yellow
        view.addSubview(customView)

        // Mengatur closure untuk menangani aksi button di dalam CustomView
        customView.buttonAction = {

          let data: [String: Any] = ["message": "Hello, world!"]
          NotificationCenter.default.post(name: .DataNotification, object: nil, userInfo: data)
            print("Button tapped in CustomView")
            // Tambahkan logika lain yang diperlukan di sini

          let vc = ExampleNotificationCenterViewController()
          self.navigationController?.pushViewController(vc, animated: false) 
        }
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

