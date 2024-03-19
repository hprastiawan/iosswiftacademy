//
//  ExampleUserDefaultsViewController.swift
//  ProjectPertama
//
//  Created by Macbook on 20/02/24.
//

import UIKit

// Contoh struct yang akan disimpan di UserDefaults
struct Person: Codable {
    let name: String
    let age: Int
}


class ExampleUserDefaultsViewController: UIViewController {

  @IBOutlet weak var switchButton: UISwitch!

  override func viewDidLoad() {
    super.viewDidLoad()

    // Mengatur status tombol switch berdasarkan preferensi yang disimpan
    switchButton.isOn = AppSettings.shared.isDarkModeEnabled
    switchButton.addTarget(self, action: #selector(switchValueDidChange(_:)), for: .valueChanged)

    // Memanggil fungsi untuk menerapkan warna latar belakang
    updateBackgroundColor()
  }

  func savePerson() {
    // Contoh penggunaan
    let personToSave = Person(name: "John", age: 30)
    AppSettings.shared.savePerson(personToSave, forKey: "savedPerson")

    if let retrievedPerson = AppSettings.shared.getPerson(forKey: "savedPerson") {
        print("Retrieved person: \(retrievedPerson)")
    } else {
        print("No person found in UserDefaults.")
    }
  }

  // Fungsi untuk mengubah warna latar belakang berdasarkan preferensi yang disimpan
  func updateBackgroundColor() {
    if AppSettings.shared.isDarkModeEnabled {
      view.backgroundColor = .darkGray
    } else {
      view.backgroundColor = .white
    }
  }

  @objc func switchValueDidChange(_ sender: UISwitch) {
    AppSettings.shared.isDarkModeEnabled = sender.isOn
    updateBackgroundColor()
  }

}
