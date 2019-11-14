//
//  BlurredView.swift
//  XTeam
//
//  Created by paly on 12/11/19.
//  Copyright © 2019 paly. All rights reserved.
//

import UIKit

@IBDesignable
class BlurredView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpView()
    }
    
    @IBInspectable
    var cornerRad: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRad
        }
    }
    
    private let blur = UIBlurEffect(style: .light)
    private var blurView: UIVisualEffectView?
    
    
    private func setUpView() {
        blurView = UIVisualEffectView(effect: blur)
        if let blurView = blurView {
            self.addSubview(blurView)
            self.sendSubviewToBack(blurView)
        }
        self.clipsToBounds = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        blurView?.frame = self.bounds
    }
}

