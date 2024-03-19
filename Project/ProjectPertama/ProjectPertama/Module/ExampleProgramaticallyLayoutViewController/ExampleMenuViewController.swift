//
//  ExampleMenuViewController.swift
//  ProjectPertama
//
//  Created by Macbook on 28/02/24.
//

import UIKit

import UIKit

// Struktur data untuk item-menu makanan
struct MenuItem {
    let name: String
    let price: Double
    let description: String
    let imageURL: String
}

class ExampleMenuViewController: UIViewController {

    // Data-menu makanan
    let section1Items: [MenuItem] = [
        MenuItem(name: "Nasi Goreng", price: 15.0, description: "Nasi goreng spesial dengan telur dadar, ayam, dan sayuran.", imageURL: "ic_dish_img1"),
        MenuItem(name: "Mie Ayam", price: 12.0, description: "Mie ayam dengan irisan daging ayam, pangsit, dan kuah kaldu.", imageURL: "ic_dish_img2"),
        // Tambahkan item-menu lainnya jika diperlukan
    ]

    let section2Items: [MenuItem] = [
        MenuItem(name: "Sate Ayam", price: 20.0, description: "Sate ayam spesial dengan bumbu kacang dan irisan bawang.", imageURL: "ic_dish_img3"),
        MenuItem(name: "Gado-Gado", price: 18.0, description: "Gado-gado dengan campuran sayuran segar dan bumbu kacang khas.", imageURL: "ic_dish_img4"),
        // Tambahkan item-menu lainnya jika diperlukan
    ]

    // Tabel-menu
    var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Membuat tabel-menu
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MenuTableViewCell.self, forCellReuseIdentifier: "MenuTableViewCell")
        view.addSubview(tableView)
    }
}

extension ExampleMenuViewController: UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        // Menentukan jumlah bagian (sections) dalam tabel
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Menentukan jumlah sel dalam setiap bagian
        return section == 0 ? section1Items.count : section2Items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Membuat sel untuk setiap bagian dan menampilkannya dengan data dari struktur MenuItem

        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell", for: indexPath) as! MenuTableViewCell

        let menuItem = indexPath.section == 0 ? section1Items[indexPath.row] : section2Items[indexPath.row]
        cell.configure(with: menuItem)

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // Menentukan tinggi sel
      return UITableView.automaticDimension
    }
}

