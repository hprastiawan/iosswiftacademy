//
//  MenuTableViewCell.swift
//  ProjectPertama
//
//  Created by Macbook on 28/02/24.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

  // Tampilan yang ditampilkan dalam sel (cell)
  let  nameLabel: UILabel = {
    let nameLabel = UILabel()
    nameLabel.font = UIFont.boldSystemFont(ofSize: 18)
    nameLabel.translatesAutoresizingMaskIntoConstraints = false
    return nameLabel
  }()

  let priceLabel: UILabel = {
    let priceLabel = UILabel()
    priceLabel.font = UIFont.systemFont(ofSize: 16)
    priceLabel.translatesAutoresizingMaskIntoConstraints = false
    return priceLabel
  }()

  let descriptionLabel: UILabel = {
    let descriptionLabel = UILabel()
    descriptionLabel.font = UIFont.systemFont(ofSize: 14)
    descriptionLabel.numberOfLines = 0
    descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
    return descriptionLabel
  }()


  let itemImageView: UIImageView = {
    let itemImageView = UIImageView()
    itemImageView.contentMode = .scaleAspectFit
    itemImageView.translatesAutoresizingMaskIntoConstraints = false
    return itemImageView
  }()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setup()
    setupConstraint()
  }

  func setup() {
    contentView.addSubview(nameLabel)
    contentView.addSubview(priceLabel)
    contentView.addSubview(descriptionLabel)
    contentView.addSubview(itemImageView)
  }
  
  func setupConstraint() {
    // Atur tata letak tampilan dalam sel
    NSLayoutConstraint.activate([
      // Konstrain untuk nameLabel
      nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
      nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
      nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),

      // Konstrain untuk priceLabel
      priceLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
      priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),

      // Konstrain untuk descriptionLabel
      descriptionLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 5),
      descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
      descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),

      // Konstrain untuk itemImageView
      itemImageView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
      itemImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
      itemImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
      itemImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
      itemImageView.heightAnchor.constraint(equalToConstant: 80) // Atur tinggi gambar
    ])
  }

  func configure(with menuItem: MenuItem) {
    // Mengatur data-menu pada tampilan sel
    nameLabel.text = menuItem.name
    priceLabel.text = "$\(menuItem.price)"
    descriptionLabel.text = menuItem.description
    itemImageView.image = UIImage(named: menuItem.imageURL)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

