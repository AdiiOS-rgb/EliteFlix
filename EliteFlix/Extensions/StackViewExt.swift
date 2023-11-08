//
//  StackViewExt.swift
//  EliteFlix
//
//  Created by Adityakumar Ramnuj on 07/11/23.
//

import Foundation
import UIKit

extension UIStackView {
    func createStarView(total: Int = 5, full: Int = 3, half: Int = 1) {
        arrangedSubviews.forEach { view in
            removeArrangedSubview(view)
        }
        axis = .horizontal
        spacing = 5
        alignment = .center

        for _ in 0..<full {
            let fillStarView =  UIImageView(image: UIImage(systemName: "star.fill")?.resized(to: CGSize(width: 18, height: 18), color: .systemRed))
            addArrangedSubview(fillStarView)
        }
        for _ in full..<full + half {
            let fillStarView =  UIImageView(image: UIImage(systemName: "star.leadinghalf.filled")?.resized(to: CGSize(width: 18, height: 18), color: .systemRed))
            addArrangedSubview(fillStarView)
        }
        for _ in full + half..<total {
            let emptyStarView = UIImageView(image: UIImage(systemName: "star")?.resized(to: CGSize(width: 18, height: 18), color: .systemRed))
            addArrangedSubview(emptyStarView)
        }
    }
}

extension UIView {
    func Button(title: String? = nil, color: UIColor, font: UIFont, width: CGFloat? = nil, backgrounColor: UIColor = .clear) -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(title, for: .normal)
        button.setTitleColor(color, for: .normal)
        button.titleLabel?.font = font
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        button.backgroundColor =  backgrounColor
        button.titleLabel?.numberOfLines = 1
        button.titleLabel?.textAlignment = .center
        
        guard let width = width else { return button }
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: width)
        ])
        return button
    }
}

struct ColorTheme {
    static let ShadowColor: UIColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25)
    static let TabBarColor: UIColor = UIColor(red: 0.656, green: 0.706, blue: 0.879, alpha: 1)
    static let DarkVioletColor: UIColor = UIColor.hexToColor(hexcode: "#8B0000")
}
extension UIColor {
    static func hexToColor(hexcode: String) -> UIColor {
        var hexSanitized = hexcode.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        
        var rgb: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgb)
        
        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0
        
        return UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
}

extension UIImage {
    func resized(to size: CGSize, color: UIColor = .white) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        defer { UIGraphicsEndImageContext() }
        color.set()
        withRenderingMode(.alwaysTemplate).draw(in: CGRect(origin: .zero, size: size))
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}
