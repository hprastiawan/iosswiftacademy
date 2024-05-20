//
//  BaseTableScrollView.swift
//  ProjectPertama
//
//  Created by Macbook on 15/05/24.
//

import Foundation
import UIKit

class BaseTableView: UITableView, UIScrollViewDelegate {
  var previousContentOffset: CGFloat = 0
  var isTabBarHidden: Bool = false

  private weak var actualDelegate: UIScrollViewDelegate?

  override var delegate: UITableViewDelegate? {
    didSet {
      actualDelegate = delegate
    }
  }




  func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
    previousContentOffset = scrollView.contentOffset.y
    actualDelegate?.scrollViewWillBeginDragging?(scrollView)
  }

  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    guard let mainTabBar = (self.window?.rootViewController as? UITabBarController)?.tabBar as? MainTabBarController else { return }

    let currentContentOffset = scrollView.contentOffset.y

    if currentContentOffset > previousContentOffset   {
      if !isTabBarHidden {
        mainTabBar.setHiddenTabBar(true, animated: true)
        isTabBarHidden = true
      }
    } else {
      if isTabBarHidden {
        mainTabBar.setHiddenTabBar(false, animated: true)
        isTabBarHidden = false
      }
    }

    previousContentOffset = currentContentOffset
    actualDelegate?.scrollViewDidScroll?(scrollView)
  }

  func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
    guard let mainTabBar = (self.window?.rootViewController as? UITabBarController)?.tabBar as? MainTabBarController else { return }
    
    if !isTabBarHidden {
      mainTabBar.setHiddenTabBar(false, animated: true)
    }

    actualDelegate?.scrollViewDidEndDecelerating?(scrollView)

  }


}
