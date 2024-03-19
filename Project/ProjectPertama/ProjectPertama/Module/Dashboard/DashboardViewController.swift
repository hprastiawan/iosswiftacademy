//
//  DashboardViewController.swift
//  ProjectPertama
//
//  Created by Macbook on 19/02/24.
//

import UIKit

// Define DataStruct1
struct DataStruct1 {
  var title: String
  var subtitle: String
}

// Define DataStruct2
struct DataStruct2 {
  var name: String
  var age: Int
  var personImage: String
}


class DashboardViewController: UIViewController {

  @IBOutlet weak var tableView: UITableView!

  // Data for each section
  let sectionData = ["Section 1", "Section 2"]
  let dataForSection1: [DataStruct1] = [DataStruct1(title: "Title 1", subtitle: "Subtitle 1"), DataStruct1(title: "Title 2", subtitle: "Subtitle 2")]
  let dataForSection2: [DataStruct2] = [DataStruct2(name: "John", age: 70, personImage: "prabowo"), DataStruct2(name: "Alice", age: 35, personImage: "gibran")]


  override func viewDidLoad() {
    super.viewDidLoad()

    // Mengatur delegasi dan data source untuk UITableView
    tableView.delegate = self
    tableView.dataSource = self
    // Register the custom cell .xib file with the UITableView
    tableView.register(UINib(nibName: "ListItemCell", bundle: nil), forCellReuseIdentifier: "ListItemCell")
    tableView.register(UINib(nibName: "PersonListCell", bundle: nil), forCellReuseIdentifier: "PersonListCell")

  }

}

// MARK: - UITableViewDataSource Methods
extension DashboardViewController: UITableViewDelegate, UITableViewDataSource {

  func numberOfSections(in tableView: UITableView) -> Int {
    return sectionData.count
  }
  // Jumlah baris dalam UITableView
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return section == 0 ? dataForSection1.count : dataForSection2.count
  }

  // Mendapatkan sel untuk tampilan pada posisi tertentu dalam UITableView
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    switch indexPath.section {
    case 0:
      let cell = tableView.dequeueReusableCell(withIdentifier: "ListItemCell", for: indexPath) as! ListItemCell
      cell.configView(data: dataForSection1[indexPath.row])// Mengatur teks sel sesuai dengan data array
      return cell
    case 1:
      let cell = tableView.dequeueReusableCell(withIdentifier: "PersonListCell", for: indexPath) as! PersonListCell
      cell.configView(item: dataForSection2[indexPath.row] )
      return cell
    default:
      return UITableViewCell()
    }
  }

  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 50))
    headerView.backgroundColor = UIColor.blue

    let label = UILabel(frame: CGRect(x: 15, y: 10, width: tableView.frame.width - 30, height: 30))
    label.font = UIFont.boldSystemFont(ofSize: 18)
    label.textColor = UIColor.white
    label.text = sectionData[section]

    headerView.addSubview(label)

    return headerView
  }

  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 50
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)

    let vc = DashboardGridViewController()
    self.navigationController?.pushViewController(vc, animated: true)
  }
}
