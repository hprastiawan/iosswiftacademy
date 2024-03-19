//
//  ExampleAutoLayoutViewController.swift
//  ProjectPertama
//
//  Created by Macbook on 28/02/24.
//

import UIKit

class ExampleAutoLayoutViewController: UIViewController {

  // Definisikan tampilan yang akan digunakan
  let usernameTextField: UITextField = {
    let textField = UITextField()
    textField.placeholder = "Username"
    textField.borderStyle = .roundedRect
    return textField
  }()

  let passwordTextField: UITextField = {
    let textField = UITextField()
    textField.placeholder = "Password"
    textField.isSecureTextEntry = true
    textField.borderStyle = .roundedRect
    return textField
  }()

  let loginButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("Login", for: .normal)
    button.addTarget(ExampleAutoLayoutViewController.self, action: #selector(loginButtonTapped), for: .touchUpInside)
    return button
  }()

  override func viewDidLoad() {
    super.viewDidLoad()

    // Set background color
    view.backgroundColor = .white

    // Tambahkan tampilan ke dalam tampilan utama
    view.addSubview(usernameTextField)
    view.addSubview(passwordTextField)
    view.addSubview(loginButton)

    // Atur tata letak tampilan
    setupLayout()
  }

  // Fungsi untuk menangani tombol login yang ditekan
  @objc func loginButtonTapped() {
    // Implementasi login akan ditambahkan di sini
    print("Login button tapped")
  }

  // Fungsi untuk mengatur tata letak tampilan
  func setupLayout() {
    usernameTextField.translatesAutoresizingMaskIntoConstraints = false
    passwordTextField.translatesAutoresizingMaskIntoConstraints = false
    loginButton.translatesAutoresizingMaskIntoConstraints = false

    NSLayoutConstraint.activate([
      // Atur konstrain untuk textField username
      usernameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
      usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
      usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),

      // Atur konstrain untuk textField password
      passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 20),
      passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
      passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),

      // Atur konstrain untuk tombol login
      loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 40),
      loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
      loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
      loginButton.heightAnchor.constraint(equalToConstant: 50)
    ])
  }
}


// Inisialisasi tampilan
//let redView = UIView()
//redView.backgroundColor = .red
//redView.translatesAutoresizingMaskIntoConstraints = false
//view.addSubview(redView)
//
//// Atur konstrain
//NSLayoutConstraint.activate([
//    // Konstrain untuk lebar dan tinggi tampilan
//    redView.widthAnchor.constraint(equalToConstant: 100),
//    redView.heightAnchor.constraint(equalToConstant: 100),
//    // Konstrain untuk posisi tampilan
//    redView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//    redView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
//])
//
//// Atur konstrain
//NSLayoutConstraint.activate([
//  // Mengatur konstrain atas
//  redView.topAnchor.constraint(equalTo: superview.topAnchor, constant: 20).isActive = true
//  // Mengatur konstrain bawah
//  redView.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -20).isActive = true
//])
//
//// Atur konstrain
//NSLayoutConstraint.activate([
//  // Mengatur konstrain kiri
//  redView.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: 20).isActive = true
//  // Mengatur konstrain kanan
//  redView.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -20).isActive = true
//])
//
//// Atur konstrain
//NSLayoutConstraint.activate([
//  // Mengatur konstrain lebar
//  redView.widthAnchor.constraint(equalToConstant: 100).isActive = true
//  // Mengatur konstrain tinggi
//  redView.heightAnchor.constraint(equalToConstant: 100).isActive = true
//  // Mengatur konstrain pusat horizontal
//  redView.centerXAnchor.constraint(equalTo: superview.centerXAnchor).isActive = true
//  // Mengatur konstrain pusat vertikal
//  redView.centerYAnchor.constraint(equalTo: superview.centerYAnchor).isActive = true
//
//  // Mengatur konstrain untuk perataan atas tampilan dengan tampilan lain
//  redView.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20).isActive = true
//
//  // Mengatur konstrain rasio aspek (lebar = tinggi * 2)
//  redView.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 2).isActive = true
//  
//  // Mengatur priority leading konstrain menjadi defaultHigh
//  redView.leadingAnchor.constraint(equalTo: superview.leadingAnchor).priority = .defaultHigh
//
//
//])










