//
//  ext+String.swift
//  PokeAPI
//
//  Created by Marilise Morona on 08/02/23.
//

import Foundation

extension String{
    
    func htmlForFontWith(size: Int, color: String, align: EnumTextAlign = .center) -> String {
        return "<div style=\" font-size: \(String(size))px; text-align: \(align.rawValue); font-family: '\(Fonts.rajRegular)'; color:\(color) \">\(self)</div>"
    }
    
    var html2AttributedString: NSAttributedString? {
        guard
            let data = data(using: .utf8)
            else { return nil }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html,
                                                                .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil).trailingNewlineChopped
        } catch let error as NSError {
            print(error)
            return  nil
        }
    }
    
}

extension NSAttributedString {
    var trailingNewlineChopped: NSAttributedString {
        if string.hasSuffix("\n") {
            return self.attributedSubstring(from: NSRange(location: 0, length: length - 1))
        } else {
            return self
        }
    }
}

enum EnumTextAlign:String {
    case center = "center"
    case left = "left"
    case right = "right"
}
