//
//  ExtUIView.swift
//  ProjectPertama
//
//  Created by Macbook on 19/02/24.
//

import Foundation
import UIKit

extension UIView {

  func setUp(to superView: UIView) {
    translatesAutoresizingMaskIntoConstraints = false
    topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
    leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive = true
    bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
    trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive = true
  }

  func setGradient(withColors colors: [CGColor] , startPoint: CGPoint , endPoint: CGPoint) {
    let gradient: CAGradientLayer = CAGradientLayer()
    gradient.colors = colors
    gradient.startPoint = startPoint
    gradient.endPoint = endPoint
    gradient.frame = CGRect(x: 0.0, y: 0.0, width: self.frame.size.width, height: self.frame.size.height)
    self.layer.insertSublayer(gradient, at: 0)
  }

  func makeCornerRadius(_ radius: CGFloat, maskedCorner: CACornerMask?) {
    layer.cornerRadius = radius
    layer.maskedCorners = maskedCorner ?? [.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMinXMinYCorner]
    clipsToBounds = true
  }

  func addBorderLine(width: CGFloat = 1,
                     color: UIColor = .gray) {
    layer.borderWidth = width
    layer.borderColor = color.cgColor
  }

  func addShadow(color: UIColor = .black,
                 offset: CGSize = CGSize(width: 0, height: 3),
                 opacity: Float = 0.5,
                 radius: CGFloat = 2,
                 path: UIBezierPath? = nil) {
    layer.shadowColor = color.cgColor
    layer.shadowOffset = offset
    layer.shadowOpacity = opacity
    layer.shadowRadius = radius
    layer.shadowPath = path?.cgPath
    layer.shouldRasterize = true
    layer.rasterizationScale = UIScreen.main.scale
  }

  public func loadNib() -> UIView {
    let bundle = Bundle(for: type(of: self))
    let nibName = type(of: self).description().components(separatedBy: ".").last!
    let nib = UINib(nibName: nibName, bundle: bundle)
    return nib.instantiate(withOwner: self, options: nil).first as? UIView ?? UIView()
  }


  public func setGradientView()  {
    layer.cornerRadius = 20 // Sesuaikan dengan radius yang Anda inginkan

    // Mengatur bayangan (shadow)
    layer.shadowColor = UIColor.black.cgColor
    layer.shadowOffset = CGSize(width: 0, height: 2) // Arah bayangan (x, y)
    layer.shadowOpacity = 0.5 // Opasitas bayangan
    layer.shadowRadius = 4 // Radius bayangan
    layer.masksToBounds = false // Menonaktifkan pemotongan bayangan

    // Atur juga beberapa properti untuk memberi kesan 3D yang lebih baik
    layer.borderWidth = 1
    layer.borderColor = UIColor.clear.cgColor
  }

}



struct windowConstant {

  private static let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first

  static var getTopPadding: CGFloat {
    return window?.safeAreaInsets.top ?? 0
  }

  static var getBottomPadding: CGFloat {
    return window?.safeAreaInsets.bottom ?? 0
  }

}


extension NSTextAttachment {
  func setImageHeight(height: CGFloat) {
    guard let image = image else { return }
    let ratio = image.size.width / image.size.height

    bounds = CGRect(x: bounds.origin.x, y: bounds.origin.y, width: ratio * height, height: height)
  }
}

extension UIButton {

  func setButtonTitleWithLeftImage(title: String, btnImage: String , customFont: UIFont , color: UIColor, imageColor: UIColor , imageSize: CGFloat, isImageOriginal: Bool = false) {
    let attributedText = NSMutableAttributedString(string:"" , attributes:[NSAttributedString.Key.font: customFont, NSAttributedString.Key.foregroundColor: color])

    let font = customFont
    var Img = UIImage()
    if isImageOriginal {
      Img = UIImage(named: btnImage)!
    } else {
      Img = (UIImage(named: btnImage)?.withRenderingMode(.alwaysTemplate).withTintColor(imageColor))!
    }
    let Image = NSTextAttachment()
    Image.image = Img
    Image.bounds = CGRect(x: 0, y: (font.capHeight - imageSize).rounded() / 2, width: imageSize, height: imageSize)
    Image.setImageHeight(height: imageSize)
    let imgString = NSAttributedString(attachment: Image)
    attributedText.append(imgString)

    attributedText.append(NSAttributedString(string: " \(title)", attributes: [NSAttributedString.Key.font: customFont, NSAttributedString.Key.foregroundColor: color]))

    self.setAttributedTitle(attributedText, for: .normal)
  }


  func setButtonTitleWithRightImage(title: String, btnImage: String , customFont: UIFont , color: UIColor, imageColor: UIColor ,imageSize: CGFloat, isImageOriginal: Bool = false) {
    let attributedText = NSMutableAttributedString(string:"\(title) " , attributes:[NSAttributedString.Key.font: customFont, NSAttributedString.Key.foregroundColor: color])

    let font = customFont
    var Img = UIImage()
    if isImageOriginal {
      Img = UIImage(named: btnImage)!
    } else {
      Img = (UIImage(named: btnImage)?.withRenderingMode(.alwaysTemplate).withTintColor(imageColor))!
    }
    let Image = NSTextAttachment()
    Image.image = Img
    Image.bounds = CGRect(x: 0, y: (font.capHeight - imageSize).rounded() / 2, width: imageSize, height: imageSize)
    Image.setImageHeight(height: imageSize)
    let imgString = NSAttributedString(attachment: Image)
    attributedText.append(imgString)

    self.setAttributedTitle(attributedText, for: .normal)
  }

}

// MARK: - Gesture Extension UIView
extension UIView {
  func addTapGestureTarget(_ target: Any?, action: Selector) {
      let tapGesture = UITapGestureRecognizer(target: target, action: action)
      self.isUserInteractionEnabled = true
      self.addGestureRecognizer(tapGesture)
  }

  typealias TapAction = () -> Void
  func addTapGestureAction(_ action: @escaping TapAction) {
      isUserInteractionEnabled = true
      let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleGesture(_:)))
      addGestureRecognizer(tapGestureRecognizer)
      objc_setAssociatedObject(self, UnsafeRawPointer(bitPattern: "TapAction".hashValue)!, action, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
  }

  @objc private func handleGesture(_ sender: UITapGestureRecognizer) {
      if let action = objc_getAssociatedObject(self, UnsafeRawPointer(bitPattern: "TapAction".hashValue)!) as? TapAction {
          action()
      }
  }

  func addSwipeGesture(_ target: Any?, action: Selector) {
    let swipeGesture = UISwipeGestureRecognizer(target: target, action: action)
    swipeGesture.direction = .left
    self.addGestureRecognizer(swipeGesture)
  }

  typealias PanAction = (UIPanGestureRecognizer) -> Void
  func addPanGetureAction(_ action: @escaping PanAction) {
    let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
    self.addGestureRecognizer(panGesture)
    objc_setAssociatedObject(self, UnsafeRawPointer(bitPattern: "PanAction".hashValue)!, action, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
  }

  @objc private func handlePan(_ sender: UIPanGestureRecognizer) {
      if let action = objc_getAssociatedObject(self, UnsafeRawPointer(bitPattern: "PanAction".hashValue)!) as? PanAction {
          action(sender)
      }
  }


}
