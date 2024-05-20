//
//  ExampleSkelotonTableViewViewController.swift
//  ProjectPertama
//
//  Created by Macbook on 04/05/24.
//

import UIKit
import SkeletonView

class ExampleSkelotonTableViewViewController: UIViewController {

  
  @IBOutlet weak var tableView: UITableView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Test Skeloton View"
      tableView.delegate = self
      tableView.dataSource = self
      tableView.register(UINib(nibName: "TestSkelotonTableViewCell", bundle: nil), forCellReuseIdentifier: "TestSkelotonTableViewCell")
      tableView.showAnimatedGradientSkeleton()
    }
}

extension ExampleSkelotonTableViewViewController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 4
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "TestSkelotonTableViewCell", for: indexPath) as! TestSkelotonTableViewCell
    return cell
  }
}

extension ExampleSkelotonTableViewViewController: SkeletonTableViewDataSource {
  func collectionSkeletonView(_ skeletonView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return 2
  }

  func collectionSkeletonView(_ tableView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
      return "TestSkelotonTableViewCell"

  }
}
