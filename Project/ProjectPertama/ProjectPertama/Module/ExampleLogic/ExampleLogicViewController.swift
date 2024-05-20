//
//  ExampleLogicViewController.swift
//  ProjectPertama
//
//  Created by Macbook on 26/04/24.
//

import UIKit
import SnapKit
import SwiftUI

//@available(iOS 13.0, *)
//struct ViewController_Previews: PreviewProvider {
//  static var previews: some View {
//    previewViewController(ExampleLogicViewController())
//  }
//}

extension UIView {
  func add(_ view: [UIView]) {
    for x in view {
      self.addSubview(x)
    }
  }
}

class CustomViewLabel: UIView {

  // Deklarasi subviews
  let label: UILabel = {
    let label = UILabel()
    label.textColor = .black
    label.textAlignment = .center
    label.text = "bowo"
    return label
  }()

  // Inisialisasi view, setup subviews, dan constraints
  override init(frame: CGRect) {
    super.init(frame: frame)

    // Tambahkan subview ke dalam view utama
    addSubview(label)

    // Setup constraints menggunakan SnapKit
    label.snp.makeConstraints { make in
      make.centerX.centerY.equalToSuperview()
    }
  }

  // Dipanggil jika view diinisialisasi dari Interface Builder (Storyboard, xib, dll.)
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // Fungsi untuk mengatur teks label
  func setText(_ text: String) {
    label.text = text
    label.font = UIFont.ftBold(50)
  }
}

class ExampleLogicViewController: UIViewController {

  let continueButton: UIButton = {
    let bt = UIButton()
    bt.backgroundColor = .red
    bt.layer.cornerRadius = 25
    bt.setTitle("Press me", for: .normal)
    bt.titleLabel?.font = UIFont.ftItalic(30)

    return bt

  }()

  let titleLabel: UILabel = {
    let tk = UILabel()
    tk.textColor = .blue
    tk.text = "test"
    tk.font = UIFont.ftExtraBold(50)
    return tk
  }()

  let customView: CustomViewLabel  = CustomViewLabel()


  override func viewDidLoad() {
    super.viewDidLoad()
    view.add([continueButton, titleLabel, customView])
    setupConstraint()
    continueButton.addTarget(self, action: #selector(buttonTap), for: .touchUpInside)
    // Do any additional setup after loading the view.
  }

  @objc
  func buttonTap() {
    print("hello world")
    customView.setText("hello kholis")


    customView.snp.remakeConstraints { make in
      make.top.equalTo(continueButton.snp.bottom).offset(20)
      make.leading.equalToSuperview()
      make.trailing.equalToSuperview().offset(-20)
      make.width.height.equalTo(100)
    }

  }

  func setupConstraint() {
    titleLabel.snp.makeConstraints { make in
      make.top.equalToSuperview().offset(20)
      make.horizontalEdges.equalToSuperview().offset(10)
    }

    continueButton.snp.makeConstraints { make in
      make.top.equalTo(titleLabel.snp.bottom).offset(20)
      make.leading.equalToSuperview().offset(20)
      make.trailing.equalToSuperview().offset(-20)
      make.height.equalTo(60)
    }

    // Setup constraints untuk customView menggunakan SnapKit
    customView.snp.makeConstraints { make in
      make.top.equalTo(continueButton.snp.bottom).offset(20)
      make.leading.equalToSuperview().offset(20)
      make.trailing.equalToSuperview().offset(-20)
      make.width.height.equalTo(200)
    }

  }




}
