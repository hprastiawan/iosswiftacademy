//
//  ViewController.swift
//  TestAplikasi
//
//  Created by Macbook on 26/10/23.
//

import UIKit

class MainTabBarViewController: UITabBarController {

  let btnMiddle : UIButton = {
    let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
    btn.setTitle("", for: .normal)
    btn.backgroundColor = .gray
    btn.layer.cornerRadius = 30
    btn.layer.shadowColor = UIColor.black.cgColor
    btn.layer.shadowOpacity = 0.2
    btn.layer.shadowOffset = CGSize(width: 4, height: 4)
    btn.setBackgroundImage(UIImage(named: "ic_cart"), for: .normal)

    return btn
  }()

  let homeVC = UINavigationController(rootViewController: FirstViewController())
  let Favorite = UINavigationController(rootViewController: ThirdViewController())
  let Middle = UINavigationController(rootViewController: UIViewController())
  let Profile = UINavigationController(rootViewController: SecondViewController())
  let Test = UINavigationController(rootViewController: FourthViewController())


  override func viewDidLoad() {
      super.viewDidLoad()
      configureTabBar()
      configureUITabBarItems()
      btnMiddle.frame = CGRect(x: Int(self.tabBar.bounds.width)/2 - 30, y: -20, width: 60, height: 60)
      btnMiddle.addTarget(self, action: #selector(btnMiddleTapped), for: .touchUpInside)
  }



  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    hideNavigationBar()

  }


  func hideNavigationBar() {
    self.navigationController?.isToolbarHidden = true
    self.navigationController?.isNavigationBarHidden = true
    self.navigationController?.navigationBar.isTranslucent = false
    hidesBottomBarWhenPushed = false
    navigationController?.isNavigationBarHidden = true

    hidesBottomBarWhenPushed = false
  }

  override func loadView() {
    super.loadView()
    self.tabBar.addSubview(btnMiddle)
    setupCustomTabBar()

  }

  @objc func btnMiddleTapped() {
//    let vc = CartViewController()
//    navigationController?.pushViewController(vc, animated: true)
  }

  func configureUITabBarItems(){
      homeVC.tabBarItem = UITabBarItem(title: "Home", image: SFSymbols.homeSymbol, tag: 0)
      Favorite.tabBarItem = UITabBarItem(title: "Favorite", image:  SFSymbols.orderSymbol, tag: 1)
      Profile.tabBarItem = UITabBarItem(title: "Profile", image:  SFSymbols.arrowSymbol, tag: 2)
      Test.tabBarItem = UITabBarItem(title: "Test", image:  SFSymbols.profileSymbol, tag: 3)


      UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
      UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.red], for: .selected)

    UITabBar.appearance().tintColor = UIColor.magenta

  }

  func configureTabBar() {
//    self.delegate = self
    setViewControllers([homeVC, Favorite, Middle, Profile, Test], animated: true)
  }


}

extension MainTabBarViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController.tabBarItem.tag == 1 {
//            let account = UINavigationController(rootViewController: SecondViewController())
//            account.modalTransitionStyle = .coverVertical
//            account.modalPresentationStyle = .fullScreen
//            viewController.present(account, animated: true)
//
//            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
//                self.selectedIndex = 0
//            }
            return true
        } else if viewController.tabBarItem.tag == 2 {
            return true
        } else if viewController.tabBarItem.tag == 3 {
            return true
        }
        return true
    }

}

extension MainTabBarViewController {
  func setupCustomTabBar() {
       let path: UIBezierPath = getPathForTabBar()
       let shape = CAShapeLayer()
       shape.path = path.cgPath
       shape.lineWidth = 3
       shape.strokeColor = UIColor.pokemonMaroon5.cgColor
       shape.fillColor = UIColor.pokemonMaroon5.cgColor
       self.tabBar.layer.insertSublayer(shape, at: 0)
       self.tabBar.itemWidth = 40
       self.tabBar.itemPositioning = .centered
       self.tabBar.itemSpacing = 70
       self.tabBar.tintColor = UIColor(named: "Primary")
       self.tabBar.unselectedItemTintColor = UIColor.white
       self.tabBar.barTintColor = UIColor.clear
       self.tabBar.backgroundColor = UIColor.clear

       if #available(iOS 15.0, *) {
           let appearance = UITabBarAppearance()
           appearance.configureWithTransparentBackground()
           tabBar.standardAppearance = appearance
           tabBar.scrollEdgeAppearance = appearance
       }

   }



   func getPathForTabBar() -> UIBezierPath {
       let holeWidth: CGFloat = 170
       let holeHeight: CGFloat = 70
       let frameWidth = self.tabBar.bounds.width
       let frameHeight = self.tabBar.bounds.height + 40
       let leftXUntilHole = frameWidth / 2 - holeWidth / 2


       let path = UIBezierPath()

       // Move to the starting point
       path.move(to: CGPoint(x: 0, y: 0))

       // 1. Line
       path.addLine(to: CGPoint(x: leftXUntilHole, y: 0))

       // Part I
       path.addCurve(to: CGPoint(x: leftXUntilHole + (holeWidth / 3), y: holeHeight / 2),
                     controlPoint1: CGPoint(x: leftXUntilHole + ((holeWidth / 3) / 8) * 6, y: 0),
                     controlPoint2: CGPoint(x: leftXUntilHole + ((holeWidth / 3) / 8) * 8, y: holeHeight / 2))

       // Part II
       path.addCurve(to: CGPoint(x: leftXUntilHole + (2 * holeWidth) / 3, y: holeHeight / 2),
                     controlPoint1: CGPoint(x: leftXUntilHole + (holeWidth / 3) + (holeWidth / 3) / 3 * 2 / 5, y: (holeHeight / 2) * 6 / 4),
                     controlPoint2: CGPoint(x: leftXUntilHole + (holeWidth / 3) + (holeWidth / 3) / 3 * 2 + (holeWidth / 3) / 3 * 3 / 5, y: (holeHeight / 2) * 6 / 4))

       // Part III
       path.addCurve(to: CGPoint(x: leftXUntilHole + holeWidth, y: 0),
                     controlPoint1: CGPoint(x: leftXUntilHole + (2 * holeWidth) / 3, y: holeHeight / 2),
                     controlPoint2: CGPoint(x: leftXUntilHole + (2 * holeWidth) / 3 + (holeWidth / 3) * 2 / 8, y: 0))

       // 2. Line
       path.addLine(to: CGPoint(x: frameWidth, y: 0))

       // 3. Line
       path.addLine(to: CGPoint(x: frameWidth, y: frameHeight))

       // 4. Line
       path.addLine(to: CGPoint(x: 0, y: frameHeight))

       // 5. Line
       path.addLine(to: CGPoint(x: 0, y: 0))

       // Close the path
       path.close()

       return path
   }
}


