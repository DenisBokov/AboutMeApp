//
//  Extention + UIView.swift
//  AboutMeApp
//
//  Created by Denis Bokov on 19.06.2024.
//

import UIKit

extension UIView {
    func addVerticalGadientLayer() {
        let firstColor = UIColor(red: 232/255, green: 224/255, blue: 37/255, alpha: 1)
        let secondColor = UIColor(red: 255/255, green: 135/255, blue: 117/255, alpha: 1)
        let thirdColor = UIColor(red: 190/255, green: 123/255, blue: 174/255, alpha: 1)
        
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [firstColor.cgColor, secondColor.cgColor, thirdColor.cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        layer.insertSublayer(gradient, at: 0)
    }
}
