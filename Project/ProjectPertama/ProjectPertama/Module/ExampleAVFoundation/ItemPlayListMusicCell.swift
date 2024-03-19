//
//  ItemPlayListMusicCell.swift
//  ProjectPertama
//
//  Created by Macbook on 29/02/24.
//

import UIKit

struct ListDataMusic {
  var image: String
  var titleSong: String
  var descrption: String
  var duration: Int
}

class ItemPlayListMusicCell: UITableViewCell {


  @IBOutlet weak var containerView: UIView!
  @IBOutlet weak var itemAudioImage: UIImageView!
  @IBOutlet weak var itemTitleLabel: UILabel!
  @IBOutlet weak var itemDescriptionLabel: UILabel!
  @IBOutlet weak var itemDurationLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.setGradientView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)


    }

  func configureItem(item: ListDataMusic?) {
    if let item = item {
      itemAudioImage.image = UIImage(named: item.image)
      itemTitleLabel.text =  item.titleSong
      itemDescriptionLabel.text = item.descrption
      itemDurationLabel.text = formatDurationFromTimestamp(timestamp: TimeInterval(item.duration))
    }
  }

  func formatDurationFromTimestamp(timestamp: TimeInterval) -> String {
      let minutes = Int(timestamp) / 60
      let seconds = Int(timestamp) % 60
      return String(format: "%02d:%02d", minutes, seconds)
  }
    
}
