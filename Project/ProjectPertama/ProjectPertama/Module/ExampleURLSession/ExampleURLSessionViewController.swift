//
//  ExampleURLSessionViewController.swift
//  ProjectPertama
//
//  Created by Macbook on 21/02/24.
//

import UIKit
import Foundation



class ExampleURLSessionViewController: UIViewController {

  @IBOutlet weak var tableView: UITableView!

  var articles = PlaceHolder()

  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.delegate = self
    tableView.dataSource = self
    // Register the custom cell .xib file with the UITableView
    tableView.register(UINib(nibName: "ArticleTableViewCell", bundle: nil), forCellReuseIdentifier: "ArticleTableViewCell")
    fetchData()
  }


  func fetchData() {
    // Panggil fungsi fetchProductRequest melalui instance shared dari kelas NetworkManager
    NetworkManager.shared.fetchProductRequest(endpoint: .news, expecting: PlaceHolder.self) { result in
        switch result {
        case .success(let data):
            // Penanganan hasil jika permintaan berhasil
            print("Success: \(data)")
            self.articles = data
            self.tableView.reloadData()
        case .failure(let error):
            // Penanganan kesalahan jika permintaan gagal
            print("Error: \(error)")
        }
    }
  }
}

extension ExampleURLSessionViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return articles.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as! ArticleTableViewCell
    cell.configView(data: articles[indexPath.row])// Mengatur teks sel sesuai dengan data array
    return cell
  }
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return UITableView.automaticDimension
  }
}
