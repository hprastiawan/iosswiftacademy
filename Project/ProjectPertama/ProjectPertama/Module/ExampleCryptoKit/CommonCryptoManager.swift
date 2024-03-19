//
//  CommonCryptoManager.swift
//  ProjectPertama
//
//  Created by Macbook on 04/03/24.
//


import Foundation
import CommonCrypto


class CommonCryptoManager {
  static let shared = CommonCryptoManager()

  private init() {}

  func sha256Hash(data: Data) -> Data? {
      var hashData = Data(count: Int(CC_SHA256_DIGEST_LENGTH))

      _ = hashData.withUnsafeMutableBytes { hashBytes -> UInt8 in
          data.withUnsafeBytes { dataBytes -> UInt8 in
              if let dataBytesBaseAddress = dataBytes.baseAddress,
                 let hashBytesBaseAddress = hashBytes.bindMemory(to: UInt8.self).baseAddress {
                  // Menghitung hash SHA-256 dari data
                  CC_SHA256(dataBytesBaseAddress, CC_LONG(data.count), hashBytesBaseAddress)
              }
              return 0
          }
      }

      return hashData
  }

}




