//
//  UIButtonTouched.swift
//  ButtonSelf
//
//  Created by David Hultgren on 2016-03-15.
//  Copyright © 2016 ThePainSquad. All rights reserved.
//

import UIKit
@IBDesignable
class UIButtonTouched: UIButton {

    @IBInspectable var enabledState: Bool = false
    @IBInspectable  var labelName:String = ""
    
    
        // Only override drawRect: if you perform custom drawing.
        // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
            // Drawing code
            if enabledState {
                Circle.drawCircleFilled(label: self.labelName)
                //print(self.labelName)
            } else {
                Circle.drawCircleEmpty(label: self.labelName)
            }
            
    }
    
  
   
    
    
    
    
    
    
        func onClick(recognizer: UITapGestureRecognizer) {
            enabledState = !enabledState
            print("Enabled: \(enabledState)")
            //setNeedsDisplay triggar drawRect
           setNeedsDisplay()
            
        }
    
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

         required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            
            // Double tap
            let doubleTapRecognizer = UITapGestureRecognizer(target: self, action: "onClick:")
            doubleTapRecognizer.numberOfTapsRequired = 1
            doubleTapRecognizer.numberOfTouchesRequired = 1
            self.addGestureRecognizer(doubleTapRecognizer)
    
        }
}