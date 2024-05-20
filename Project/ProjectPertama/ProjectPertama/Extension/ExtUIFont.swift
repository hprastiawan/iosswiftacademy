//
//  ExtUIFont.swift
//  ProjectPertama
//
//  Created by Macbook on 29/04/24.
//

import Foundation
import UIKit

extension UIFont {

    static func ftBold(_ size: CGFloat) -> UIFont {
        return UIFont(
            name: "OpenSans-Bold",
            size: size) ?? .systemFont(ofSize: size)
    }

    static func ftBoldItalic(_ size: CGFloat) -> UIFont {
        return UIFont(
            name: "OpenSans-BoldItalic",
            size: size) ?? .systemFont(ofSize: size)
    }

    static func ftCondBold(_ size: CGFloat) -> UIFont {
        return UIFont(
            name: "OpenSans-CondBold",
            size: size) ?? .systemFont(ofSize: size)
    }

    static func ftCondLight(_ size: CGFloat) -> UIFont {
        return UIFont(
            name: "OpenSans-CondLight",
            size: size) ?? .systemFont(ofSize: size)
    }

    static func ftCondLightItalic(_ size: CGFloat) -> UIFont {
        return UIFont(
            name: "OpenSans-CondLightItalic",
            size: size) ?? .systemFont(ofSize: size)
    }

    static func ftExtraBold(_ size: CGFloat) -> UIFont {
        return UIFont(
            name: "OpenSans-ExtraBold",
            size: size) ?? .systemFont(ofSize: size)
    }

    static func ftExtraBoldItalic(_ size: CGFloat) -> UIFont {
        return UIFont(
            name: "OpenSans-ExtraBoldItalic",
            size: size) ?? .systemFont(ofSize: size)
    }

    static func ftItalic(_ size: CGFloat) -> UIFont {
        return UIFont(
            name: "OpenSans-Italic",
            size: size) ?? .systemFont(ofSize: size)
    }

    static func ftLight(_ size: CGFloat) -> UIFont {
        return UIFont(
            name: "OpenSans-Light",
            size: size) ?? .systemFont(ofSize: size)
    }

    static func ftLightItalic(_ size: CGFloat) -> UIFont {
        return UIFont(
            name: "OpenSans-LightItalic",
            size: size) ?? .systemFont(ofSize: size)
    }

    static func ftRegular(_ size: CGFloat) -> UIFont {
        return UIFont(
            name: "OpenSans-Regular",
            size: size) ?? .systemFont(ofSize: size)
    }

    static func ftSemiBold(_ size: CGFloat) -> UIFont {
        return UIFont(
            name: "OpenSans-SemiBold",
            size: size) ?? .systemFont(ofSize: size)
    }

    static func ftSemiBoldItalic(_ size: CGFloat) -> UIFont {
        return UIFont(
            name: "OpenSans-SemiBoldItalic",
            size: size) ?? .systemFont(ofSize: size)
    }

}
