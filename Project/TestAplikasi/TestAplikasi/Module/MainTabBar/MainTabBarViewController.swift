//
//  ViewController.swift
//  TestAplikasi
//
//  Created by Macbook on 26/10/23.
//

import UIKit

class MainTabBarViewController: UITabBarController {

  let homeVC = UINavigationController(rootViewController: FirstViewController())
  let Favorite = UINavigationController(rootViewController: ThirdViewController())
  let Profile = UINavigationController(rootViewController: SecondViewController())
  let Test = UINavigationController(rootViewController: FourthViewController())


  override func viewDidLoad() {
      super.viewDidLoad()
      configureTabBar()
      configureUITabBarItems()
  }

  func configureUITabBarItems(){
      homeVC.tabBarItem = UITabBarItem(title: "Home", image: SFSymbols.homeSymbol, tag: 0)
      Favorite.tabBarItem = UITabBarItem(title: "Favorite", image:  SFSymbols.orderSymbol, tag: 1)
      Profile.tabBarItem = UITabBarItem(title: "Profile", image:  SFSymbols.arrowSymbol, tag: 2)
      Test.tabBarItem = UITabBarItem(title: "Test", image:  SFSymbols.arrowSymbol, tag: 3)


      UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .normal)
      UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.red], for: .selected)

      UITabBar.appearance().tintColor = UIColor.red
      self.tabBar.backgroundColor = UIColor.white

  }

  func configureTabBar() {
//    self.delegate = self
    setViewControllers([homeVC, Favorite, Profile, Test], animated: true)
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


