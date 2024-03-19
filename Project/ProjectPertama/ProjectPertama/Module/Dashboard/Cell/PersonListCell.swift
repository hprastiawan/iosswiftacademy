//
//  PersonListCell.swift
//  ProjectPertama
//
//  Created by Macbook on 19/02/24.
//

import UIKit

class PersonListCell: UITableViewCell {


  @IBOutlet weak var personImageView: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var descLabel: UILabel!
  @IBOutlet weak var personView: UIView!

  override func awakeFromNib() {
    super.awakeFromNib()
    setupView()
  }

  func setupView() {
    personView.layer.cornerRadius = 20
    // Sesuaikan dengan radius yang Anda inginkan

    // Mengatur bayangan (shadow)
    personView.layer.shadowColor = UIColor.black.cgColor
    personView.layer.shadowOffset = CGSize(width: 0, height: 2) // Arah bayangan (x, y)
    personView.layer.shadowOpacity = 0.5 // Opasitas bayangan
    personView.layer.shadowRadius = 4 // Radius bayangan
    personView.layer.masksToBounds = false // Menonaktifkan pemotongan bayangan

    // Atur juga beberapa properti untuk memberi kesan 3D yang lebih baik
    personView.layer.borderWidth = 1
    personView.layer.borderColor = UIColor.clear.cgColor


    personImageView.layer.cornerRadius = 20
    personImageView.layer.masksToBounds = false
    personImageView.clipsToBounds = true
    personImageView.layer.shadowColor = UIColor.black.cgColor
    personImageView.layer.shadowOpacity = 0.5
    personImageView.layer.shadowOffset = CGSize(width: 0, height: 2)

  }

  func configView(item: DataStruct2?) {
    guard let data = item else { return}
    titleLabel.text = "nama: \(data.name)"
    descLabel.text = "usia: \(data.age)"
    personImageView.image = UIImage(named: data.personImage)

  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }



}
