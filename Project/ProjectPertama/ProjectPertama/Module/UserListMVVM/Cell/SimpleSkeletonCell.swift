//
//  SimpleSkeletonCell.swift
//  ProjectPertama
//
//  Created by Macbook on 03/05/24.
//

import UIKit

class SimpleSkeletonCell: UITableViewCell {

  @IBOutlet weak var containerView: UIView!
  @IBOutlet var viewSkeloton: [UIView]!

  override func awakeFromNib() {
    super.awakeFromNib()
    viewSkeloton.forEach { x in
      x.isSkeletonable = true
      x.layer.cornerRadius = 10
    }
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }

}
