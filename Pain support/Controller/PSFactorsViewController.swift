//
//  PSFactorsViewController.swift
//  Pain support
//
//  Created by Hyper Stoseven on 3/20/16.
//  Copyright © 2016 Hyper Island. All rights reserved.
//

import UIKit

class PSFactorsViewController: UIViewController {

    
    //collection UIslidervalue
    @IBOutlet weak var dayValue: GradientSlider!
    @IBOutlet weak var nightValue: GradientSlider!
    @IBOutlet weak var eatingValue: GradientSlider!
    @IBOutlet weak var exertionValue: GradientSlider!
    @IBOutlet weak var movingValue: GradientSlider!
    @IBOutlet weak var stressValue: GradientSlider!
    @IBOutlet weak var restingValue: GradientSlider!
    
    
    
    @IBAction func dayValueChange(sender: AnyObject) {
        var dayValueNow = Double(dayValue.value)
        NSUserDefaults.standardUserDefaults().setDouble(dayValueNow , forKey: "day")
    }
    
    @IBAction func nightValueChange(sender: AnyObject) {
        var nightValueNow = Double(nightValue.value)
    NSUserDefaults.standardUserDefaults().setDouble(nightValueNow , forKey: "night")
        
    }
    
    @IBAction func eatingValueChange(sender: AnyObject) {
        var eatingValueNow = Double(eatingValue.value)
        NSUserDefaults.standardUserDefaults().setDouble(eatingValueNow , forKey: "eating")
    }
    
    @IBAction func exertionValueChange(sender: AnyObject) {
        var exertionValueNow = Double(exertionValue.value)
        NSUserDefaults.standardUserDefaults().setDouble(exertionValueNow , forKey: "exertion")
    }
    
    @IBAction func movingValueChange(sender: AnyObject) {
        var movingValueNow = Double(movingValue.value)
        NSUserDefaults.standardUserDefaults().setDouble(movingValueNow , forKey: "moving")
    }
    
    @IBAction func stressValueChange(sender: AnyObject) {
        var stressValueNow = Double(stressValue.value)
        NSUserDefaults.standardUserDefaults().setDouble(stressValueNow , forKey: "stress")
    }
    
    @IBAction func restingValueChange(sender: AnyObject) {
        var restingValueNow = Double(restingValue.value)
        NSUserDefaults.standardUserDefaults().setDouble(restingValueNow , forKey: "resting")
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topNavigation()
        
    }
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
        
        let alertController = UIAlertController(title: "Time", message:
            "Choose what time you started feeling the pain. Be as specific as you can", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    
    // Do any additional setup after loading the view.
    
    @IBAction func previousPressed(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    func hideBackButton(){
        self.navigationItem.setHidesBackButton(true, animated:true);
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
