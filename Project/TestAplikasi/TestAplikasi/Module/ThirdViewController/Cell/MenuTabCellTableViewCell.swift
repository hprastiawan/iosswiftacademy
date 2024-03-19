//
//  MenuTabCellTableViewCell.swift
//  TestAplikasi
//
//  Created by Macbook on 30/10/23.
//

import UIKit

protocol MenuTabCellTableViewCellDelegate {
    func didTapMenu(data: Person)
    func didtaplabel()
}


class MenuTabCellTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!

    let data: [Person] = [Person(image: "pencil", title: "Home"),
                          Person(image: "eraser.fill", title: "Favorite Banget"),
                          Person(image: "eraser", title: "Pln"),
                          Person(image: "scribble", title: "PPOB"),
                          Person(image: "eraser.fill", title: "Favorite"),
                          Person(image: "eraser", title: "Pln"),
                          Person(image: "scribble", title: "PPOB")]

    var delegate: MenuTabCellTableViewCellDelegate?
    var didTapCell: ((_ data: Person) -> Void)?


    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func setup() {
        selectionStyle = .none
        collectionView.dataSource =  self
        collectionView.delegate = self
        collectionView.registerCellWithNib(MenuCollectionCell.self)
    }
    
}

extension MenuTabCellTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let data = data[indexPath.row]
        let cell = collectionView.dequeueReusableCell(forIndexPath: indexPath) as MenuCollectionCell
        cell.setup(title: data.title)
        return cell
    }


    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let indexSelected = indexPath.row
        self.delegate?.didTapMenu(data: data[indexSelected])
//        self.didTapCell?(data[indexSelected])
    }

    // Implement this method to dynamically calculate the size of each cell
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         // Assuming you have a UILabel in your cell
         let label = UILabel()
         label.text = data[indexPath.row].title
         label.sizeToFit()

         // Add some extra spacing if needed
         let extraSpacing: CGFloat = 60 // You can adjust this value as needed

         // Return the calculated size
         return CGSize(width: label.frame.width + extraSpacing, height: 50)
     }

//    // UICollectionViewFlowLayout delegate method to set the size of items
//     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//         // Calculate the item width based on the collection view's width divided by 3
//         return CGSize(width: collectionView.frame.width/3, height: 50) // Adjust the height as needed
//     }

    // UICollectionViewFlowLayout delegate method to set the section insets
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 0) // Adjust as needed
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        self.collectionView.scrollToNearestVisibleCollectionViewCell()
    }

    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if !decelerate {
            self.collectionView.scrollToNearestVisibleCollectionViewCell()
        }
    }


}
