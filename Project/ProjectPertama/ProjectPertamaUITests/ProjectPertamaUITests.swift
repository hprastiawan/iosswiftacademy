//
//  ProjectPertamaUITests.swift
//  ProjectPertamaUITests
//
//  Created by Macbook on 18/01/24.
//

import XCTest

final class ProjectPertamaUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}



import XCTest

class LoginUITests: XCTestCase {

    // Metode setUpWithError digunakan untuk konfigurasi yang perlu dilakukan sebelum setiap test case dijalankan
    override func setUpWithError() throws {
        // Disabling the continue after failure to stop the test suite execution after the first failure
        continueAfterFailure = false
    }

    // Test case untuk menguji proses login yang sukses
    func testLoginSuccess() throws {
        // Inisialisasi XCUIApplication untuk memulai simulasi aplikasi
        let app = XCUIApplication()
        app.launch()

        // Mengakses elemen-elemen UI menggunakan identifikasi yang telah ditetapkan di dalam aplikasi
        let usernameTextField = app.textFields["Username"]
        let passwordTextField = app.secureTextFields["Password"]
        let loginButton = app.buttons["Login"]

        // Memasukkan teks ke dalam field username dan password
        usernameTextField.tap()
        usernameTextField.typeText("user@example.com")

        passwordTextField.tap()
        passwordTextField.typeText("password123")

        // Tap tombol login
        loginButton.tap()

        // Verifikasi bahwa setelah login, pesan "Welcome, User!" ditampilkan
        XCTAssertTrue(app.staticTexts["Welcome, User!"].exists)
    }
}
