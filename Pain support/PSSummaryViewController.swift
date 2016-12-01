//
//  PSSummaryViewController.swift
//  Pain support
//
//  Created by Hyper Stoseven on 3/15/16.
//  Copyright © 2016 Hyper Island. All rights reserved.
//

import UIKit

extension UIImage {
    convenience init(view: UIView) {
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.opaque, 0.0)
        view.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.init(CGImage: image.CGImage!)
    }
}

class PSSummaryViewController: UIViewController {
    
    //sympton and character label connection
    @IBOutlet weak var symptomLabel: UILabel!
    @IBOutlet weak var characterLabel: UILabel!
  
    //Factors
    @IBOutlet weak var dayValueSummerize: UILabel!
    @IBOutlet weak var nightValueSummerize: UILabel!
    @IBOutlet weak var eatingValueSummerize: UILabel!
    @IBOutlet weak var exertionValueSummerize: UILabel!
    @IBOutlet weak var movingValueSummerize: UILabel!
    @IBOutlet weak var stressValueSummerize: UILabel!
    @IBOutlet weak var restingValueSummerize: UILabel!
    @IBOutlet weak var evolveValueSummerize: UILabel!
    
    // Time controller
    @IBOutlet weak var timeValue: UILabel!
    
    
    //body
    @IBOutlet weak var bodyViewHolder:UIView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        topNavigation()
        let snapshot = UIImageView(image: UIImage(view: PSDiscomfortViewController.bodyView))
        var frame = bodyViewHolder.frame
        frame.origin = CGPointZero
        snapshot.frame = frame
        snapshot.contentMode = UIViewContentMode.ScaleAspectFit
        
        bodyViewHolder.addSubview(snapshot)
        
        // Do any additional setup after loading the view.
        
        //Adding Factors
        var day = (NSUserDefaults.standardUserDefaults().doubleForKey("day"))
        day = Double(round(1000*day)/1000)
        print("day" ," \(day)")
        if day <= 0.43 {
            self.dayValueSummerize.text = "Better"
        }  else if day >= 0.57 {
            self.dayValueSummerize.text = "Worse"
        } else  {
            self.dayValueSummerize.text = "No Change / Little change"
        }
        
        //Adding Factors
        var night = (NSUserDefaults.standardUserDefaults().doubleForKey("night"))
        night = Double(round(1000*night)/1000)
        print("night" ," \(night)")
        if night <= 0.43 {
            self.nightValueSummerize.text = "Better"
        }  else if day >= 0.57 {
            self.nightValueSummerize.text = "Worse"
        } else  {
            self.nightValueSummerize.text = "No Change / Little change"
        }
        
        
        
        var eating = (NSUserDefaults.standardUserDefaults().doubleForKey("eating"))
        eating = Double(round(1000*eating)/1000)
        print("eating" ," \(eating)")
        if eating <= 0.43 {
            self.eatingValueSummerize.text = "Better"
        }  else if eating >= 0.57 {
            self.eatingValueSummerize.text = "Worse"
        } else  {
            self.eatingValueSummerize.text = "No Change / Little change"
        }
        
        var exertion = (NSUserDefaults.standardUserDefaults().doubleForKey("exertion"))
        exertion = Double(round(1000*exertion)/1000)
        print("exertion" ," \(exertion)")
        if exertion <= 0.43 {
            self.exertionValueSummerize.text = "Better"
        }  else if exertion >= 0.57 {
            self.exertionValueSummerize.text = "Worse"
        } else  {
            self.exertionValueSummerize.text = "No Change / Little change"
        }
        
        
        var moving = (NSUserDefaults.standardUserDefaults().doubleForKey("moving"))
        moving = Double(round(1000*moving)/1000)
        print("moving" ," \(moving)")
        if moving <= 0.43 {
            self.movingValueSummerize.text = "Better"
        }  else if moving >= 0.57 {
            self.movingValueSummerize.text = "Worse"
        } else  {
            self.movingValueSummerize.text = "No Change / Little change"
        }

        
        var stress = (NSUserDefaults.standardUserDefaults().doubleForKey("stress"))
        stress = Double(round(1000*stress)/1000)
        print("stress" ," \(stress)")
        if stress <= 0.43 {
            self.stressValueSummerize.text = "Better"
        }  else if stress >= 0.57 {
            self.stressValueSummerize.text = "Worse"
        } else  {
            self.stressValueSummerize.text = "No Change / Little change"
        }
        
        var resting = (NSUserDefaults.standardUserDefaults().doubleForKey("resting"))
        resting = Double(round(1000*resting)/1000)
        print("resting" ," \(resting)")
        if resting <= 0.43 {
            self.restingValueSummerize.text = "Better"
        }  else if resting >= 0.57 {
            self.restingValueSummerize.text = "Better"
        } else  {
            self.restingValueSummerize.text = "No Change / Little change"
        }
        
        //Evolve setup
        
        var evolve = (NSUserDefaults.standardUserDefaults().doubleForKey("evolve"))
        evolve = Double(round(1000*resting)/1000)
        print("evolve" ," \(evolve)")
        if evolve <= 0.43 {
            self.evolveValueSummerize.text = "Better"
        }  else if evolve >= 0.57 {
            self.evolveValueSummerize.text = "Worse"
        } else  {
            self.evolveValueSummerize.text = "No Change / Little change"
        }
        
        // End
        
        
        //adding the symptom
        
        symptomLabel.text = ""
        for symptom in PSSymptomViewController.symptoms {
            //Adding printout for the symptoms
            if NSUserDefaults.standardUserDefaults().boolForKey(symptom) == true {
                //1. Check if current label is empty
                //2. true -> do nothing (or add empty text in the beginning)
                //3. false -> add "," and space
//                var prefix
//                if symptomLabel.text!.isEmpty {
//                    prefix = ""
//                } else {
//                    prefix = "; "
//                }
                let prefix = symptomLabel.text!.isEmpty ? "" : ", "
                symptomLabel.text = symptomLabel.text! + prefix + "\(symptom)"
            }
        }
        
        //Add time date of discomfort start
        
        if (NSUserDefaults.standardUserDefaults().stringForKey("chosenTimesString") != nil) {
            self.timeValue.text = NSUserDefaults.standardUserDefaults().stringForKey("chosenTimesString")
        } else {
            self.timeValue.text = ""
        }
//
//        if NSUserDefaults.standardUserDefaults().boolForKey("Swelling") == true {
//            symptomLabel.text = "Swelling"
//        } else {
//            symptomLabel.text = ""
//        }
//
//        //Symptoms print out end
//        
        
        
        //start character texta add
        characterLabel.text = ""
        for character in PSCharachterViewController.characters {
            //Adding printout for the symptoms
            if NSUserDefaults.standardUserDefaults().boolForKey(character) == true {
                //1. Check if current label is empty
                //2. true -> do nothing (or add empty text in the beginning)
                //3. false -> add "," and space
                //                var prefix
                //                if symptomLabel.text!.isEmpty {
                //                    prefix = ""
                //                } else {
                //                    prefix = "; "
                //                }
                let prefix = characterLabel.text!.isEmpty ? "" : ", "
                characterLabel.text = characterLabel.text! + prefix +  "\(character) "
            }
        }

//        if NSUserDefaults.standardUserDefaults().boolForKey("Cutting") == true {
//            characterLabel.text = "Cutting"
//        } else {
//            characterLabel.text = ""
//        }

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
        
        let alertController = UIAlertController(title: "Summary", message:
            "This is a summary of all the questions you have answered", preferredStyle: UIAlertControllerStyle.Alert)
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
    

    @IBAction func finishPressed(sender: UIButton) {
        navigationController?.popToRootViewControllerAnimated(true)
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
