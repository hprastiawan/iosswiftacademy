//
//  Ext.LoginViewController.swift
//  ProjectPertama
//
//  Created by Macbook on 15/03/24.
//

//import UIKit
//import FirebaseCrashlytics // Impor modul Firebase Crashlytics
//
//class MyViewController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Contoh penggunaan Firebase Crashlytics
//        logCustomEvent()
//        simulateCrash()
//    }
//
//    // Metode untuk merekam event kustom
//    func logCustomEvent() {
//        // Merekam event kustom
//        Crashlytics.crashlytics().log("Custom event occurred")
//    }
//
//    // Metode untuk mensimulasikan crash
//    func simulateCrash() {
//        // Contoh kode yang menyebabkan crash
//        let array = [1, 2, 3]
//        let value = array[5] // Akses indeks yang tidak valid menyebabkan crash
//
//        // Merekam error
//        Crashlytics.crashlytics().record(error: NSError(domain: "MyApp", code: 500, userInfo: [
//            NSLocalizedDescriptionKey: "Simulated crash occurred",
//            "Value": "\(value)"
//        ]))
//    }
//}
//
//let error = NSError(domain: "MyApp", code: 500, userInfo: [NSLocalizedDescriptionKey: "An error occurred"])
//Crashlytics.crashlytics().record(error: error)
//
//Crashlytics.crashlytics().setCustomValue("Premium", forKey: "UserType")
//
//Crashlytics.crashlytics().setUserID("user123")
//
//Crashlytics.crashlytics().checkForUnsentReports()
//
//Crashlytics.crashlytics().deleteUnsentReports()
//
//Crashlytics.crashlytics().sendUnsentReports()
//
//Crashlytics.crashlytics().setEnabled(false) // Menonaktifkan Crashlytics
//
//
//import Firebase
//import FirebaseCrashlytics
//
//func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//    FirebaseApp.configure()
//    Crashlytics.crashlytics().setCrashlyticsCollectionEnabled(true) // Aktifkan Crashlytics
//    return true
//}
//
//// File: LoginViewController.swift
//
//class LoginViewController: UIViewController {
//
//    var authService: AuthServiceProtocol
//
//    init(authService: AuthServiceProtocol) {
//        self.authService = authService
//        super.init(nibName: nil, bundle: nil)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    func login(username: String, password: String) {
//        authService.authenticate(username: username, password: password) { success in
//            if success {
//                // Handling login success
//            } else {
//                // Handling login failure
//            }
//        }
//    }
//}
//
//protocol AuthServiceProtocol {
//    func authenticate(username: String, password: String, completion: @escaping (Bool) -> Void)
//}
//
//import XCTest
//@testable import ProjectPertama
//// Import module aplikasi Anda
//import Mockingjay
//// Contoh library mocking, bisa diganti dengan library lain seperti OHHTTPStubs atau mock network responses secara manual
//
//class LoginViewControllerTests: XCTestCase {
//
//    var sut: LoginViewController!
//    var mockAuthService: MockAuthService!
//
//    override func setUp() {
//        super.setUp()
//        mockAuthService = MockAuthService()
//        sut = LoginViewController(authService: mockAuthService)
//    }
//
//    override func tearDown() {
//        sut = nil
//        mockAuthService = nil
//        super.tearDown()
//    }
//
//    func testLoginSuccess() {
//        // Mock response from AuthService
//        mockAuthService.mockAuthenticateResult = true
//
//        // Call login method
//        sut.login(username: "testUser", password: "password")
//
//        // Assert login success
//        // Your assertion code here
//    }
//
//    func testLoginFailure() {
//        // Mock response from AuthService
//        mockAuthService.mockAuthenticateResult = false
//
//        // Call login method
//        sut.login(username: "testUser", password: "password")
//
//        // Assert login failure
//        // Your assertion code here
//    }
//}
//
//class MockAuthService: AuthServiceProtocol {
//    var mockAuthenticateResult: Bool?
//
//    func authenticate(username: String, password: String, completion: @escaping (Bool) -> Void) {
//        if let result = mockAuthenticateResult {
//            completion(result)
//        } else {
//            XCTFail("Mock response not set for AuthService")
//        }
//    }
//}
//
//// File: LoginViewController.swift
//
//class LoginViewController: UIViewController {
//
//    var authService: AuthServiceProtocol
//
//    init(authService: AuthServiceProtocol) {
//        self.authService = authService
//        super.init(nibName: nil, bundle: nil)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    func login(username: String, password: String) {
//        authService.authenticate(username: username, password: password) { success in
//            if success {
//                // Handling login success
//            } else {
//                // Handling login failure
//            }
//        }
//    }
//}
//
//protocol AuthServiceProtocol {
//    func authenticate(username: String, password: String, completion: @escaping (Bool) -> Void)
//}
//
