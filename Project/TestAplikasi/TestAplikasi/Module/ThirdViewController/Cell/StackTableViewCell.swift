//
//  StackTableViewCell.swift
//  TestAplikasi
//
//  Created by Macbook on 15/11/23.
//

import UIKit

protocol StackTableViewCellDelegate: AnyObject {
    func updateCellHeight(indexPath: IndexPath)
}

class StackTableViewCell: UITableViewCell {


    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!

    @IBOutlet weak var showViewButton: UIButton!
    @IBOutlet weak var viewBottom: UIView!

    weak var tableView: UITableView?
    weak var delegate: StackTableViewCellDelegate?




    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        showViewButton.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
    }

    @objc func tapButton() {
        viewBottom.isHidden.toggle()

        // Notify the table view that updates are about to begin
        if let tableView = self.superview as? UITableView {
            tableView.beginUpdates()
            tableView.endUpdates()
        }

//        if let indexPath = tableView?.indexPath(for: self) {
//           print("Button tapped in cell at section \(indexPath.section), row \(indexPath.row)")
//           // Do something with the indexPath
//            delegate?.updateCellHeight(indexPath: indexPath)
//        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
