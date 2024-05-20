//
//  ExtUINavigationController.swift
//  ProjectPertama
//
//  Created by Macbook on 03/05/24.
//

import Foundation
import UIKit

extension UINavigationController {
  func setupNavbarController() {
    let appereance = UINavigationBarAppearance()
    appereance.configureWithOpaqueBackground()

    appereance.backgroundColor = .purple
    appereance.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
    appereance.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]

    self.navigationBar.standardAppearance = appereance
    self.navigationBar.scrollEdgeAppearance = appereance
    self.navigationBar.compactAppearance = appereance

    self.navigationBar.tintColor = .white

    UINavigationBar.appearance().tintColor = .white
  }
}
