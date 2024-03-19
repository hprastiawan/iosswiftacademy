//
//  LoginViewControllerTests.swift
//  ProjectPertamaTests
//
//  Created by Macbook on 05/03/24.
//

import XCTest
@testable import ProjectPertama

final class LoginViewControllerTests: XCTestCase {

  var viewController: LoginViewController!
  var mockAuthService: MockAuthService!

  override func setUp() {
    super.setUp()
    viewController = LoginViewController()
    viewController.loadViewIfNeeded()

    mockAuthService = MockAuthService()
//    viewController.authService = mockAuthService // Inject mock auth service
  }

  func testLoginButtonTapped_Success() {
    // Simulate user interaction
    viewController.usernameTextField.text = "username"
    viewController.passwordTextField.text = "password"
    viewController.loginButton.sendActions(for: .touchUpInside)

    // Assert the expected outcome
    XCTAssertTrue(viewController.loginSuccess)
  }

  func testLoginButtonTapped_Failure() {
    // Simulate user interaction
    viewController.usernameTextField.text = "invalid_username"
    viewController.passwordTextField.text = "invalid_password"
    viewController.loginButton.sendActions(for: .touchUpInside)

    // Assert the expected outcome
    XCTAssertFalse(viewController.loginSuccess)
  }
  // Add more test cases as needed
}

// Mock AuthService for testing
class MockAuthService {
    func login(username: String, password: String, completion: @escaping (Bool) -> Void) {
        // Simulate successful login if username and password match "username" and "password"
        if username == "username" && password == "password" {
            completion(true)
        } else {
            completion(false)
        }
    }
}

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!

    var loginSuccess = false // Property to track login success

    override func viewDidLoad() {
        super.viewDidLoad()
        // Additional setup code
    }

    @IBAction func loginButtonTapped(_ sender: UIButton) {
        // Validate username and password
        if usernameTextField.text == "username" && passwordTextField.text == "password" {
            loginSuccess = true
        } else {
            loginSuccess = false
        }
    }

}

//import XCTest
//@testable import ProjectPertama // Ganti dengan nama proyek Anda
//
//class CalculatorTests: XCTestCase {
//    var calculator: Calculator!
//
//    override func setUp() {
//        super.setUp()
//        calculator = Calculator()
//    }
//
//    override func tearDown() {
//        calculator = nil
//        super.tearDown()
//    }
//
//    // Contoh pendekatan Arrange-Act-Assert (AAA)
//    func testAddition() {
//        // Arrange
//        let a = 5
//        let b = 3
//
//        // Act
//        let result = calculator.add(a, b)
//
//        // Assert
//        XCTAssertEqual(result, 8)
//    }
//
//    // Contoh penggunaan Assertion yang sesuai
//    func testDivision() {
//        // Arrange
//        let a = 10
//        let b = 2
//
//        // Act
//        let result = calculator.divide(a, by: b)
//
//        // Assert
//        XCTAssertEqual(result, 5)
//    }
//
//    // Contoh penggunaan test case yang spesifik dan terpisah
//    func testDivisionByZero() {
//        // Arrange
//        let a = 10
//        let b = 0
//
//        // Act
//        let result = calculator.divide(a, by: b)
//
//        // Assert
//        XCTAssertNil(result)
//    }
//
//    // Contoh penggunaan data perbatasan (Boundary Cases)
//    func testDivisionByNegativeNumber() {
//        // Arrange
//        let a = 10
//        let b = -2
//
//        // Act
//        let result = calculator.divide(a, by: b)
//
//        // Assert
//        XCTAssertEqual(result, -5)
//    }
//}

