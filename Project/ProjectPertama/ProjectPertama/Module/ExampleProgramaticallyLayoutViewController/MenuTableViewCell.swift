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
    itemImageView.contentMode = .scaleToFill
    itemImageView.translatesAutoresizingMaskIntoConstraints = false
    return itemImageView
  }()

  let containerView: UIView = {
    let containerView = UIView()
    containerView.backgroundColor = .systemBackground
    containerView.layer.cornerRadius = 5
    containerView.layer.borderWidth = 0.6
    containerView.layer.borderColor = UIColor.gray.withAlphaComponent(0.3).cgColor
    containerView.layer.shadowColor = UIColor.gray.withAlphaComponent(0.3).cgColor
    containerView.layer.shadowOffset = CGSize(width: 0, height: 4)
    containerView.layer.shadowOpacity = 1
    containerView.layer.shadowRadius = 5
    containerView.translatesAutoresizingMaskIntoConstraints = false
    return containerView
  }()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setup()
    setupConstraint()
  }

  func setup() {
    contentView.addSubview(containerView)
    contentView.addSubview(nameLabel)
    contentView.addSubview(priceLabel)
    contentView.addSubview(descriptionLabel)
    contentView.addSubview(itemImageView)
  }
  
  func setupConstraint() {
    // Atur tata letak tampilan dalam sel
    NSLayoutConstraint.activate([
      // Konstrain untuk nameLabel

      containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
      containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
      containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
      containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),




      nameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
      nameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
      nameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),

      // Konstrain untuk priceLabel
      priceLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
      priceLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),

      // Konstrain untuk descriptionLabel
      descriptionLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 5),
      descriptionLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
      descriptionLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),

      // Konstrain untuk itemImageView
      itemImageView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 5),
      itemImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 5),
      itemImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -5),
      itemImageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -5),
      itemImageView.heightAnchor.constraint(equalToConstant: 200) // Atur tinggi gambar
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

