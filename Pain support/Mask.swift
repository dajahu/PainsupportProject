//
//  Masks.swift
//  Body
//
//  Created by Arnolds on 18/03/16.
//  Copyright © 2016 ATTR. All rights reserved.
//

import UIKit

class Mask: UIView {
    let name: String?
    
    init(name:String){
        self.name = name
        super.init(frame: CGRectMake(0, 0, 149, 546))
        self.opaque = false
    }
    
    override func drawRect(rect: CGRect) {
        switch self.name!{
            case "front":
                BodyAssets.drawMaleFrontMask()
            case "back":
                BodyAssets.drawMaleBackMask()
            case "side":
                BodyAssets.drawMaleSideMask()
            default:
                fatalError("drawRect() Not supported mask name")
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
