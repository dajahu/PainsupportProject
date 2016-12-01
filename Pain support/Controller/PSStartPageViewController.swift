//
//  PSStartPageViewController.swift
//  Pain support
//
//  Created by Hyper Stoseven on 3/15/16.
//  Copyright © 2016 Hyper Island. All rights reserved.
//

import UIKit

class PSStartPageViewController: UIViewController {
    @IBOutlet weak var lowerMenu: UITabBar!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        removeNSUserDefault()
    }
    
    
    func removeNSUserDefault(){
        NSUserDefaults.standardUserDefaults().removePersistentDomainForName(NSBundle.mainBundle().bundleIdentifier!)
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
