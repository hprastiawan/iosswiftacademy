//
//  SuggestionMenuCell.swift
//  TestAplikasi
//
//  Created by Macbook on 14/03/24.
//

import UIKit


protocol SuggestionMenuCellDelegate {
  func didTapMenu(data: Person)
  func didtaplabel()
}


class SuggestionMenuCell: UITableViewCell {


  @IBOutlet weak var containerView: UIView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var collectionView: UICollectionView!
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var heightTableView: NSLayoutConstraint!


  let data: [Person] = [
    Person(image: "pencil", title: "Home"),
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

  override func layoutSubviews() {
    super.layoutSubviews()
//    updateTableViewHeight()
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }

  func setup() {
    selectionStyle = .none
    collectionView.dataSource =  self
    collectionView.delegate = self
    collectionView.registerCellWithNib(MenuCollectionCell.self)
    tableView.registerCellWithNib(FoodCell.self)
    tableView.delegate = self
    tableView.dataSource =  self
  }

}

extension SuggestionMenuCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

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

extension SuggestionMenuCell: UITableViewDataSource, UITableViewDelegate {

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 3
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as FoodCell
    cell.setup(data: FoodItem(title: "title", duration: "60GB", price: "Rp 15000"))
    return cell
  }

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return UITableView.automaticDimension
  }



  private func updateTableViewHeight() {
      heightTableView.constant = tableView.contentSize.height
  }

}
