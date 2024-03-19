//
//  SSLManager.swift
//  ProjectPertama
//
//  Created by Macbook on 04/03/24.
//

import Foundation
import CommonCrypto
import UIKit

class SSLPinningManager: NSObject {

    static let publicKeyHash = "RRM1dGqnDFsCJXBTHky16vi1obOlCgFFn/yOhI/y+ho="

    private static let rsa2048Asn1Header:[UInt8] = [
        0x30, 0x82, 0x01, 0x22, 0x30, 0x0d, 0x06, 0x09, 0x2a, 0x86, 0x48, 0x86,
        0xf7, 0x0d, 0x01, 0x01, 0x01, 0x05, 0x00, 0x03, 0x82, 0x01, 0x0f, 0x00
    ];

    private var isCertificatePinning: Bool = false

    func requestToStartSSLPinnig(withURL url: URL, isCertificatePinning: Bool, completion: @escaping (String) -> Void) {

        let session = URLSession(configuration: .ephemeral, delegate: self, delegateQueue: nil)
        self.isCertificatePinning = isCertificatePinning
        var responseMessage = ""
        let task = session.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print("error: \(error!.localizedDescription): \(error!)")
                responseMessage = "SSL Pinning Failed"
            } else if data != nil {
                let str = String(decoding: data!, as: UTF8.self)
                print("Received data:\n\(str)")
                if isCertificatePinning {
                    responseMessage = "SSL Pinnig with Certificate is successfully completed"
                }else {
                    responseMessage = "SSL Pinnig with Public key is successfully completed"
                }
            }
            DispatchQueue.main.async {
                completion(responseMessage)
            }
        }
        task.resume()
    }

    private func sha256(data : Data) -> String {

        var keyWithHeader = Data(SSLPinningManager.rsa2048Asn1Header)
        keyWithHeader.append(data)
        var hash = [UInt8](repeating: 0,  count: Int(CC_SHA256_DIGEST_LENGTH))
        keyWithHeader.withUnsafeBytes { buffer in
              _ = CC_SHA256(buffer.baseAddress!, CC_LONG(buffer.count), &hash)
          }
        return Data(hash).base64EncodedString()
    }
}

extension SSLPinningManager: URLSessionDelegate {
    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {

        guard let serverTrust = challenge.protectionSpace.serverTrust else {
            completionHandler(.cancelAuthenticationChallenge, nil);
            return
        }

        if self.isCertificatePinning {
            //Get Certificate
            let certificate = SecTrustGetCertificateAtIndex(serverTrust, 0) // For Leaf 0, For Intermediate 1, For Root 2(In this tutorial we have used Leaf Certificate)

            // SSL Policies for domain name check
            let policy = NSMutableArray()
            policy.add(SecPolicyCreateSSL(true, challenge.protectionSpace.host as CFString))

            //Evaluate server certifiacte
            let isServerTrusted = SecTrustEvaluateWithError(serverTrust, nil)

            //Local and Remote certificates Data
            let remoteCertificateData:NSData =  SecCertificateCopyData(certificate!)
            let pathToCertificate = Bundle.main.path(forResource: "Leaf", ofType: "cer")
            let localCertificateData:NSData = NSData(contentsOfFile: pathToCertificate!)!

            //Compare certificates
            if(isServerTrusted && remoteCertificateData.isEqual(to: localCertificateData as Data)){
                let credential:URLCredential =  URLCredential(trust:serverTrust)
                print("SSL Pinnig with Certificate is successfully completed")
                completionHandler(.useCredential,credential)
            }
            else {
                print("SSL Pinnig with Certificate is failed")
                completionHandler(.cancelAuthenticationChallenge,nil)
            }
        }

        else {
            if let serverCertificate = SecTrustGetCertificateAtIndex(serverTrust, 1) {
                // Server public key
                let serverPublicKey = SecCertificateCopyKey(serverCertificate)

                // Server public key Data
                let serverPublicKeyData = SecKeyCopyExternalRepresentation(serverPublicKey!, nil )!
                let data:Data = serverPublicKeyData as Data

                // Server Hash key
                let serverHashKey = sha256(data: data)
                // Local Hash Key
                let publickKeyLocal = type(of: self).publicKeyHash

                if (serverHashKey == publickKeyLocal) {
                    print("SSL Pinnig with Public key is successfully completed")
                    completionHandler(.useCredential, URLCredential(trust:serverTrust))
                    return
                }
                else {
                    completionHandler(.cancelAuthenticationChallenge,nil)
                    print("SSL Pinnig with Public key is failed")
                }
            }
        }
    }
}


//import Alamofire
//
//// Path to the certificate file
//let certificatePath = Bundle.main.path(forResource: "certificate", ofType: "cer")
//let certificateData = try! Data(contentsOf: URL(fileURLWithPath: certificatePath!))
//let certificates = [SecCertificateCreateWithData(nil, certificateData as CFData)!.takeRetainedValue()]
//
//// SSL Pinning configuration
//let serverTrustPolicy = ServerTrustPolicy.pinCertificates(
//    certificates: certificates,
//    validateCertificateChain: true,
//    validateHost: true
//)
//let serverTrustPolicies = [
//    "your.server.com": serverTrustPolicy
//]
//
//let sessionManager = Session(
//    serverTrustManager: ServerTrustManager(policies: serverTrustPolicies)
//)
//
//
//import Foundation
//
//// Path to the certificate file
//let certificatePath = Bundle.main.path(forResource: "certificate", ofType: "cer")
//let certificateData = try! Data(contentsOf: URL(fileURLWithPath: certificatePath!))
//
//// Create a URLSession configuration
//let configuration = URLSessionConfiguration.default
//
//// Set up SSL Pinning
//let pinnedCertificates: [SecCertificate] = [
//    SecCertificateCreateWithData(nil, certificateData as CFData)!
//]
//
//configuration.urlCredentialStorage = nil // Disable URL credential storage
//configuration.httpAdditionalHeaders = ["Accept": "application/json"] // Set additional headers if needed
//
//let serverTrustPolicy = ServerTrustPolicy.pinCertificates(
//    certificates: ServerTrustPolicy.certificates(),
//    validateCertificateChain: true,
//    validateHost: true
//)
//let serverTrustPolicies: [String: ServerTrustPolicy] = [
//    "your.server.com": serverTrustPolicy
//]
//
//let serverTrustManager = ServerTrustManager(policies: serverTrustPolicies)
//let sessionDelegate = SessionDelegate()
//let session = URLSession(configuration: configuration, delegate: sessionDelegate, delegateQueue: nil)
//
//// Perform URLSession data task
//let url = URL(string: "https://your.server.com/endpoint")!
//let task = session.dataTask(with: url) { data, response, error in
//    // Handle response
//}
//
//task.resume()

//func calculateTotalPrice(price: Double, quantity: Int, discountPercentage: Double) -> Double {
//    let total = price * Double(quantity)
//    let discountAmount = total * (discountPercentage / 100)
//    let totalPrice = total - discountAmount
//    return totalPrice
//}
//
//import XCTest
//
//class MyTests: XCTestCase {
//
//    func testCalculateTotalPrice() {
//        // Arrange
//        let price = 10.0
//        let quantity = 5
//        let discountPercentage = 20.0
//        let expectedTotalPrice = 40.0
//
//        // Act
//        let totalPrice = calculateTotalPrice(price: price, quantity: quantity, discountPercentage: discountPercentage)
//
//        // Assert
//        XCTAssertEqual(totalPrice, expectedTotalPrice, "Total price calculation is incorrect")
//    }
//}
//
//func add(_ a: Int, _ b: Int) -> Int {
//    return a + b
//}
//
//
//import XCTest
//
//class MathFunctionsTests: XCTestCase {
//
//    // Test case untuk memverifikasi fungsi add(_:_:)
//    func testAdd() {
//        // Persiapkan input
//        let a = 5
//        let b = 3
//
//        // Panggil fungsi yang akan diuji
//        let result = add(a, b)
//
//        // Verifikasi hasil
//        XCTAssertEqual(result, 8, "Hasil penambahan tidak sesuai dengan yang diharapkan")
//    }
//
//    // Test case lainnya, misalnya untuk menguji fungsi lain
//    // func testFunctionName() { ... }
//
//}
//
//// Code di bawah ini digunakan untuk menjalankan unit test yang sudah ditentukan di atas
//// Ini adalah kode yang digunakan oleh Xcode untuk menjalankan unit test
//// Saat menjalankan aplikasi di Xcode, unit test akan secara otomatis dijalankan
//
//let mathFunctionsTests = MathFunctionsTests()
//mathFunctionsTests.testAdd()

