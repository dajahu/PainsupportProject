//
//  SideUIButton.swift
//  Body
//
//  Created by Arnolds on 21/03/16.
//  Copyright © 2016 ATTR. All rights reserved.
//

import UIKit

@IBDesignable class SideUIButton: UIButton {

    override func drawRect(rect: CGRect) {
        self.layer.borderColor = UIColor(red: 0, green: 0.741, blue: 0.718, alpha: 1).CGColor
        self.layer.borderWidth = 2
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let body = Body(name: "front");
        body.transform = CGAffineTransformMakeScale( 0.2 , 0.2);
        body.contentScaleFactor = 0.2;
        body.setNeedsDisplay()
        self.addSubview(body)
        
    }
    

}
