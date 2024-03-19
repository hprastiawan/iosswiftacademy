//
//  InputFieldSnapKit.swift
//  ProjectPertama
//
//  Created by Macbook on 15/03/24.
//


import UIKit
import SnapKit
import SwiftUI
import CoreGraphics
import RxSwift

//@available(iOS 13.0, *)
//struct ViewController_Previews: PreviewProvider {
//    static var previews: some View {
//      previewView(InputFieldView()).previewLayout(.sizeThatFits)
//    }
//}


class InputFieldView: UIView {

  // Elements
  private let titleLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 16)
    label.textColor = .black
    return label
  }()

  private let textField: UITextField = {
    let textField = UITextField()
    textField.borderStyle = .roundedRect
    textField.placeholder = "Enter text"
    return textField
  }()

  let passwordLabel: UILabel = {
    let label = UILabel()
    label.text = "Password"
    label.font = UIFont.systemFont(ofSize: 17)
    label.textColor = .label
    return label
  }()

  let passwordErrLabel: UILabel = {
    let label = UILabel()
    label.text = "errorLabel"
    label.font = UIFont.systemFont(ofSize: 12)
    label.textColor = UIColor(red: 0.702, green: 0.049, blue: 0.132, alpha: 1)
    return label
  }()

  let passwordView: UIView = {
    let view = UIView()
    view.backgroundColor = .systemBackground
    return view
  }()

  let passwordTF: UITextField = {
    let textField = UITextField()
    textField.placeholder = "password"
    textField.textAlignment = .natural
    textField.minimumFontSize = 17
    textField.font = UIFont.systemFont(ofSize: 14)
    textField.borderStyle = .none
    return textField
  }()

  // Initializer
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupUI()
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setupUI()
  }

  override var intrinsicContentSize: CGSize {
    return .init(width: 350, height: 60)
  }

  // Setup UI
  private func setupUI() {
    addSubview(passwordLabel)
    addSubview(passwordView)
    addSubview(passwordErrLabel)

    passwordLabel.snp.makeConstraints { make in
      make.leading.equalToSuperview()
      make.top.equalToSuperview().offset(0)
    }

    passwordView.snp.makeConstraints { make in
      make.leading.equalToSuperview()
      make.trailing.equalToSuperview()
      make.top.equalTo(passwordLabel.snp.bottom).offset(8)
      make.height.equalTo(60)
    }

    passwordView.addSubview(passwordTF)

    passwordTF.snp.makeConstraints { make in
      make.leading.equalToSuperview().offset(15)
      make.trailing.equalToSuperview().offset(-15)
      make.centerY.equalToSuperview() // Center vertically inside passwordView
      make.height.equalTo(30)
    }

    passwordErrLabel.snp.makeConstraints { make in
      make.leading.equalToSuperview().offset(10)
      make.top.equalTo(passwordView.snp.bottom).offset(8)
    }

    passwordView.setGradient()
    passwordErrLabel.isHidden = false

  }

  // Public method to set title text
  func setTitle(_ title: String, _ placeholder: String) {
    passwordLabel.text = title
    passwordTF.placeholder = placeholder
  }

  // Public method to get text from text field
  func getText() -> String? {
    return passwordTF.text
  }
}

extension UIView {
  func setGradient() {
    self.layer.cornerRadius = 20
    self.layer.shadowColor = UIColor.black.cgColor
    self.layer.shadowOffset = CGSize(width: 0, height: 2) // Arah bayangan (x, y)
    self.layer.shadowOpacity = 0.5 // Opasitas bayangan
    self.layer.shadowRadius = 4 // Radius bayangan
    self.layer.masksToBounds = false // Menonaktifkan pemotongan bayangan

    self.layer.borderWidth = 1
    self.layer.borderColor = UIColor.clear.cgColor
  }
}
