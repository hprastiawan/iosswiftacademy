//
//  AesCrypto.swift
//  ProjectPertama
//
//  Created by Macbook on 04/03/24.
//

import Foundation
import CommonCrypto

enum CryptoManagerError: Error {
    case encryptionFailed
    case decryptionFailed
}

struct AESCrypto {
    private let key: Data
    private let blockSize = kCCBlockSizeAES128

    init(key: Data) {
        self.key = key
    }

    func encrypt(data: Data) throws -> Data {
        let bufferSize = data.count + blockSize
        var encryptedData = Data(count: bufferSize)

        let status = key.withUnsafeBytes { keyBytes -> Int32 in
            data.withUnsafeBytes { dataBytes -> Int32 in
              guard let keyBytesBaseAddress = keyBytes.baseAddress,
                      let dataBytesBaseAddress = dataBytes.baseAddress,
                      let encryptedDataBytesBaseAddress = encryptedData.withUnsafeMutableBytes({ $0.baseAddress }) else {
                    return Int32()
              }

                let cryptStatus = CCCrypt(CCOperation(kCCEncrypt),
                                          CCAlgorithm(kCCAlgorithmAES),
                                          CCOptions(kCCOptionECBMode),
                                          keyBytesBaseAddress,
                                          key.count,
                                          nil,
                                          dataBytesBaseAddress,
                                          data.count,
                                          encryptedDataBytesBaseAddress,
                                          bufferSize,
                                          nil)

                return cryptStatus
            }
        }

        guard status == kCCSuccess else {
            throw CryptoError.encryptionFailed
        }

        encryptedData.removeSubrange(data.count..<encryptedData.count)
        return encryptedData
    }

    func decrypt(data: Data) throws -> Data {
        let bufferSize = data.count + blockSize
        var decryptedData = Data(count: bufferSize)

        let status = key.withUnsafeBytes { keyBytes -> Int32 in
            data.withUnsafeBytes { dataBytes -> Int32 in
                guard let keyBytesBaseAddress = keyBytes.baseAddress,
                      let dataBytesBaseAddress = dataBytes.baseAddress,
                      let decryptedDataBytesBaseAddress = decryptedData.withUnsafeMutableBytes({ $0.baseAddress }) else {
                    return Int32()
                }

                let cryptStatus = CCCrypt(CCOperation(kCCDecrypt),
                                          CCAlgorithm(kCCAlgorithmAES),
                                          CCOptions(kCCOptionECBMode),
                                          keyBytesBaseAddress,
                                          key.count,
                                          nil,
                                          dataBytesBaseAddress,
                                          data.count,
                                          decryptedDataBytesBaseAddress,
                                          bufferSize,
                                          nil)

                return cryptStatus
            }
        }

        guard status == kCCSuccess else {
            throw CryptoError.decryptionFailed
        }

        // Remove padding bytes
        if let paddingIndex = decryptedData.firstIndex(of: 0x00) {
            decryptedData.removeSubrange(paddingIndex..<decryptedData.endIndex)
        }

        return decryptedData
    }
}
