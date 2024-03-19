//
//  FoodCell.swift
//  TestAplikasi
//
//  Created by Macbook on 14/03/24.
//

import UIKit


struct FoodItem {
  var title: String
  var duration: String
  var price: String
}

class FoodCell: UITableViewCell {

  @IBOutlet weak var titleLable: UILabel!
  @IBOutlet weak var durationLabel: UILabel!
  @IBOutlet weak var priceLabel: UILabel!


  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

  func setup(data: FoodItem ) {
    titleLable.text = data.title
    durationLabel.text = data.duration
    priceLabel.text =  data.price
  }

}
