//
//  ThirdViewController.swift
//  TestAplikasi
//
//  Created by Macbook on 26/10/23.
//

import UIKit
import Alamofire
import MyLibrary
//import WWDC

enum ThirdViewControllerTypeCell: Int, CaseIterable {
  case menu
  case food
  case track
  case suggestion

  var cellTypes: UITableViewCell.Type {
    switch self {
    case .menu:
      return MenuTabCellTableViewCell.self
    case .food:
      return ContohTableViewCell.self
    case .track:
      return StackTableViewCell.self
    case .suggestion:
      return SuggestionMenuCell.self
    }
  }
}



class ThirdViewController: UIViewController {

  @IBOutlet var tableView: UITableView!

  var vm = ThirdViewControllerViewModel()
  var test = MyLibrary()

//  let calculations = [
//    #stringify(1 + 1)
//  ]

  override func viewDidLoad() {
    super.viewDidLoad()
    setup()
    vm.fetch()
  }

  func setup() {
    configureTableView()
  }

  func configureTableView() {
    tableView.delegate = self
    tableView.dataSource =  self

    ThirdViewControllerTypeCell.allCases.forEach{ cell in
      tableView.registerCellWithNib(cell.cellTypes)
    }
  }

}

extension ThirdViewController: UITableViewDelegate, UITableViewDataSource {

  func numberOfSections(in tableView: UITableView) -> Int {
    return ThirdViewControllerTypeCell.allCases.count
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    let typecell = ThirdViewControllerTypeCell(rawValue: section)
    switch typecell {
    case .menu:
      return 1
    case .food:
      return 4
    case .track:
      return 4
    case .suggestion:
      return 1
    default:
      return 0
    }
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    let typecell = ThirdViewControllerTypeCell(rawValue: indexPath.section)
    switch typecell {
    case .menu:
      let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as MenuTabCellTableViewCell
      cell.delegate = self
      cell.didTapCell = { [weak self] data in
        let vc = DetailViewController()
        vc.person = data
        vc.hidesBottomBarWhenPushed = true
        self?.navigationController?.pushViewController(vc, animated: true)
      }
      return cell
    case .food:
      let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as ContohTableViewCell
      // Hide viewArrowTop in the first row
      cell.viewArrowTop.isHidden = indexPath.row == 0

      // Hide viewArrowBottom in the last row
      cell.viewArrowBottom.isHidden = indexPath.row == tableView.numberOfRows(inSection: indexPath.section) - 1
      return cell
    case .track:
      let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as StackTableViewCell
      // Hide viewArrowTop in the first row
      cell.label2.isHidden = indexPath.row == 2
      cell.viewBottom.isHidden = true
      cell.tableView = tableView
      cell.delegate = self
      return cell
    case .suggestion:
      let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as SuggestionMenuCell
      return cell

    default:
      return UITableViewCell()
    }
  }

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return UITableView.automaticDimension
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let typecell = ThirdViewControllerTypeCell(rawValue: indexPath.section)
    switch typecell {
    case .menu:
      print("row \(indexPath.section)")
    case .food:
      let indexSelected =  indexPath.row
      print("row \(indexSelected)")
      let vc = DetailViewController()
      vc.hidesBottomBarWhenPushed = true
      self.navigationController?.pushViewController(vc, animated: true)
    default:
      break
    }
  }



}

extension ThirdViewController: MenuTabCellTableViewCellDelegate {
  func didtaplabel() {
    print("hai")
  }

  func didTapMenu(data: Person) {
    let vc = DetailViewController()
    vc.hidesBottomBarWhenPushed = true
    vc.closureData = { data in
      print(data)
      if let tabBarController = self.navigationController?.tabBarController as? MainTabBarViewController {
        tabBarController.selectedIndex = 0
      }
    }

    self.navigationController?.pushViewController(vc, animated: true)
  }
}

extension ThirdViewController: StackTableViewCellDelegate {
  func updateCellHeight(indexPath: IndexPath) {
    tableView.reloadRows(at: [indexPath], with: .none)
  }

}
