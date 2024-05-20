//
//  AnimatedCircleViewController.swift
//  ProjectPertama
//
//  Created by Macbook on 25/04/24.
//

import UIKit


class AnimatedCircleViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }

  func setupView() {
    // Membuat tampilan lingkaran
    let circleView = CircleView(frame: CGRect(x: 100, y: view.frame.width/2, width: 200, height: 200))
    circleView.animateColorChange(to: .red)
    view.addSubview(circleView)

    // Animasi mengubah warna lingkaran
    UIView.animate(withDuration: 2.0, delay: 0, options: [.autoreverse, .repeat], animations: {
      circleView.backgroundColor = .yellow
      circleView.animateColorChange(to: .white)
    }, completion: nil)

    let screenHeight = UIScreen.main.bounds.height - 400

    // Animasi mengubah ukuran lingkaran
    UIView.animate(withDuration: 2.0, delay: 0, options: [.autoreverse, .repeat], animations: {
      circleView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
      circleView.transform = CGAffineTransform(translationX: 0, y: screenHeight)
      circleView.transform = CGAffineTransform(rotationAngle: 0.8)
    }, completion: nil)
  }



}
