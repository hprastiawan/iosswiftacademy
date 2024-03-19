//
//  ListItemCell.swift
//  ProjectPertama
//
//  Created by Macbook on 19/02/24.
//

import UIKit

class ListItemCell: UITableViewCell {

  @IBOutlet weak var itemLabel: UILabel!
  @IBOutlet weak var labelView: UIView!
  @IBOutlet weak var subItemLabel: UILabel!

  override func awakeFromNib() {
    super.awakeFromNib()
    setupView()
  }

  func setupView() {
    labelView.layer.cornerRadius = 20 // Sesuaikan dengan radius yang Anda inginkan

    // Mengatur bayangan (shadow)
    labelView.layer.shadowColor = UIColor.black.cgColor
    labelView.layer.shadowOffset = CGSize(width: 0, height: 2) // Arah bayangan (x, y)
    labelView.layer.shadowOpacity = 0.5 // Opasitas bayangan
    labelView.layer.shadowRadius = 4 // Radius bayangan
    labelView.layer.masksToBounds = false // Menonaktifkan pemotongan bayangan

    // Atur juga beberapa properti untuk memberi kesan 3D yang lebih baik
    labelView.layer.borderWidth = 1
    labelView.layer.borderColor = UIColor.clear.cgColor

  }


  func configView(data: DataStruct1?) {
    guard let data = data else { return }
    itemLabel.text = data.title
    subItemLabel.text = data.subtitle
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)

    // Configure the view for the selected state
  }

}
