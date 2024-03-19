//
//  AppSettings.swift
//  ProjectPertama
//
//  Created by Macbook on 20/02/24.
//

import Foundation
import RxSwift

struct SettingsKey: Hashable {
  let rawValue: String

  init(rawValue: String) {
    self.rawValue = rawValue
  }
}

class AppSettings {
  // Membuat instance singleton
  static let shared = AppSettings()
  private let userDefaults = UserDefaults.standard

  // Private initializer agar tidak bisa diakses dari luar kelas
  private init() {}

  // Function untuk menyimpan nilai boolean ke UserDefaults
  func saveBooleanValue(_ value: Bool, forKey key: String) {
    UserDefaults.standard.set(value, forKey: key)
  }

  // Function untuk mengambil nilai boolean dari UserDefaults
  func getBooleanValue(forKey key: String) -> Bool {
    return UserDefaults.standard.bool(forKey: key)
  }

  // Function untuk menyimpan nilai string ke UserDefaults
  func saveStringValue(_ value: String, forKey key: String) {
    UserDefaults.standard.set(value, forKey: key)
  }

  // Function untuk mengambil nilai string dari UserDefaults
  func getStringValue(forKey key: String) -> String? {
    return UserDefaults.standard.string(forKey: key)
  }


  // Properti untuk menyimpan dan mengambil nilai boolean dari UserDefaults
  var isDarkModeEnabled: Bool {
    get {
      return UserDefaults.standard.bool(forKey: "isDarkModeEnabled")
    }
    set {
      UserDefaults.standard.set(newValue, forKey: "isDarkModeEnabled")
    }
  }

  // Properti untuk menyimpan dan mengambil nilai string dari UserDefaults
  var username: String? {
    get {
      return UserDefaults.standard.string(forKey: "username")
    }
    set {
      UserDefaults.standard.set(newValue, forKey: "username")
    }
  }

  // Function untuk menghapus nilai dari UserDefaults
  func removeValue(forKey key: String) {
    UserDefaults.standard.removeObject(forKey: key)
  }

  // Simpan data struct di UserDefaults
  func savePerson(_ person: Person, forKey key: String) {
    do {
      let encoder = JSONEncoder()
      let encodedData = try encoder.encode(person)
      userDefaults.set(encodedData, forKey: key)
    } catch {
      print("Error encoding person: \(error)")
    }
  }

  // Ambil data struct dari UserDefaults
  func getPerson(forKey key: String) -> Person? {
    guard let savedData = userDefaults.data(forKey: key) else {
      return nil
    }

    do {
      let decoder = JSONDecoder()
      let person = try decoder.decode(Person.self, from: savedData)
      return person
    } catch {
      print("Error decoding person: \(error)")
      return nil
    }
  }
}
