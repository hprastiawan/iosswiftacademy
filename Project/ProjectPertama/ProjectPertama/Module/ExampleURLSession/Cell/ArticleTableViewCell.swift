//
//  ArticleTableViewCell.swift
//  ProjectPertama
//
//  Created by Macbook on 21/02/24.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {

  @IBOutlet weak var containerView: UIView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var idLabel: UILabel!
  @IBOutlet weak var subLabel: UILabel!

  override func awakeFromNib() {
    super.awakeFromNib()
    containerView.layer.cornerRadius = 20 // Sesuaikan dengan radius yang Anda inginkan

    // Mengatur bayangan (shadow)
    containerView.layer.shadowColor = UIColor.black.cgColor
    containerView.layer.shadowOffset = CGSize(width: 0, height: 2) // Arah bayangan (x, y)
    containerView.layer.shadowOpacity = 0.5 // Opasitas bayangan
    containerView.layer.shadowRadius = 4 // Radius bayangan
    containerView.layer.masksToBounds = false // Menonaktifkan pemotongan bayangan

    // Atur juga beberapa properti untuk memberi kesan 3D yang lebih baik
    containerView.layer.borderWidth = 1
    containerView.layer.borderColor = UIColor.clear.cgColor
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)

    // Configure the view for the selected state
  }

  func configView(data: PlaceHolderElement?) {
    guard let item = data else { return}
    titleLabel.text = item.title
    idLabel.text = String(item.id)
    subLabel.text = item.body
  }
}
