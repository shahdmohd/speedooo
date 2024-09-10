//
//  MoreProfileVC.swift
//  speedoTransfer
//
//  Created by 1234 on 08/09/2024.
//

import UIKit

class MoreProfileVC: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundColor(to: self.view)
    }

    // MARK: - BackGround Color
    public func backgroundColor(to view: UIView) {
        let gradientColor = UIColor.bankMasrGradient(frame: view.bounds)
        view.layer.addSublayer(gradientColor)
        view.layer.insertSublayer(gradientColor, at: 0)
    }
}

// UIColor extension for hex colors
extension UIColor {
    // Hex initializer
    convenience init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        let r = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let g = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let b = CGFloat(rgb & 0x0000FF) / 255.0

        self.init(red: r, green: g, blue: b, alpha: 1.0)
    }
    
    // Static method to get the bankMasr gradient
    static func bankMasrGradient(frame: CGRect) -> CAGradientLayer {
        let gradientColor = CAGradientLayer()
        gradientColor.frame = frame
        
        // Define the two colors for bankMasr
        gradientColor.colors = [
            UIColor(hex: "#FFF8E7").cgColor,  // Light Yellow
            UIColor(hex: "#FFEAEE").cgColor   // Soft Pink
        ]
        
        return gradientColor
    }
}
