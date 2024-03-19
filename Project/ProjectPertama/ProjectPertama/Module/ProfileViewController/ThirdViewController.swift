//
//  ThirdViewController.swift
//  ProjectPertama
//
//  Created by Macbook on 16/02/24.
//

import UIKit

class ThirdViewController: UIViewController {


  @IBOutlet weak var profileImage: UIImageView!

  let pickerImage = UIImagePickerController()
  var imageChosen = [UIImagePickerController.InfoKey: Any]()


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


  @IBAction func tapCamera(_ sender: Any) {
    self.pickerImage.allowsEditing = true
    self.pickerImage.delegate = self
    self.pickerImage.sourceType = .camera
    self.present(self.pickerImage, animated: true, completion: nil)
  }


  @IBAction func tapGallery(_ sender: Any) {
    self.pickerImage.allowsEditing = true
    self.pickerImage.delegate = self
    self.pickerImage.sourceType = .photoLibrary
    self.present(self.pickerImage, animated: true, completion: nil)
  }


  @IBAction func tapSnackBar(_ sender: Any) {
    self.showToast(message: "ini adalah toast")
  }


  func showToast(message: String, duration: TimeInterval = 5.0) {
          let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
          self.present(alert, animated: true)

          DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + duration) {
              alert.dismiss(animated: true)
          }
      }

}

extension ThirdViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
    guard let image = info[.editedImage] as? UIImage else { return }
    self.imageChosen = info
    self.profileImage.image = image
    self.dismiss(animated: true)
  }

  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    picker.dismiss(animated: true)
  }
}

