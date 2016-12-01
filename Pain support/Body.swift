//
//  Body.swift
//  Body
//
//  Created by Arnolds on 18/03/16.
//  Copyright © 2016 ATTR. All rights reserved.
//

import UIKit

class Body: UIView {
    let name: String?
    var imageview: UIImageView!
    
    init(name:String){
        self.name = name
        super.init(frame: CGRectMake(0, 0, 149, 546))
        self.opaque = false
        
        // Add drawing views
        imageview = UIImageView(frame: self.frame.integral)
        self.addSubview(imageview);
        
        // Add mask
        let mask = Mask(name: name)
        self.addSubview(mask)
        self.layer.mask = mask.layer
    }
    
    override func drawRect(rect: CGRect) {
        switch self.name!{
            case "front":
                BodyAssets.drawMaleFront()
            case "back":
                BodyAssets.drawMaleBack()
            case "side":
                BodyAssets.drawMaleSide()
            default:
                fatalError("drawRect() Not supported mask name")
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
