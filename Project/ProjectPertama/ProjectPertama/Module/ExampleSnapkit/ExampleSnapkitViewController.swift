//
//  ExampleSnapkitViewController.swift
//  ProjectPertama
//
//  Created by Macbook on 28/02/24.
//

import UIKit
import SnapKit

class ExampleSnapkitViewController: UIViewController, ConstraintRelatableTarget {

  let box: UIView = {
    let uiview = UIView()
    uiview.backgroundColor = .brown
    return uiview
  }()

  let label: UILabel = {
    let label = UILabel()
    label.backgroundColor = UIColor.gray
    label.text = "Hallo Semuanya";
    return label
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    view.addSubview(box)
    view.addSubview(label)

    box.snp.makeConstraints { (make) -> Void in
      make.top.equalTo(view).offset(20)
      make.left.equalTo(view).offset(20)
      make.right.equalTo(view).offset(-20)
      make.height.equalTo(200)
    }

    label.snp.makeConstraints { make in
      make.top.equalTo(box.snp.bottom).offset(20) // Menjadikan label di atas kotak dengan jarak 20pt
      make.left.equalTo(view).offset(20) // Menjadikan label sejajar dengan kotak dengan jarak 20pt dari kiri kotak
      make.right.equalTo(view).offset(-20)
    }
  }

  func setup() {

    // Mengatur konstrain bahwa posisi kiri view harus lebih besar dari atau sama dengan posisi kiri label
    box.snp.makeConstraints { make in
      make.left.greaterThanOrEqualTo(label)
    }

    // Mengatur konstrain bahwa posisi kiri view harus lebih besar dari atau sama dengan posisi kiri label menggunakan .snp.left
    box.snp.makeConstraints { make in
      make.left.greaterThanOrEqualTo(label.snp.left)
    }

    box.snp.makeConstraints {make in
      make.top.equalTo(42)
      make.height.equalTo(20)
      make.size.equalTo(CGSize(width: 50, height: 100))
      make.edges.equalTo(UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0))
      make.left.equalTo(view).offset(UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0) as! ConstraintOffsetTarget)
    }

  }

  func setupConvenience() {

    box.snp.makeConstraints {make in
      // Membuat konstrain semua tepi view sama dengan tepi view2
      make.edges.equalTo(view);
      // Membuat konstrain untuk semua tepi view menjadi sesuai dengan tepi superview dengan jarak inset tertentu
      make.edges.equalTo(view).inset(UIEdgeInsets(top: 5, left: 10, bottom: 15, right: 20))
    }

    box.snp.makeConstraints {make in
      // Membuat konstrain untuk lebar dan tinggi view lebih besar dari atau sama dengan lebar dan tinggi titleLabel
      make.size.greaterThanOrEqualTo(label)
      // Membuat konstrain untuk lebar dan tinggi view menjadi sama dengan lebar dan tinggi superview dengan penambahan offset tertentu
      make.size.equalTo(view).offset(100)
    }

    box.snp.makeConstraints {make in
      // Membuat konstrain pusat horizontal dan pusat vertikal view sama dengan pusat button1
      make.center.equalTo(label)
      // Membuat konstrain pusat horizontal view menjadi sama dengan pusat horizontal superview dengan penambahan offset tertentu, dan pusat vertikal view menjadi sama dengan pusat vertikal superview dengan penambahan offset tertentu
      make.center.equalTo(view).offset(5)
    }

  }

  func updateConstraint() {
    var topConstraint: Constraint? = nil

    // Ketika membuat konstrain
    box.snp.makeConstraints { make in
      topConstraint = make.top.equalTo(view).offset(10).constraint
      make.left.equalTo(view).offset(10)
    }

    // Kemudian di masa mendatang, Anda dapat memanggil
    topConstraint?.deactivate()

    // Atau jika Anda ingin mengupdate konstrain
    topConstraint?.update(offset: 5)


    self.box.snp.updateConstraints { make in
      // Mengatur pusat growingButton ke pusat tampilan induk
      make.center.equalTo(self)
      // Menetapkan lebar growingButton sesuai dengan buttonSize dengan prioritas 250
      make.width.equalTo(self.box.snp.height).priority(250)
      // Menetapkan tinggi growingButton sesuai dengan buttonSize dengan prioritas 250
      make.height.equalTo(self.box.snp.height).priority(250)
      // Membatasi lebar growingButton agar tidak lebih besar dari lebar tampilan induk
      make.width.lessThanOrEqualTo(self)
      // Membatasi tinggi growingButton agar tidak lebih besar dari tinggi tampilan induk
      make.height.lessThanOrEqualTo(self)
    }

    

//    self.box.snp.remakeConstraints { make in
//      make.size.equalTo(self.buttonSize)
//
//      if topLeft {
//        make.top.left.equalTo(10)
//
//      } else {
//        make.bottom.equalTo(self.view).offset(-10)
//        make.right.equalTo(self.view).offset(-10)
//      }
//    }

    box.snp.makeConstraints { make in
      make.top.equalTo(view).labeled("buttonViewTopConstraint")
    }

  }


}


//public protocol SkeletonTableViewDataSource: UITableViewDataSource {
//    func numSections(in collectionSkeletonView: UITableView) -> Int // Default: 1
//    func collectionSkeletonView(_ skeletonView: UITableView, numberOfRowsInSection section: Int) -> Int
//    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier
//    func collectionSkeletonView(_ skeletonView: UITableView, skeletonCellForRowAt indexPath: IndexPath) -> UITableViewCell? // Default: nil
//    func collectionSkeletonView(_ skeletonView: UITableView, prepareCellForSkeleton cell: UITableViewCell, at indexPath: IndexPath)
//}
//
//
//func collectionSkeletonView(_ skeletonView: UITableView, numberOfRowsInSection section: Int) -> Int
//// Default:
//// It calculates how many cells need to populate whole tableview
//
//func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
//   return "CellIdentifier"
//}
//
//func collectionSkeletonView(_ skeletonView: UITableView, skeletonCellForRowAt indexPath: IndexPath) -> UITableViewCell? {
//    let cell = skeletonView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath) as? Cell
//    cell?.textField.isHidden = indexPath.row == 0
//    return cell
//}
//
//func collectionSkeletonView(_ skeletonView: UITableView, prepareCellForSkeleton cell: UITableViewCell, at indexPath: IndexPath) {
//    let cell = cell as? Cell
//    cell?.textField.isHidden = indexPath.row == 0
//}
//
//public protocol SkeletonTableViewDelegate: UITableViewDelegate {
//    func collectionSkeletonView(_ skeletonView: UITableView, identifierForHeaderInSection section: Int) -> ReusableHeaderFooterIdentifier? // default: nil
//    func collectionSkeletonView(_ skeletonView: UITableView, identifierForFooterInSection section: Int) -> ReusableHeaderFooterIdentifier? // default: nil
//}
//
//self.contentView.addSubview(titleLabel) ✅
//self.addSubview(titleLabel) ❌
//
//public protocol SkeletonCollectionViewDataSource: UICollectionViewDataSource {
//    func numSections(in collectionSkeletonView: UICollectionView) -> Int  // default: 1
//    func collectionSkeletonView(_ skeletonView: UICollectionView, numberOfItemsInSection section: Int) -> Int
//    func collectionSkeletonView(_ skeletonView: UICollectionView, cellIdentifierForItemAt indexPath: IndexPath) -> ReusableCellIdentifier
//    func collectionSkeletonView(_ skeletonView: UICollectionView, supplementaryViewIdentifierOfKind: String, at indexPath: IndexPath) -> ReusableCellIdentifier? // default: nil
//    func collectionSkeletonView(_ skeletonView: UICollectionView, skeletonCellForItemAt indexPath: IndexPath) -> UICollectionViewCell?  // default: nil
//    func collectionSkeletonView(_ skeletonView: UICollectionView, prepareCellForSkeleton cell: UICollectionViewCell, at indexPath: IndexPath)
//    func collectionSkeletonView(_ skeletonView: UICollectionView, prepareViewForSkeleton view: UICollectionReusableView, at indexPath: IndexPath)
//}
