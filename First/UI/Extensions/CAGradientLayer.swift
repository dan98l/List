//
//  CAGradientLayer.swift
//  First
//
//  Created by Daniil G on 28.03.2021.
//

import UIKit

extension CAGradientLayer {

    func backgroundGradientColor() -> CAGradientLayer {
        let topColor = UIColor(red: (0/255.0), green: (0/255.0), blue:(0/255.0), alpha: 1)
        let bottomColor = UIColor(red: (75/255.0), green: (75/255.0), blue:(75/255.0), alpha: 1)

        let gradientColors: [CGColor] = [topColor.cgColor, bottomColor.cgColor]
        let gradientLocations: [NSNumber] = [0.0, 0.0, 1.0, 1.0]

        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColors
        gradientLayer.locations = gradientLocations

        return gradientLayer
    }
}
