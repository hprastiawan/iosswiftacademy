//
//  CryptoManager.swift
//  ProjectPertama
//
//  Created by Macbook on 04/03/24.
//

import Foundation
import CryptoKit

enum CryptoError: Error {
  case keyGenerationFailed
  case encryptionFailed
  case decryptionFailed
}

class CryptoManager {
  static let shared = CryptoManager()

  private init() {}

  private var key: SymmetricKey?

  func generateSymmetricKey() throws {
    guard #available(iOS 13.0, *) else {
      throw CryptoError.keyGenerationFailed
    }
    self.key = SymmetricKey(size: .bits256)
  }

  func encryptData(_ data: Data) -> Data? {
    guard #available(iOS 13.0, *), let key = self.key else {
      return nil
    }
    do {
      let sealedBox = try AES.GCM.seal(data, using: key)
      return sealedBox.combined
    } catch {
      return nil
    }
  }

  func decryptData(_ sealedBoxData: Data) throws -> Data {
    guard #available(iOS 13.0, *), let key = self.key else {
      throw CryptoError.decryptionFailed
    }
    let sealedBox = try AES.GCM.SealedBox(combined: sealedBoxData)
    let decryptedData = try AES.GCM.open(sealedBox, using: key)
    return decryptedData
  }
}


