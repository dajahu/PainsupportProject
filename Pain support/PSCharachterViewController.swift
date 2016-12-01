//
//  PSCharachterViewController.swift
//  Pain support
//
//  Created by Hyper Stoseven on 3/17/16.
//  Copyright © 2016 Hyper Island. All rights reserved.
//

import UIKit

class PSCharachterViewController: UIViewController {
    
    static let characters = ["Throbbing", "Cutting", "Pressing", "Dull", "Stabbing", "Pounding", "Blistering"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //Button Status When loaded
        btnC1?.enabledState = false
        btnC2?.enabledState = false
        btnC3?.enabledState = false
        btnC4?.enabledState = false
        btnC5?.enabledState = false
        btnC6?.enabledState = false
        btnC7?.enabledState = false
        
        
        
        topNavigation()
        
        // Do any additional setup after loading the view.
    }
    
    // Buttons Added and saved in NSUserdeafult
    
    @IBOutlet weak var btnC1:UIButtonTouched?
    @IBOutlet weak var btnC2:UIButtonTouched?
    @IBOutlet weak var btnC3:UIButtonTouched?
    @IBOutlet weak var btnC4:UIButtonTouched?
    @IBOutlet weak var btnC5:UIButtonTouched?
    @IBOutlet weak var btnC6:UIButtonTouched?
    @IBOutlet weak var btnC7:UIButtonTouched?
    
        override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
            saveButton2States()
        }

        private func saveButton2States() {
            if btnC1 != nil {
                NSUserDefaults.standardUserDefaults().setBool(btnC1!.enabledState, forKey: "Throbbing")
            }
            if btnC2 != nil {
                NSUserDefaults.standardUserDefaults().setBool(btnC2!.enabledState, forKey: "Cutting")
            }
            if btnC3 != nil {
                NSUserDefaults.standardUserDefaults().setBool(btnC3!.enabledState, forKey: "Pressing")
            }
            if btnC4 != nil {
                NSUserDefaults.standardUserDefaults().setBool(btnC4!.enabledState, forKey: "Dull")
            }
            if btnC5 != nil {
                NSUserDefaults.standardUserDefaults().setBool(btnC5!.enabledState, forKey: "Stabbing")
            }
            if btnC6 != nil {
                NSUserDefaults.standardUserDefaults().setBool(btnC6!.enabledState, forKey: "Pounding")
            }
            if btnC7 != nil {
                NSUserDefaults.standardUserDefaults().setBool(btnC7!.enabledState, forKey: "Blistering")
            }
            
            
            
        }
    
     //End

    
    
    
    override func viewDidAppear(animated: Bool) {
        hideBackButton()
    }
    
    func topNavigation(){
        //http://stackoverflow.com/questions/30022780/swiftuibarbuttonitem-in-navigation-bar-programmatically
        //Set image for
        let rightBtnName = UIButton()
        rightBtnName.setImage(UIImage(named: "ic_help"), forState: .Normal)
        rightBtnName.frame = CGRectMake(0, 0, 48, 16)
        rightBtnName.addTarget(self, action: Selector("helpPressed"), forControlEvents: .TouchUpInside)
        
        
        
        let leftBtnName = UIButton()
        leftBtnName.setImage(UIImage(named: "ic_cancel"), forState: .Normal)
        leftBtnName.frame = CGRectMake(0, 0, 69, 16)
        leftBtnName.addTarget(self, action: Selector("closePressed"), forControlEvents: .TouchUpInside)
        
        //.... Set Right/Left Bar Button item
        let rightBarButton = UIBarButtonItem()
        rightBarButton.customView = rightBtnName
        self.navigationItem.rightBarButtonItem = rightBarButton
        
        
        
        //.... Set Right/Left Bar Button item
        let leftBarButton = UIBarButtonItem()
        leftBarButton.customView = leftBtnName
        self.navigationItem.leftBarButtonItem = leftBarButton
    }
    
    func closePressed() {
        navigationController?.popToRootViewControllerAnimated(true)
    }
    
    func helpPressed() {
        
        let alertController = UIAlertController(title: "Symptoms", message:
            "Choose one or several symptons that best describes your pain", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    
 
    
    
    
    @IBAction func previousPressed(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func hideBackButton(){
        self.navigationItem.setHidesBackButton(true, animated:true);
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
