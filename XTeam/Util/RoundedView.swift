//
//  RoundedView.swift
//  XTeam
//
//  Created by paly on 12/11/19.
//  Copyright © 2019 paly. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedView: UIView {
    
    @IBInspectable
    var topCornersRounded: Bool = false {
        didSet {
            if self.topCornersRounded {
                layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
            }
        }
    }
    
    @IBInspectable
    var bottomCornersRounded: Bool = false {
        didSet {
            if self.bottomCornersRounded {
                layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
            }
        }
    }
    
    @IBInspectable
    var allCornerRounded: Bool = false {
        didSet {
            if self.allCornerRounded {
                layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner]
            }
        }
    }
    
    @IBInspectable
    var cornerRad: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRad
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        clipsToBounds = true
        topCornersRounded = false
        bottomCornersRounded = false
        allCornerRounded = false
    }
    
    private var theShadowLayer: CAShapeLayer?

}

/*
 
 private var shadowLayer: CAShapeLayer!
 private var cornerRadius: CGFloat = 25.0
 private var fillColor: UIColor = .blue // the color applied to the shadowLayer, rather than the view's backgroundColor
 
 override func layoutSubviews() {
 super.layoutSubviews()
 
 if shadowLayer == nil {
 shadowLayer = CAShapeLayer()
 
 shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
 shadowLayer.fillColor = fillColor.cgColor
 
 shadowLayer.shadowColor = UIColor.black.cgColor
 shadowLayer.shadowPath = shadowLayer.path
 shadowLayer.shadowOffset = CGSize(width: 0.0, height: 1.0)
 shadowLayer.shadowOpacity = 0.2
 shadowLayer.shadowRadius = 3
 
 layer.insertSublayer(shadowLayer, at: 0)
 }
 }
 view rawAddShadowAndRoundedCorners.swift hosted with ❤ by GitHub
 */
