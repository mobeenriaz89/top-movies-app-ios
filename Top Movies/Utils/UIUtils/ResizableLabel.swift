//
//  ResizableLabel.swift
//  Top Movies
//
//  Created by Mubeen Riaz on 16/06/2023.
//

import UIKit

@IBDesignable
class ResizableLabel: UILabel {
    
    @IBInspectable
    @objc var customMinimumFontSize: CGFloat = 12.0 {
        didSet {
            setNeedsLayout()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        adjustFontSizeToFit()
    }
    
    private func adjustFontSizeToFit() {
        guard !text!.isEmpty else { return }
        
        let originalFontSize = font.pointSize
        var fontSize = originalFontSize
        
        let constraintSize = CGSize(width: bounds.width, height: .greatestFiniteMagnitude)
        var attributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: font ?? ""]
        
        while fontSize > customMinimumFontSize {
            attributes[NSAttributedString.Key.font] = font.withSize(fontSize)
            let attributedText = NSAttributedString(string: text!, attributes: attributes)
            
            let textRect = attributedText.boundingRect(with: constraintSize,
                                                       options: [.usesLineFragmentOrigin, .usesFontLeading],
                                                       context: nil)
            
            if textRect.height <= bounds.height {
                break
            }
            
            fontSize -= 1.0
        }
        
        font = font.withSize(fontSize)
    }
    
}
