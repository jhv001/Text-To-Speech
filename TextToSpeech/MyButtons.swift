//
//  MyButtons.swift
//  TextToSpeech
//
//  Created by moDi on 27/5/20.
//  Copyright © 2020 JV. All rights reserved.
//

import UIKit

@IBDesignable class MyButton: UIButton
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

    func updateCornerRadius() {
        layer.cornerRadius = rounded ? frame.size.height / 3 : 0
    }
}
