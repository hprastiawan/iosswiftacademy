//
//  FoodCollectionCell.swift
//  TestAplikasi
//
//  Created by Macbook on 27/10/23.
//

import UIKit

class FoodCollectionCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.makeCornerRadius(20)
    }

    func setup(image: String, title: String) {
        imgView.image = UIImage(systemName: image)
        titleLbl.text = title
    }

}
