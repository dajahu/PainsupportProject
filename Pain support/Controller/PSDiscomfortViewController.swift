//
//  PSDiscomfortViewController.swift
//  Pain support
//
//  Created by Hyper Stoseven on 3/15/16.
//  Copyright © 2016 Hyper Island. All rights reserved.
//

import UIKit

class PSDiscomfortViewController: UIViewController {

    @IBAction func previousPressed(sender: UIButton) {
        
        navigationController?.popViewControllerAnimated(true)
        
    }
    @IBOutlet var scrollView: UIScrollView!
    static var bodyView:BodyView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.topNavigation()
        self.initScrollView();
       
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
        navigationController?.popViewControllerAnimated(true)

        //navigationController?.popToRootViewControllerAnimated(true)
    }
    
    func helpPressed() {
        
        let alertController = UIAlertController(title: "Drawing discomfort", message:
            "Draw out where your pain is on the body", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func hideBackButton(){
        self.navigationItem.setHidesBackButton(true, animated:true);
    }
    
    
    
    
    func initScrollView(){
        // Double tap
        let doubleTapRecognizer = UITapGestureRecognizer(target: self, action: "scrollViewDoubleTapped:")
        doubleTapRecognizer.numberOfTapsRequired = 2
        doubleTapRecognizer.numberOfTouchesRequired = 1
        scrollView.addGestureRecognizer(doubleTapRecognizer)
        
        // Two fingers scroll
        self.scrollView.panGestureRecognizer.minimumNumberOfTouches = 2;
        
        // Add Body
        PSDiscomfortViewController.bodyView = BodyView()
        scrollView.addSubview(PSDiscomfortViewController.bodyView)
        scrollView.contentSize = PSDiscomfortViewController.bodyView.frame.size
        
        // Size to full screen
        let margin:CGFloat = 100
        let scaleWidth = (scrollView.frame.size.width-margin) / scrollView.contentSize.width
        let scaleHeight = (scrollView.frame.size.height-margin) / scrollView.contentSize.height
        let minScale = min(scaleWidth, scaleHeight);
        
        scrollView.minimumZoomScale = minScale;
        scrollView.maximumZoomScale = 6.0
        scrollView.zoomScale = 1.0;
        centerScrollViewContents()
    }
    
    func scrollViewDidEndZooming(scrollView: UIScrollView, withView view: UIView?, atScale scale: CGFloat){
        PSDiscomfortViewController.bodyView.contentScaleFactor            = scale;
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return PSDiscomfortViewController.bodyView
    }
    
    func scrollViewDidZoom(scrollView: UIScrollView) {
        centerScrollViewContents()
    }
    
    
    func centerScrollViewContents() {
        let boundsSize = scrollView.bounds.size
        var contentsFrame = PSDiscomfortViewController.bodyView.frame
        
        if contentsFrame.size.width < boundsSize.width {
            contentsFrame.origin.x = (boundsSize.width - contentsFrame.size.width) / 2.0
        } else {
            contentsFrame.origin.x = 0.0
        }
        
        if contentsFrame.size.height < boundsSize.height {
            contentsFrame.origin.y = (boundsSize.height - contentsFrame.size.height) / 2.0
        } else {
            contentsFrame.origin.y = 0.0
        }
        
        PSDiscomfortViewController.bodyView.frame = contentsFrame
    }
    
    func scrollViewDoubleTapped(recognizer: UITapGestureRecognizer) {
        // 1
        let pointInView = recognizer.locationInView(PSDiscomfortViewController.bodyView)
        
        // 2
        var newZoomScale = scrollView.zoomScale * 2
        newZoomScale = min(newZoomScale, scrollView.maximumZoomScale)
        
        // 3
        let scrollViewSize = scrollView.bounds.size
        let w = scrollViewSize.width / newZoomScale
        let h = scrollViewSize.height / newZoomScale
        let x = pointInView.x - (w / 2.0)
        let y = pointInView.y - (h / 2.0)
        
        let rectToZoomTo = CGRectMake(x, y, w, h);
        
        // 4
        scrollView.zoomToRect(rectToZoomTo, animated: true)
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
