//
//  KeychainManager.swift
//  ProjectPertama
//
//  Created by Macbook on 20/02/24.
//

import Foundation
import Security
import netfox

class KeychainManager {
  
  static let shared = KeychainManager()

  private init() {}

  //Contoh penggunaan Keychain untuk menyimpan Token yang didapat dari API:
  func storeToken(with token: String) {
    let tokenData = token.data(using: .utf8)

    let query: [CFString: Any] = [
      kSecClass: kSecClassGenericPassword,
      kSecAttrAccount: "AuthToken",
      kSecValueData: tokenData!,
    ]

    let status = SecItemAdd(query as CFDictionary, nil)

    if status == errSecSuccess {
      print("Token saved to Keychain")
    } else {
      print("Failed to save token to Keychain")
    }
  }

  //Contoh penggunaan Keychain untuk mengambil token dari database Keychain
  func retrieveToken() -> String {
    let query: [CFString: Any] = [
      kSecClass: kSecClassGenericPassword,
      kSecAttrAccount: "AuthToken",
      kSecReturnData: kCFBooleanTrue!,
    ]

    var tokenData: AnyObject?
    let status = SecItemCopyMatching(query as CFDictionary, &tokenData)

    if status == errSecSuccess, let data = tokenData as? Data, let token = String(data: data, encoding: .utf8) {
      print("Stored token: \(token)")
      return token
    } else {
      print("Token not found in Keychain")
      return ""
    }
  }

  // Contoh penggunaan Keychain untuk menghapus token dari database Keychain
  func deleteToken() {
    let query: [CFString: Any] = [
      kSecClass: kSecClassGenericPassword,
      kSecAttrAccount: "AuthToken",
    ]

    let status = SecItemDelete(query as CFDictionary)

    if status == errSecSuccess {
      print("Token deleted from Keychain")
    } else {
      print("Failed to delete token from Keychain")
    }
  }

  // Penggunaan Keychain untuk memeriksa apakah sudah terdapat token di dalam database
  func isTokenExist() -> Bool {
    let query: [CFString: Any] = [
      kSecClass: kSecClassGenericPassword,
      kSecAttrAccount: "AuthToken",
      kSecReturnData: kCFBooleanTrue as Any,
    ]

    var tokenData: AnyObject?
    let status = SecItemCopyMatching(query as CFDictionary, &tokenData)

    return status == errSecSuccess ? true : false
  }

}
