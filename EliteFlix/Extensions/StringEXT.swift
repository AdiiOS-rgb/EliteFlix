//
//  StringEXT.swift
//  EliteFlix
//
//  Created by Adityakumar Ramnuj on 03/11/23.
//

import Foundation
import UIKit
extension String {
    func convertDateFormat(from: String, to: String) -> String {
        let fromFormatter = DateFormatter()
        fromFormatter.dateFormat = from
        guard let date = fromFormatter.date(from: self) else {
            return "No Date"
        }
        let toFormatter = DateFormatter()
        toFormatter.dateFormat = to
        return toFormatter.string(from: date)
    }
    
}

extension UILabel {
    func leftImageText(image: UIImage?, text: String) {
        guard let image = image else {
            self.text = text
            return
        }
        let attachment = NSTextAttachment()
        attachment.image = image
        
        let attachmentString = NSAttributedString(attachment: attachment)
        let mutableAttributedString = NSMutableAttributedString()
        mutableAttributedString.append(attachmentString)
        mutableAttributedString.append(NSAttributedString(string: "\t"))
        
        let string = NSMutableAttributedString(string: text, attributes: [:])
        mutableAttributedString.append(string)
        self.attributedText = mutableAttributedString
    }
    
    func rightImageText(image: UIImage?, text: String) {
        guard let image = image else {
            self.text = text
            return
        }
        let attachment = NSTextAttachment()
        attachment.image = image
        
        let attachmentString = NSAttributedString(attachment: attachment)
        let string = NSMutableAttributedString(string: text, attributes: [:])
        string.append(NSAttributedString(string: "\t"))
        
        string.append(attachmentString)
        self.attributedText = string
    }
}
