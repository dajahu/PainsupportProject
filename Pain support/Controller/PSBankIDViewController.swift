//
//  PSBankIDViewController.swift
//  Pain support
//
//  Created by Hyper Stoseven on 3/16/16.
//  Copyright © 2016 Hyper Island. All rights reserved.
//

import UIKit

class PSBankIDViewController: UIViewController {
    
    var timer = NSTimer()
    var counter = 2

    override func viewDidLoad() {
        super.viewDidLoad()
        startTimer()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func startTimer() {
        
        
        self.timer = NSTimer.scheduledTimerWithTimeInterval(0.4, target:self, selector: Selector("updateCounter"), userInfo: nil, repeats: true)
    }
    
    func updateCounter() {
        
        
        if(counter == 0) {
             performSegueWithIdentifier("Login", sender: nil)
        }
        counter--
        
    }
    
   

   
}
