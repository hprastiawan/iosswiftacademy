//
//  ContohTableViewCell.swift
//  TestAplikasi
//
//  Created by Macbook on 26/10/23.
//

import UIKit

class ContohTableViewCell: BaseTableViewCell {

    @IBOutlet weak var containerView: UIView!

    @IBOutlet weak var viewArrowTop: UIView!
    @IBOutlet weak var viewArrowBottom: UIView!


    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func setup() {
        containerView.makeCornerRadius(20, maskedCorner: [.layerMaxXMaxYCorner, .layerMaxXMinYCorner])
//        containerView.addShadow()
    }
    
}

class BaseTableViewCell: UITableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
