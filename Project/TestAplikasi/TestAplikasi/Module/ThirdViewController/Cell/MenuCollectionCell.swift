//
//  MenuCollectionCell.swift
//  TestAplikasi
//
//  Created by Macbook on 30/10/23.
//

import UIKit

class MenuCollectionCell: UICollectionViewCell {

  @IBOutlet weak var formView: FormView!
  @IBOutlet weak var homeLabel: UILabel!

    override var isSelected: Bool {
           didSet {
             formView.backgroundColor = isSelected ? .pokemonMaroon1 : .white
             homeLabel.textColor = isSelected ? .white : .black
           }
       }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setup(title: String) {
        homeLabel.text = title
    }

}
