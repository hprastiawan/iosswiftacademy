//
//  ExampleAnimationViewController.swift
//  ProjectPertama
//
//  Created by Macbook on 27/02/24.
//

import UIKit
import netfox

class ExampleAnimationViewController: UIViewController {

  @IBOutlet var containerView: UIView!

  var animator = UIViewPropertyAnimator()

  override func viewDidLoad() {
    super.viewDidLoad()
    animateWithCALayer()
  }

  func animateWithCALayer() {
    // Membuat layer untuk animasi
    let animationLayer = CALayer()
    animationLayer.backgroundColor = UIColor.blue.cgColor
    animationLayer.frame = CGRect(x: 50, y: 100, width: 100, height: 100)

    // Menambahkan layer ke dalam tampilan
    containerView.layer.addSublayer(animationLayer)

    // Membuat animasi menggunakan CABasicAnimation
    let animation = CABasicAnimation(keyPath: "position")
    animation.fromValue = NSValue(cgPoint: CGPoint(x: 50, y: 100))
    animation.toValue = NSValue(cgPoint: CGPoint(x: 200, y: 200))
    animation.duration = 2.0

    // Menambahkan animasi ke dalam layer
    animationLayer.add(animation, forKey: "positionAnimation")
  }

  func animateCAKeyframeAnimation() {
    let animation = CAKeyframeAnimation(keyPath: "position")
    animation.path = UIBezierPath(ovalIn: CGRect(x: 50, y: 100, width: 200, height: 200)).cgPath
    animation.duration = 4.0
    containerView.layer.add(animation, forKey: "positionAnimation")
  }

  func animateCATransition() {
    let transition = CATransition()
    transition.type = .fade
    transition.duration = 1.0
    containerView.layer.add(transition, forKey: nil)

    // Ganti tampilan dengan tampilan baru
//    containerView.addSubview(newView)
  }

  func animateCASpring() {
    // Membuat animasi dengan efek spring
    let animation = CASpringAnimation(keyPath: "position.y")

    // Menentukan nilai awal dan akhir posisi
    animation.fromValue = containerView.layer.position.y
    animation.toValue = containerView.layer.position.y + 100

    // Mengatur parameter efek spring
    animation.damping = 2.0 // Damping ratio
    animation.initialVelocity = 10.0 // Kecepatan awal

    // Mengatur durasi animasi
    animation.duration = animation.settlingDuration

    // Mengatur interpolasi animasi
    animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)

    // Menambahkan animasi ke dalam layer view
    containerView.layer.add(animation, forKey: nil)
  }



}

extension ExampleAnimationViewController {
  func animateView() {
    // Menentukan posisi awal yang diinginkan untuk view yang akan dianimasikan
    let firstPosition = CGAffineTransform(translationX: 0.0, y: self.view.frame.height)

    // Menentukan durasi animasi (dalam detik)
    let duration: TimeInterval = 2.0

    self.containerView.transform =  firstPosition
    self.containerView.alpha =  0.0

    // Animasi menggunakan UIView.animate
    UIView.animate(withDuration: duration,
                   delay: 0.0,
                   options: [.curveEaseInOut],
                   animations: {
      let endPosition = CGAffineTransform(translationX: 0.0 , y: 0.0)
      self.containerView.transform = endPosition
      self.containerView.alpha =  1.0
    }, completion: nil)
  }

  func animatePropertyView() {
    // Membuat property animator
    animator = UIViewPropertyAnimator(duration: 2.0, curve: .easeInOut) {
      // Mengubah posisi dan skala view
      self.containerView.transform = CGAffineTransform(translationX: 100, y: 200).scaledBy(x: 2.0, y: 2.0)
    }


    // Mengatur handler penyelesaian animasi
    animator.addCompletion { position in
      // Memastikan bahwa animasi selesai
      if position == .end {
        // Mengatur ulang transformasi view ke posisi awal
        self.containerView.transform = .identity
        // Mengulangi animasi dari awal
        self.animatePropertyView()
      }
    }
    // Menambahkan handling untuk mengubah animasi saat interaksi pengguna (contoh: ketika view disentuh)
    containerView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
    // Memulai animasi
    animator.startAnimation()
  }

  @objc func handleTap() {
    // Menghentikan animasi dan membalikkan ke posisi awal
    if animator.isRunning {
      animator.pauseAnimation()
    } else {
      animator.startAnimation()
    }
  }
}


//
//class ViewController: UIViewController {
//
//    @IBOutlet var animatedViewTopConstraint: NSLayoutConstraint!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Mengatur posisi awal konstrain
//        animatedViewTopConstraint.constant = 0
//    }
//
//    @IBAction func animateButtonTapped(_ sender: UIButton) {
//        // Mengubah konstrain dalam blok animasi
//        UIView.animate(withDuration: 0.5) {
//            self.animatedViewTopConstraint.constant = -100 // Menggerakkan tampilan ke atas sejauh 100 poin
//            self.view.layoutIfNeeded() // Memaksa layout ulang untuk menerapkan perubahan konstrain
//        }
//    }
//}
//
//import UIKit
//
//class ViewController: UIViewController {
//
//    @IBOutlet var animatedView: UIView!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
//
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//
//        // Membuat jalur path menggunakan UIBezierPath
//        let path = UIBezierPath()
//        path.move(to: CGPoint(x: 50, y: 100))
//        path.addCurve(to: CGPoint(x: 300, y: 100),
//                      controlPoint1: CGPoint(x: 150, y: 0),
//                      controlPoint2: CGPoint(x: 200, y: 200))
//
//        // Membuat animasi menggunakan CAKeyframeAnimation
//        let animation = CAKeyframeAnimation(keyPath: "position")
//        animation.path = path.cgPath
//        animation.duration = 4.0
//        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
//
//        // Menambahkan animasi ke dalam layer view
//        animatedView.layer.add(animation, forKey: "pathAnimation")
//    }
//}
//
//UIView.animate(withDuration: 0.3) { [weak self] in
//    guard let self = self else { return }
//    // Penanganan animasi di sini
//}

