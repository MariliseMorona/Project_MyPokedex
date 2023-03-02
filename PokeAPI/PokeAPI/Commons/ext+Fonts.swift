//
//  ext+Fonts.swift
//  PokeAPI
//
//  Created by Marilise Morona on 08/02/23.
//

import UIKit

extension UIFont {
    
    enum FontType {
        case rajBold
        case rajLight
        case rajMedium
        case rajRegular
        case rajSemiBold
        
        func getFontName() -> String {
            switch self {
            case .rajBold:
                return "Rajdhani-Bold"
            case .rajLight:
                return "Rajdhani-Light"
            case .rajMedium:
                return "Rajdhani-Medium"
            case .rajRegular:
                return "Rajdhani-Regular"
            case .rajSemiBold:
                return "Rajdhani-SemiBold"
            }
        }
    }
            
    static func customFont(type: FontType, size: CGFloat) -> UIFont {
        guard let font = UIFont(name: type.getFontName(), size: size) else { return UIFont.systemFont(ofSize: size) }
        return font
    }
}
