//
//  LoginViewController.swift
//  ProjectPertama
//
//  Created by Macbook on 19/02/24.
//

import UIKit
import RxSwift

class LoginViewController: UIViewController {

  @IBOutlet weak var usernameView: UIView!
  @IBOutlet weak var passwordView: UIView!
  @IBOutlet weak var passwordTF: UITextField!
  @IBOutlet weak var usernameTF: UITextField!
  @IBOutlet weak var loginButton: UIButton!
  @IBOutlet weak var passwordErrLabel: UILabel!

  let disposeBag = DisposeBag()

  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
    bindTextfield()
  }


  func setupView() {

    [passwordView, usernameView].forEach { myView in
      myView.layer.cornerRadius = 20 // Sesuaikan dengan radius yang Anda inginkan

      // Mengatur bayangan (shadow)
      myView.layer.shadowColor = UIColor.black.cgColor
      myView.layer.shadowOffset = CGSize(width: 0, height: 2) // Arah bayangan (x, y)
      myView.layer.shadowOpacity = 0.5 // Opasitas bayangan
      myView.layer.shadowRadius = 4 // Radius bayangan
      myView.layer.masksToBounds = false // Menonaktifkan pemotongan bayangan

      // Atur juga beberapa properti untuk memberi kesan 3D yang lebih baik
      myView.layer.borderWidth = 1
      myView.layer.borderColor = UIColor.clear.cgColor

      passwordErrLabel.isHidden = true

    }

    passwordTF.delegate = self
    usernameTF.delegate = self
    loginButton.addTarget(self, action: #selector(tapLogin), for: .touchUpInside)

  }
  


  @objc func tapLogin() {

    exampleNavigation()


//    guard let username = usernameTF.text, !username.isEmpty else {
//      showAlert(message: "Username is required")
//      return
//    }
//
//    guard let password = passwordTF.text, !password.isEmpty else {
//      showAlert(message: "Password is required")
//      return
//    }
//
//    let param = LoginParam(email: username, password: password)
//
//    NetworkManager.shared.fetchProductRequest(endpoint: .login(param: param), expecting: LoginResultModel.self) { result in
//      switch result {
//      case .success(let data):
//        // Penanganan hasil jika permintaan berhasil
//        print("Success: \(data)")
//        let vc = MainTabBarController()
//        vc.hidesBottomBarWhenPushed = true
//        self.navigationController?.pushViewController(vc, animated: false)
//      case .failure(let error):
//        // Penanganan kesalahan jika permintaan gagal
//        print("Error: \(error)")
//        self.showAlert(message: error.localizedDescription)
//      }
//    }
  }

  func exampleNavigation() {
    let vc = ExampleCyptoKitViewController()
    vc.hidesBottomBarWhenPushed = true
    self.navigationController?.pushViewController(vc, animated: false)
  }

  func showAlert(message: String) {
    let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
    let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
    alertController.addAction(okAction)
    present(alertController, animated: true, completion: nil)
  }

  func bindTextfield() {
    usernameTF.rx.text.orEmpty.subscribe(onNext: { text in
      // Lakukan validasi email di sini
      if text.isValidEmail() {
          print("Email valid: \(text)")
      } else {
          print("Email tidak valid: \(text)")
      }
    }).disposed(by: disposeBag)
  }
}

extension LoginViewController: UITextFieldDelegate {

  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }

  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    // Memeriksa apakah TextField yang sedang diubah adalah passwordTextField
    if textField == passwordTF {
      // Menggabungkan teks yang ada dengan teks yang baru
      let currentText = (textField.text ?? "") as NSString
      let newText = currentText.replacingCharacters(in: range, with: string)
      // Menampilkan pesan error jika panjang password kurang dari 6 karakter
      passwordErrLabel.isHidden = newText.count >= 6
      passwordErrLabel.text = "Password must be at least 6 characters"
    }
    return true
  }

}
