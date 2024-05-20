//
//  UserListViewController.swift
//  ProjectPertama
//
//  Created by Macbook on 25/02/24.
//

import UIKit
import RxSwift
import RxCocoa
import SwiftUI
import SkeletonView

//@available(iOS 13.0, *)
//struct ViewController_Previews: PreviewProvider {
//    static var previews: some View {
//        previewViewController(UserListViewController())
//    }
//}

class UserListViewController: UIViewController {

  @IBOutlet weak var tableView: UITableView!

  var viewModel = UserListViewModel()
  let bag = DisposeBag()
  var articles: PlaceHolder? {
    didSet {
      self.tableView.reloadData()
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(UINib(nibName: "ArticleTableViewCell", bundle: nil), forCellReuseIdentifier: "ArticleTableViewCell")
    tableView.register(UINib(nibName: "SimpleSkeletonCell", bundle: nil), forCellReuseIdentifier: "SimpleSkeletonCell")
    bindViewModel()
  }

  func bindViewModel() {
    viewModel.fetchPlaceholder()
    viewModel.articles.asObservable().subscribe(onNext: { [weak self] data in
      guard let self = self else { return }
      self.articles = data
    }).disposed(by: bag)

    viewModel.loadingState.asObservable().subscribe(onNext: { [weak self] state in
      guard let self = self else { return }
      switch state {
      case .loading:
        self.tableView.showAnimatedGradientSkeleton()
      case .finished:
        self.tableView.hideSkeleton()
      case .failed:
        self.tableView.hideSkeleton()
      }

    }).disposed(by: bag)
  }
}

extension UserListViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return articles?.count ?? 0
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    guard let data = self.articles else { return UITableViewCell() }
    let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as! ArticleTableViewCell
    cell.configView(data: data[indexPath.row])// Mengatur teks sel sesuai dengan data array
    return cell
  }

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return UITableView.automaticDimension
  }
}



extension UserListViewController: SkeletonTableViewDataSource {

    func collectionSkeletonView(_ skeletonView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    func collectionSkeletonView(_ tableView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return "ArticleTableViewCell"

    }
}
