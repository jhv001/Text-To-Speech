//
//  MyTextView.swift
//  TextToSpeech
//
//  Created by moDi on 25/6/20.
//  Copyright © 2020 JV. All rights reserved.
//

import UIKit

@IBDesignable class MyTextView: UITextView
{

    override func layoutSubviews() {
        super.layoutSubviews()
        
        updateCornerRadius()
    }

    @IBInspectable var rounded: Bool = false {
        didSet {
            updateCornerRadius()
        }
    }
    
    @IBInspectable var radius: CGFloat = 0.0 {
        didSet {
            updateCornerRadius()
        }
    }

    func updateCornerRadius() {
        layer.cornerRadius = rounded ? radius : 0
    }

}
