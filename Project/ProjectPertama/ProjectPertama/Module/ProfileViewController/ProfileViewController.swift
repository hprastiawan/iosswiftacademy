//
//  ProfileViewController.swift
//  ProjectPertama
//
//  Created by Macbook on 20/02/24.
//

import UIKit

class ProfileViewController: UIViewController {

  @IBOutlet weak var containerImageView: UIView!
  @IBOutlet weak var profileImageView: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var subNameLabel: UILabel!
  @IBOutlet weak var usernameTF: InputField!
  @IBOutlet weak var emailTF: InputField!
  @IBOutlet weak var phoneNumberTF: InputField!
  @IBOutlet weak var editProfileButton: UIButton!


  override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }


  func setupView() {
    containerImageView.backgroundColor = UIColor.blue
    containerImageView.layer.cornerRadius = containerImageView.bounds.height / 2  // Menetapkan corner radius
    containerImageView.layer.borderWidth = 14   // Menetapkan ketebalan border
    containerImageView.layer.borderColor = UIColor.white.cgColor  // Menetapkan warna border
    containerImageView.clipsToBounds = true

    usernameTF.setup(title: "Full name", placeholder: "masukan nama")
    emailTF.setup(title: "Email", placeholder: "masukan email")
    phoneNumberTF.setup(title: "Phone Number", placeholder: "masukan phone number")

    // Mengatur ruang tambahan di sekitar gambar
    let insetAmount: CGFloat = 20
    if #available(iOS 15.0, *) {
      editProfileButton.configuration!.contentInsets = NSDirectionalEdgeInsets(top: insetAmount, leading: insetAmount, bottom: insetAmount, trailing: insetAmount)
    } else {
      // Fallback on earlier versions
    }

  }

}
