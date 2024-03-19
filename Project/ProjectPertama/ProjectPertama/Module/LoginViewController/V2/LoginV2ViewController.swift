//
//  LoginV2ViewController.swift
//  ProjectPertama
//
//  Created by Macbook on 15/03/24.
//

import UIKit
import SnapKit
import SwiftUI

//@available(iOS 13.0, *)
//struct ViewController_Previews: PreviewProvider {
//    static var previews: some View {
//        previewViewController(LoginV2ViewController())
//    }
//}

class LoginV2ViewController: UIViewController {

  let containerView: UIView = {
    let view = UIView()
    return view
  }()

  let loginButton: UIButton = {
    let button = UIButton(type: .system)
    button.backgroundColor = .brown
    button.setTitle("Login", for: .normal)
    button.titleLabel?.font = UIFont(name: "Impact", size: 30)
    button.setTitleColor(.white, for: .normal)
    button.layer.cornerRadius = 30
    return button
  }()

  let loginPageLabel: UILabel = {
    let label = UILabel()
    label.text = "Login Screen"
    label.font = UIFont.systemFont(ofSize: 24)
    label.textColor = .black
    return label
  }()

  let inputNameField = InputFieldView()
  let inputPasswordField = InputFieldView()

  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }

  func setupView() {
    view.backgroundColor = .red
    view.addSubview(containerView)
    containerView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }

    containerView.addSubview(loginPageLabel)
    containerView.addSubview(loginButton)
    containerView.addSubview(inputNameField)
    containerView.addSubview(inputPasswordField)


    loginPageLabel.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.top.equalToSuperview().offset(85)
    }

    inputNameField.snp.makeConstraints { make in
      make.leading.equalToSuperview().offset(20)
      make.trailing.equalToSuperview().offset(-20)
      make.top.equalTo(loginPageLabel.snp.bottom).offset(40)
      make.height.equalTo(80)
    }

    inputPasswordField.snp.makeConstraints { make in
      make.leading.equalToSuperview().offset(20)
      make.trailing.equalToSuperview().offset(-20)
      make.top.equalTo(inputNameField.snp.bottom).offset(20)
      make.height.equalTo(80)
    }

    loginButton.snp.makeConstraints { make in
      make.leading.equalToSuperview().offset(20)
      make.trailing.equalToSuperview().offset(-20)
      make.top.equalTo(inputPasswordField.snp.bottom).offset(30)
      make.height.equalTo(60)
    }

    // Set title for the input field
    inputNameField.setTitle("Name:", "username/email")
    inputPasswordField.setTitle("Password:", "password")

  }


}
