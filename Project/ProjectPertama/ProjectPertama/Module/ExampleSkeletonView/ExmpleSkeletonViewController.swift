//
//  ExmpleSkeletonViewController.swift
//  ProjectPertama
//
//  Created by Macbook on 03/05/24.
//

import UIKit
import SwiftUI
import SkeletonView

@available(iOS 13.0, *)
struct ViewController_Previews: PreviewProvider {
  static var previews: some View {
    previewViewController(ExmpleSkeletonViewController())
  }
}

class ExmpleSkeletonViewController: UIViewController {

  @IBOutlet weak var testSkeletonView: UIView!

  @IBOutlet weak var view2: UIView!

  @IBOutlet weak var view3: UIView!

  @IBOutlet weak var view4: UIView!

  @IBOutlet weak var titleLabel: UILabel!
  
  var switchBtn: Bool = true


  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationItem.title = "Test Skeloton View"
    testSkeletonView.showAnimatedGradientSkeleton()
    view2.showSkeleton()
    view3.showGradientSkeleton()
    view4.showAnimatedSkeleton()
    titleLabel.lastLineFillPercent = 50
    titleLabel.linesCornerRadius = 5
    titleLabel.showSkeleton()

  }



  @IBAction func didTapButton(_ sender: Any) {
    switchBtn.toggle()

    if switchBtn {
      testSkeletonView.hideSkeleton()
      view2.hideSkeleton()
      view3.hideSkeleton()
      view4.hideSkeleton()
    } else {
      let gradient = SkeletonGradient(baseColor: UIColor.midnightBlue)
      let animation = SkeletonAnimationBuilder().makeSlidingAnimation(withDirection: .rightLeft)
      testSkeletonView.showAnimatedGradientSkeleton(usingGradient: gradient, animation: animation, transition: .crossDissolve(0.45))
      view2.showSkeleton(usingColor: UIColor.pomegranate)
      view3.showGradientSkeleton(usingGradient: gradient, transition: .crossDissolve(0.45))
      view4.showAnimatedSkeleton()
    }


  }


}
