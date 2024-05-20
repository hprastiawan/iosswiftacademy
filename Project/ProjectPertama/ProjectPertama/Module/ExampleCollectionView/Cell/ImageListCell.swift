//
//  ImageListCell.swift
//  ProjectPertama
//
//  Created by Macbook on 19/02/24.
//

import UIKit


class ImageListCell: UICollectionViewCell {

  @IBOutlet weak var itemImageView: UIImageView!

  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

  func configView(item: String) {

    itemImageView.image = UIImage(named: item)
  }

}
