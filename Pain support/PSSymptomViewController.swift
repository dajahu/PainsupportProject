//
//  PSSymptomViewController.swift
//  Pain support
//
//  Created by Hyper Stoseven on 3/15/16.
//  Copyright © 2016 Hyper Island. All rights reserved.
//

import UIKit

class PSSymptomViewController: UIViewController {
    
    static let symptoms = ["Numb", "Pain", "Swelling", "Weak", "Rasch", "Heat", "Cramps"]
    
    //iboutlets Symptoms
    @IBOutlet weak var btnS1:UIButtonTouched?
    @IBOutlet weak var btnS2:UIButtonTouched?
    @IBOutlet weak var btnS3:UIButtonTouched?
    @IBOutlet weak var btnS4:UIButtonTouched?
    @IBOutlet weak var btnS5:UIButtonTouched?
    @IBOutlet weak var btnS6:UIButtonTouched?
    @IBOutlet weak var btnS7:UIButtonTouched?

    override func viewDidLoad() {
        super.viewDidLoad()
        //Button Status When loaded
        btnS1?.enabledState = false
        btnS2?.enabledState = false
        btnS3?.enabledState = false
        btnS4?.enabledState = false
        btnS5?.enabledState = false
        btnS6?.enabledState = false
        btnS7?.enabledState = false

       
      
        topNavigation()
      
    // Do any additional setup after loading the view.
    }
    
    
    // Buttons Added and saved in NSUserdeafult
    
   
    

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        saveButtonStates()
    }
    
    func saveButtonStates() {
        if btnS1 != nil {
            NSUserDefaults.standardUserDefaults().setBool(btnS1!.enabledState, forKey: "Numb")
        }
        if btnS2 != nil {
            NSUserDefaults.standardUserDefaults().setBool(btnS2!.enabledState, forKey: "Pain")
        }
        if btnS3 != nil {
            NSUserDefaults.standardUserDefaults().setBool(btnS3!.enabledState, forKey: "Swelling")
        }
        if btnS4 != nil {
            NSUserDefaults.standardUserDefaults().setBool(btnS4!.enabledState, forKey: "Weak")
        }
        if btnS5 != nil {
            NSUserDefaults.standardUserDefaults().setBool(btnS5!.enabledState, forKey: "Rasch")
        }
        if btnS6 != nil {
            NSUserDefaults.standardUserDefaults().setBool(btnS6!.enabledState, forKey: "Heat")
        }
        if btnS7 != nil {
            NSUserDefaults.standardUserDefaults().setBool(btnS7!.enabledState, forKey: "Cramps")
        }
        
        
        
    }
    
    // End

    
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
