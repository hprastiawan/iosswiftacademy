//
//  CircleView.swift
//  ProjectPertama
//
//  Created by Macbook on 25/04/24.
//

import Foundation
import UIKit

class CircleView: UIView {

  var colorView: UIColor  = .red

  override func draw(_ rect: CGRect) {
    guard let context = UIGraphicsGetCurrentContext() else { return  }
    // Mengatur warna fill
    context.setFillColor(colorView.cgColor)

    // Menggambar lingkaran
    let circleRect = CGRect(x: 50, y: 50, width: 100, height: 100)
    context.fillEllipse(in: circleRect)
  }

  func animateColorChange(to color: UIColor) {
      UIView.animate(withDuration: 1.0) {
        self.colorView = color
          self.setNeedsDisplay() // Trigger redrawing
      }
  }
}
