//
//  GestureImplementationViewController.swift
//  ProjectPertama
//
//  Created by Macbook on 17/02/24.
//

import UIKit

class GestureImplementationViewController: UIViewController {

  @IBOutlet weak var gestureView: UIView!
  @IBOutlet weak var parentPanGestureView: UIView!
  @IBOutlet weak var panGestureView: UIView!

  override func viewDidLoad() {
    super.viewDidLoad()

//    let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
//    swipeGesture.direction = .left // Atur arah geser yang diinginkan
//    gestureView.addGestureRecognizer(swipeGesture)

//    // Menambahkan gesture recognizer pada view
//    let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
//    panGestureView.addGestureRecognizer(panGesture)


    gestureView.addSwipeGesture(self, action: #selector(handleSwipe(_:)))
    setupGesture()


  }

  @objc func handleSwipe(_ gesture: UISwipeGestureRecognizer) {
    // Menangani geser ke kiri di sini
    switch gesture.direction {
    case .left:
      print("Swiped left")
    case .right:
      print("Swipe Right")
    default:
      break
    }

  }

  // Aksi untuk gesture penggeseran
  @objc func handlePan(_ gesture: UIPanGestureRecognizer) {
    let translation = gesture.translation(in: parentPanGestureView)

    switch gesture.state {
    case .began, .changed:
      // Mengubah posisi view berdasarkan pergerakan gesture
      let newX = panGestureView.center.x + translation.x
      // Memastikan swipeView tidak melewati batas parentnya
      let maxX = parentPanGestureView.frame.width - panGestureView.frame.width / 2
      let minX = panGestureView.frame.width / 2
      panGestureView.center.x = max(minX, min(maxX, newX))
      // Reset nilai pergerakan untuk mencegah akumulasi
      gesture.setTranslation(.zero, in: view)
    case .ended:
      let maxX = parentPanGestureView.frame.width - panGestureView.frame.width / 2
      if panGestureView.center.x >= maxX {
        showAlert()
      }
    default:
      break
    }
  }


  func setupGesture() {
    panGestureView.addPanGetureAction { gesture in
      let translation = gesture.translation(in: self.parentPanGestureView)
      switch gesture.state {
      case .began, .changed:
        let newX = self.panGestureView.center.x + translation.x
        let maxX = self.parentPanGestureView.frame.width - self.panGestureView.frame.width / 2
        let minX = self.panGestureView.frame.width / 2
        self.panGestureView.center.x = max(minX, min(maxX, newX))
        gesture.setTranslation(.zero, in: self.view)
      case .ended:
        let maxX = self.parentPanGestureView.frame.width - self.panGestureView.frame.width / 2
        if self.panGestureView.center.x >= maxX {
          self.showAlert()
        }
      default:
        break
      }
    }
  }

  // Fungsi untuk menampilkan alert
  func showAlert() {
    let alertController = UIAlertController(title: "Batas Maksimum", message: "SwipeView telah mencapai batas maksimum.", preferredStyle: .alert)
    let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
    alertController.addAction(okAction)
    present(alertController, animated: true, completion: nil)
  }

}
