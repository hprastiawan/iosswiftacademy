//
//  ExampleCyptoKitViewController.swift
//  ProjectPertama
//
//  Created by Macbook on 04/03/24.
//

import UIKit
import CryptoKit
import CommonCrypto

class ExampleCyptoKitViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    testCommonCrypto2()
  }


}

extension ExampleCyptoKitViewController {
  
  func testCommonCryto() {
    // Contoh penggunaan
    let dataToHash = "Hello, World!".data(using: .utf8)!
    if let hashedData = CommonCryptoManager.shared.sha256Hash(data: dataToHash) {
        print("Hashed data:", hashedData.map { String(format: "%02hhx", $0) }.joined())
    } else {
        print("Failed to calculate hash.")
    }

  }

  func testCommonCrypto2() {
    // Contoh penggunaan
    let keyString = "thisisakeyforaesencryption"
    let keyData = Data(keyString.utf8)
    let aesCrypto = AESCrypto(key: keyData)

    let plaintext = "Hello, World!".data(using: .utf8)!
    do {
        let encryptedData = try aesCrypto.encrypt(data: plaintext)
        print("Encrypted data:", encryptedData.base64EncodedString())

        let decryptedData = try aesCrypto.decrypt(data: encryptedData)
        let decryptedString = String(data: decryptedData, encoding: .utf8)!
        print("Decrypted data:", decryptedString)
    } catch {
        print("Error:", error)
    }
  }
}

extension ExampleCyptoKitViewController {

  func testEncrypted() {
    // Generate symmetric key
    let symmetricKey = SymmetricKey(size: .bits256)

    // Data to be encrypted
    let plainText = "Hello, World!".data(using: .utf8)!

    do {
      // Encrypt data
      let sealedBox = try AES.GCM.seal(plainText, using: symmetricKey)

      // Decrypt data
      let decryptedData = try AES.GCM.open(sealedBox, using: symmetricKey)

      // Convert decrypted data to string
      let decryptedString = String(data: decryptedData, encoding: .utf8)
      print(decryptedString ?? "") // Output: Hello, World!
    } catch {
      print("Error: \(error)")
    }
  }

  func testEncrypted2() {
    // Generate key pair
    let privateKey = P256.Signing.PrivateKey()
    let publicKey = privateKey.publicKey

    // Data yang akan ditandatangani
    let message = "This is a message".data(using: .utf8)!

    do {
      // Buat tanda tangan digital
      let signature = try privateKey.signature(for: message)

      // Verifikasi tanda tangan
      let isValid = publicKey.isValidSignature(signature, for: message)

      print("Is Signature Valid: \(isValid)") // Output: true
    } catch {
    }
  }

  func testEncrypted4() {
    do {
        try CryptoManager.shared.generateSymmetricKey()
        let originalData = "Hello, World!".data(using: .utf8)!
        guard let encryptedData = try CryptoManager.shared.encryptData(originalData) else { return }
        let decryptedData = try CryptoManager.shared.decryptData(encryptedData)
        let decryptedString = String(data: decryptedData, encoding: .utf8)!
        print("Decrypted String: \(decryptedString)") // Output: Hello, World!
    } catch {
        switch error {
        case CryptoError.keyGenerationFailed:
            print("Failed to generate symmetric key.")
        case CryptoError.encryptionFailed:
            print("Encryption failed.")
        case CryptoError.decryptionFailed:
            print("Decryption failed.")
        default:
            print("An unknown error occurred: \(error)")
        }
    }
  }

}

extension ExampleCyptoKitViewController {
  // Fungsi untuk menghasilkan hash dari kata sandi
  func hashPassword(_ password: String) -> String {
      let passwordData = Data(password.utf8)
      let hashed = SHA256.hash(data: passwordData)
      return hashed.compactMap { String(format: "%02x", $0) }.joined()
  }

  // Fungsi untuk memeriksa kecocokan antara kata sandi dan hash
  func verifyPassword(_ password: String, _ hashedPassword: String) -> Bool {
      let hashed = hashPassword(password)
      return hashed == hashedPassword
  }

  func implemented() {
    // Contoh penggunaan
    let password = "password123"
    let hashedPassword = hashPassword(password)
    print("Hashed Password: \(hashedPassword)")

    let enteredPassword = "password123"
    if verifyPassword(enteredPassword, hashedPassword) {
        print("Password is correct!")
    } else {
        print("Password is incorrect!")
    }
  }

}








