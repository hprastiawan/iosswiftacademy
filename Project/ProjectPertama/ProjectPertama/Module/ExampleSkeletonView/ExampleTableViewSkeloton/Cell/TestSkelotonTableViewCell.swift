//
//  TestSkelotonTableViewCell.swift
//  ProjectPertama
//
//  Created by Macbook on 04/05/24.
//

import UIKit

class TestSkelotonTableViewCell: UITableViewCell {

  @IBOutlet weak var containerView: UIView!


  override func awakeFromNib() {
    super.awakeFromNib()
    containerView.backgroundColor = .systemBackground
    containerView.layer.cornerRadius = 5
    containerView.layer.borderWidth = 0.6
    containerView.layer.borderColor = UIColor.gray.withAlphaComponent(0.3).cgColor
    containerView.layer.shadowColor = UIColor.gray.withAlphaComponent(0.3).cgColor
    containerView.layer.shadowOffset = CGSize(width: 0, height: 4)
    containerView.layer.shadowOpacity = 1
    containerView.layer.shadowRadius = 5
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)

    // Configure the view for the selected state
  }

}
