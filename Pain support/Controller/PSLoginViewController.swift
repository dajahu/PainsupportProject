//
//  PSLoginViewController.swift
//  Pain support
//
//  Created by Hyper Stoseven on 3/16/16.
//  Copyright © 2016 Hyper Island. All rights reserved.
//

import UIKit

class PSLoginViewController: UIViewController, UITextFieldDelegate  {

    @IBOutlet weak var loginBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //Implementing this method allows to dismiss keyboard if Return (Enter) is used
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    @IBAction func loginPressed(sender: UIButton) {
        loginBtn.enabled = false;
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
