//
//  DashboardGridViewController.swift
//  ProjectPertama
//
//  Created by Macbook on 19/02/24.
//

import UIKit

class DashboardGridViewController: UIViewController {

  @IBOutlet weak var collectionView: UICollectionView!


  let imageNames = ["image1", "image2", "image3", "image4", "image5"]




  override func viewDidLoad() {
    super.viewDidLoad()
    collectionView.delegate = self
    collectionView.dataSource = self

    // Register custom cell .xib file with the UICollectionView
    let nib = UINib(nibName: "ImageListCell", bundle: nil)
    collectionView.register(nib, forCellWithReuseIdentifier: "ImageListCell")

    collectionView.register(FoodListCell.self, forCellWithReuseIdentifier: FoodListCell.cellIdentifier)
    collectionView.register(RestaurantListCell.self, forCellWithReuseIdentifier: RestaurantListCell.cellIdentifier)

    collectionView.register(FilterHeaderView.self, forSupplementaryViewOfKind: "Header", withReuseIdentifier: FilterHeaderView.headerIdentifier)


    // Set layout for UICollectionView
    //    let layout = UICollectionViewFlowLayout()
    //    layout.itemSize = CGSize(width: 100, height: 100)
    //    layout.minimumInteritemSpacing = 10
    //    layout.minimumLineSpacing = 10
    //    layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    //    collectionView.collectionViewLayout = layout


    // Menerapkan layout pada UICollectionView
    //    collectionView.collectionViewLayout = self.setupLayout()
    configureCompositionalLayout()



  }


  func setupLayout() -> UICollectionViewLayout {

    // Menentukan ukuran item dalam bagian (section)
    let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
    let item = NSCollectionLayoutItem(layoutSize: itemSize)

    // Menentukan ukuran grup yang berisi item
    let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.7), heightDimension: .absolute(225))
    let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
    group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 15)


    // Membuat bagian (section) dengan grup yang telah dibuat
    let section = NSCollectionLayoutSection(group: group)
    section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)

    // Menentukan perilaku gulir ortogonal (orthogonal scrolling behavior)
    section.orthogonalScrollingBehavior = .groupPagingCentered

    // Menambahkan handler untuk invalidasi item yang terlihat
    section.visibleItemsInvalidationHandler = { (items, offset, environment) in
      // Melakukan transformasi pada setiap item berdasarkan offset dan lingkungan tampilan
      items.forEach { item in
        let distanceFromCenter = abs((item.frame.midX - offset.x) - environment.container.contentSize.width / 2.0)
        let minScale: CGFloat = 0.8
        let maxScale: CGFloat = 1.0
        let scale = max(maxScale - (distanceFromCenter / environment.container.contentSize.width), minScale)
        item.transform = CGAffineTransform(scaleX: scale, y: scale)
      }
    }


    // Membuat compositional layout dengan section yang telah dibuat
    let layout = UICollectionViewCompositionalLayout(section: section)
    return layout

  }

  func configureCompositionalLayout(){
    let layout = UICollectionViewCompositionalLayout {sectionIndex,enviroment in
      switch sectionIndex {
      case 0 :
        return AppLayouts.shared.foodBannerSection()
      case 1:
        return AppLayouts.shared.foodCategoryStackSection()
      case 2:
        return AppLayouts.shared.restaurantsListSection()
      default:
        return AppLayouts.shared.foodCategorySection()
      }
    }

    collectionView.setCollectionViewLayout(layout, animated: true)
  }
  
}

extension DashboardGridViewController:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    switch indexPath.section {

    case 0 :
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageListCell", for: indexPath) as! ImageListCell
      cell.configView(item: imageNames[indexPath.item])
      return cell

    case 1 :
      guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FoodListCell", for: indexPath) as? FoodListCell else {fatalError("Unable deque cell...")}
      cell.cellData = foodCategoryMockData[indexPath.row]
      return cell
    case 2 :
      guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RestaurantListCell", for: indexPath) as? RestaurantListCell else {fatalError("Unable deque cell...")}
      cell.cellData = restaurantListMockData[indexPath.row]
      return cell
    default:
      return UICollectionViewCell()
    }

  }


  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 3
  }

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    switch section {
    case 0 :
      return imageNames.count
    case 1 :
      return foodCategoryMockData.count
    case 2:
      return restaurantListMockData.count
    default:
      return 0
    }
  }



  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    // Mendapatkan lebar layar perangkat
    let screenWidth = UIScreen.main.bounds.width

    // Menghitung lebar setiap item (item) dengan membagi lebar layar menjadi 3
    let itemWidth = (screenWidth / 4.0 ) - 20

    // Mengembalikan ukuran setiap item (item) dengan tinggi tetap (contoh: 100)
    return CGSize(width: itemWidth, height: 100)
  }

//  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//    if kind == "Header" {
//
//      switch indexPath.section {
//      case 2 :
//        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: FilterHeaderView.headerIdentifier, for: indexPath) as! FilterHeaderView
////        header.delegate = self
//        return header
//      default :
//
//        return UICollectionReusableView()
//      }
//    }
//    return UICollectionReusableView()
//
//  }

}
