//
//  AppEncrypted.swift
//  ProjectPertama
//
//  Created by Macbook on 01/03/24.
//

//import Foundation
//import CryptoSwift
//
//// Fungsi untuk mengenkripsi string dengan AES-256
//func encryptData(data: String, key: String) -> String? {
//    do {
//        let aes = try AES(key: key.bytes, blockMode: .CBC)
//        let encryptedBytes = try aes.encrypt(data.bytes)
//        return encryptedBytes.toBase64()
//    } catch {
//        print("Error encrypting data: \(error)")
//        return nil
//    }
//}
//
//// Fungsi untuk mendekripsi data yang telah dienkripsi dengan AES-256
//func decryptData(encryptedData: String, key: String) -> String? {
//    do {
//        let aes = try AES(key: key.bytes, blockMode: .CBC)
//        let decryptedBytes = try aes.decrypt(Data(base64Encoded: encryptedData)!.bytes)
//        return String(bytes: decryptedBytes, encoding: .utf8)
//    } catch {
//        print("Error decrypting data: \(error)")
//        return nil
//    }
//}

//// Penggunaan
//let secretKey = "mySecretKey"
//let originalText = "Hello, World!"
//
//// Mengenkripsi data
//if let encryptedText = encryptData(data: originalText, key: secretKey) {
//    print("Encrypted Text: \(encryptedText)")
//
//    // Mendekripsi data
//    if let decryptedText = decryptData(encryptedData: encryptedText, key: secretKey) {
//        print("Decrypted Text: \(decryptedText)")
//    }
//}
//
//
//import Security
//
//// Fungsi untuk mengenkripsi data dengan RSA
//func encryptWithRSA(data: Data, publicKey: SecKey) -> Data? {
//    var error: Unmanaged<CFError>?
//    guard let encryptedData = SecKeyCreateEncryptedData(publicKey, .rsaEncryptionOAEPSHA256, data as CFData, &error) else {
//        print("Error encrypting data: \(error!.takeRetainedValue() as Error)")
//        return nil
//    }
//    return encryptedData as Data
//}
//
//// Penggunaan
//// Misalkan Anda mendapatkan kunci publik dari server
//let publicKey = getServerPublicKey()
//
//// Data yang akan dienkripsi
//let originalData = "Hello, Server!".data(using: .utf8)!
//
//// Mengenkripsi data dengan RSA
//if let encryptedData = encryptWithRSA(data: originalData, publicKey: publicKey) {
//    print("Encrypted Data: \(encryptedData.base64EncodedString())")
//}
//
//import Security
//
//// Fungsi untuk menyimpan kredensial pengguna di Keychain
//func saveCredentials(username: String, password: String) {
//    // Membuat item kredensial dengan username dan password
//    let credentials = "\(username):\(password)"
//    guard let credentialsData = credentials.data(using: .utf8) else { return }
//
//    // Membuat atribut untuk item kredensial
//    let query: [String: Any] = [
//        kSecClass as String: kSecClassGenericPassword,
//        kSecAttrAccount as String: "userCredentials",
//        kSecValueData as String: credentialsData,
//        kSecAttrAccessible as String: kSecAttrAccessibleWhenUnlockedThisDeviceOnly
//    ]
//
//    // Menyimpan item kredensial di Keychain
//    let status = SecItemAdd(query as CFDictionary, nil)
//    guard status == errSecSuccess else {
//        print("Error saving credentials to Keychain")
//        return
//    }
//    print("Credentials saved to Keychain")
//}
//
//// Fungsi untuk mengambil kredensial pengguna dari Keychain
//func retrieveCredentials() -> (username: String, password: String)? {
//    // Membuat query untuk mendapatkan item kredensial dari Keychain
//    let query: [String: Any] = [
//        kSecClass as String: kSecClassGenericPassword,
//        kSecAttrAccount as String: "userCredentials",
//        kSecReturnData as String: kCFBooleanTrue!,
//        kSecMatchLimit as String: kSecMatchLimitOne
//    ]
//
//    // Mendapatkan data kredensial dari Keychain
//    var itemData: CFTypeRef?
//    let status = SecItemCopyMatching(query as CFDictionary, &itemData)
//    guard status == errSecSuccess, let data = itemData as? Data else {
//        print("Error retrieving credentials from Keychain")
//        return nil
//    }
//
//    // Mendekripsi data kredensial
//    guard let credentials = String(data: data, encoding: .utf8)?.split(separator: ":"),
//          let username = credentials.first,
//          let password = credentials.last else {
//        print("Error decoding retrieved credentials")
//        return nil
//    }
//
//    return (String(username), String(password))
//}
//
//// Penggunaan
//let username = "user@example.com"
//let password = "password123"
//
//// Menyimpan kredensial pengguna di Keychain
//saveCredentials(username: username, password: password)
//
//// Mengambil kredensial pengguna dari Keychain
//if let retrievedCredentials = retrieveCredentials() {
//    print("Retrieved Username: \(retrievedCredentials.username)")
//    print("Retrieved Password: \(retrievedCredentials.password)")
//}
//
//
////class ViewController: UIViewController, TableViewDelegate {
////    @IBOutlet weak var tableView: UITableView!
////    var dataSource = TableViewDataSource()
////
////    override func viewDidLoad() {
////        super.viewDidLoad()
////        tableView.dataSource = dataSource
////        tableView.delegate = dataSource
////        dataSource.delegate = self
////    }
////
////    func didSelectItem(atIndex index: Int) {
////        print("Selected item at index: \(index)")
////    }
////}
//
//
//import UIKit
//
//class MyTableViewCell: UITableViewCell {
//    // Mendefinisikan closure untuk aksi yang akan dieksekusi
//    var buttonAction: (() -> Void)?
//
//    // Outlet untuk tombol di dalam sel
//    @IBOutlet weak var actionButton: UIButton!
//
//    // Method untuk menetapkan aksi ke closure
//    func setupButtonAction(action: (() -> Void)?) {
//        buttonAction = action
//    }
//
//    // Method yang dipanggil ketika tombol di dalam sel ditekan
//    @IBAction func buttonTapped(_ sender: UIButton) {
//        // Memanggil closure jika tersedia
//        buttonAction?()
//    }
//}
//
//class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
//    let data = ["Item 1", "Item 2", "Item 3"]
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return data.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "MyTableViewCell", for: indexPath) as! MyTableViewCell
//
//        // Menetapkan aksi ke closure di dalam sel
//        cell.setupButtonAction {
//            print("Button tapped in cell \(indexPath.row)")
//        }
//
//        return cell
//    }
//}
//
//
//import Foundation
//
//// Buat enum untuk menentukan nama notifikasi
//enum NotificationName {
//    static let dataUpdated = Notification.Name("DataUpdatedNotification")
//}
//
//// Buat class untuk menangani NotificationCenter
//class NotificationCenterHandler {
//
//    // Buat metode untuk menambahkan observer
//    func addObserver(forName name: Notification.Name,
//                     object: Any? = nil,
//                     queue: OperationQueue? = nil,
//                     using block: @escaping (Notification) -> Void) {
//        NotificationCenter.default.addObserver(forName: name, object: object, queue: queue, using: block)
//    }
//
//    // Buat metode untuk mengirim notifikasi
//    func postNotification(withName name: Notification.Name,
//                          object: Any? = nil,
//                          userInfo: [AnyHashable: Any]? = nil) {
//        NotificationCenter.default.post(name: name, object: object, userInfo: userInfo)
//    }
//
//    // Buat metode untuk menghapus observer
//    func removeObserver(_ observer: Any,
//                        name: Notification.Name? = nil,
//                        object: Any? = nil) {
//        NotificationCenter.default.removeObserver(observer, name: name, object: object)
//    }
//
//    // Pastikan untuk menghapus observer ketika objek tidak lagi digunakan
//    deinit {
//        NotificationCenter.default.removeObserver(self)
//    }
//}
//
//// Contoh penggunaan
//class SomeClass {
//
//    let notificationCenterHandler = NotificationCenterHandler()
//
//    init() {
//        // Tambahkan observer untuk notifikasi
//        notificationCenterHandler.addObserver(forName: NotificationName.dataUpdated, using: { notification in
//            // Handle notifikasi di sini
//            print("Data telah diperbarui")
//        })
//    }
//
//    // Metode untuk mengirim notifikasi
//    func updateData() {
//        // Proses pembaruan data
//        // Setelah selesai, kirim notifikasi
//        notificationCenterHandler.postNotification(withName: NotificationName.dataUpdated)
//    }
//}
//
//// Contoh penggunaan
//let instance = SomeClass()
//instance.updateData() // Output: "Data telah diperbarui"
