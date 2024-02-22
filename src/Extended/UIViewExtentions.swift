//
//  UIViewExtentions.swift
//  Test Album
//
//  Created by saeid on 8/30/22.
//

import UIKit

extension UIView {
    
    /// add multiple subviews
    func addSubviews(_ views: UIView...) {
        views.forEach { currentView in
            self.addSubview(currentView)
        }
    }
    
    /// add corner radius and boarder
    func setCornerRadiusAndBoarder(_ isHaveCornerRadius: Bool = false, cornerRadius: Double = 5,
                                   _ isHaveBoarder: Bool = false,
                                   borderWidth: Double = 0.5,
                                   borderColor: UIColor = .black){
        if isHaveCornerRadius{
            self.layer.cornerRadius = cornerRadius
        }
        
        if isHaveBoarder {
            self.layer.borderWidth = borderWidth
            self.layer.borderColor = borderColor.cgColor
        }
        self.layer.masksToBounds = true
    }
}
