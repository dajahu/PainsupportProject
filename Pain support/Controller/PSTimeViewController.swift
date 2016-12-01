//
//  PSTimeViewController.swift
//  Pain support
//
//  Created by Hyper Stoseven on 3/16/16.
//  Copyright © 2016 Hyper Island. All rights reserved.
//

import UIKit
import AKPickerView_Swift


enum Picker {
    case yearTag
    case monthTag
    case dayTag
    case timeTag
    case minuteTag
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
}


class PSTimeViewController: UIViewController, AKPickerViewDataSource, AKPickerViewDelegate{
    @IBOutlet weak var yearPickerview: AKPickerView!
    @IBOutlet weak var monthPickerView: AKPickerView!
    @IBOutlet weak var dayPickerView: AKPickerView!
    @IBOutlet weak var timePickerView: AKPickerView!
    @IBOutlet weak var minutePickerView: AKPickerView!
    
    @IBOutlet weak var painEvolvedSubtitleLabel: UILabel!
    @IBOutlet weak var painEvolvedTitleLabel: UILabel!
    @IBOutlet weak var discomfortTitleLabel: UILabel!
    var chosenInfo = [0,0,0,0,0]
    @IBOutlet weak var discomfortSubtitleLabel: UILabel!
    
    var chosenStrings = ["","","","",""]
    
    @IBOutlet weak var discomfortLabel: UILabel!
    
    @IBOutlet weak var chooseDateLabel: UILabel!
    
    
    //Evolve settings
   
    @IBOutlet weak var evolutionValue: GradientSlider!
    
    @IBAction func evolveValueChange(sender: AnyObject) {
        var evolveValuewNow = Double(evolutionValue.value)
        NSUserDefaults.standardUserDefaults().setDouble(evolveValuewNow , forKey: "evolve")

    }
    
    // End
    
    var year = ["Year >"]
    
    var day = ["Day >"]
    
    var minutes = ["Minute >"]
    
    let month = ["Month >","Januari",  "Februari", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    
    let time = ["Hour >", "1:00am", "2:00am", "3:00am", "4:00am", "5:00am", "6:00am", "7:00am","8:00am", "9:00am", "10:00am","11:00am", "12:00am", "1:00pm","2:00pm", "3:00pm", "4:00pm","5:00pm", "6:00pm", "7:00pm","8:00pm", "9:00pm", "10:00pm","11:00pm", "12:00pm"]
    
    //let day = ["Day", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27", "28","29","30","31"]
   
    
    //let minutes = ["Minute","0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55","56","57","58","59"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for family: String in UIFont.familyNames()
        {
            print("\(family)")
            for names: String in UIFont.fontNamesForFamilyName(family)
            {
                print("== \(names)")
            }
        }
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
   // MARK:Whatever
   
    
    //If we go back
    override func viewDidAppear(animated: Bool) {
        topNavigation()
        
        //retrieve data
        
       
        
        
        
        let chosenAlternatives = NSUserDefaults.standardUserDefaults().objectForKey("chosenTimeAlternatives") as? [Int] ?? [Int]()
        
        if(chosenAlternatives.count == 5){
            chosenInfo = chosenAlternatives
        }
        prepareLabels()
        prepareSliderArrays()
        prepareTimeSliders()
        hideBackButton()
    }
    
    func prepareLabels(){
      
        //   http://codewithchris.com/common-mistakes-with-adding-custom-fonts-to-your-ios-app/
        discomfortTitleLabel.font = UIFont(name: "Roboto-Regular", size: 24)
           discomfortSubtitleLabel.font = UIFont(name: "Roboto-Regular", size: 18)
        
           painEvolvedTitleLabel.font = UIFont(name: "Roboto-Regular", size: 24)
        
           painEvolvedSubtitleLabel.font = UIFont(name: "Roboto-Regular", size: 18)

        
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
    
    
    //Prepares content for the sliders array
    func prepareSliderArrays() {
        
        prepareYearArray()
        prepareMinuteArray()
        
        
    }
    
    func prepareYearArray(){
        let date = NSDate()
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([.Year], fromDate: date)
        
        let years =  components.year
        
        year = prepareSliderData("Year >", startValue: years, amount: 100, increasing: false) as! [String]
    }
    
    
    
    func prepareMinuteArray(){
        //minutes.removeAll()
        minutes = prepareSliderData("Minute >", startValue: 0, amount: 59, increasing: true) as! [String]
    }
    
    
    
    //Loops out arrays values for Year, Day and Minutes
    func prepareSliderData(title:String,startValue:Int,amount:Int, increasing:Bool)->NSArray{
        
        //Create array to put data in
        var mutableArray = [""]
        
        //Give the value
        var valueForArray = startValue
        
        for(var i=0; i<=amount; i++ ){
            
            
            //Give the array a Title value in the first position
            if(i==0){
                mutableArray.removeAtIndex(0)
                mutableArray.append(title)
            }else{
                //If increasing plus the value with 1 else -1
                let value = increasing ? valueForArray++: valueForArray--
                
                let valueString = String(value)
                mutableArray.append(valueString)
            }
            
            
        }
        
        return mutableArray
    }
    
    
    
    func prepareTimeSliders(){
        setPickerView(self.yearPickerview)
        setPickerView(self.monthPickerView)
        setPickerView(self.dayPickerView)
        setPickerView(self.timePickerView)
        setPickerView(self.minutePickerView)
        
        prepareSlidersSelected()
        
    }
    
    
    func setPickerView(pickerView: AKPickerView) {
        pickerView.delegate = self
        pickerView.dataSource = self
       
       
        pickerView.font =  UIFont(name: "Roboto-Bold", size: 24) ?? UIFont.systemFontOfSize(24)
        pickerView.highlightedFont =  UIFont(name: "Roboto-Bold", size: 24) ?? UIFont.systemFontOfSize(24)
        
        
        // pickerView.font = UIFont(name: "HelveticaNeue-Light", size: 30)!
        //pickerView.highlightedFont = UIFont(name: "HelveticaNeue", size: 30)!
        pickerView.pickerViewStyle = .Wheel
        pickerView.maskDisabled = false
        pickerView.highlightedTextColor =  UIColor(netHex:0x00bdb7)
        pickerView.textColor = UIColor(netHex:0xe2e2e2)
        pickerView.reloadData()
    }
    
    
    //Makes sures the right option are highlighter or not
    func prepareSlidersSelected(){
        
       chosenInfo[0]>0 ? changeSliderState(monthPickerView, state: true):changeSliderState(monthPickerView, state: false)
        chosenInfo[1]>0 ? changeSliderState(dayPickerView, state: true):changeSliderState(dayPickerView, state: false)
        chosenInfo[2]>0 ? changeSliderState(timePickerView, state: true):changeSliderState(timePickerView, state: false)
        chosenInfo[3]>0 ? changeSliderState(minutePickerView, state: true):changeSliderState(minutePickerView, state: false)
    
        yearPickerview.selectItem(chosenInfo[0])
        monthPickerView.selectItem(chosenInfo[1])
        dayPickerView.selectItem(chosenInfo[2])
        timePickerView.selectItem(chosenInfo[3])
        minutePickerView.selectItem(chosenInfo[4])
    }
    
    //Amount of items in each slider
    func numberOfItemsInPickerView(pickerView: AKPickerView) -> Int {
        
        
        if(pickerView.tag == 0) {
            return self.year.count
        }else if(pickerView.tag == 1) {
            
        return self.month.count
        }else if(pickerView.tag == 2) {
            
            return self.day.count
        }else if(pickerView.tag == 3) {
            
            return self.time.count
        }else if(pickerView.tag == 4) {
            
            return self.minutes.count
        }
        else{
            return 0
        }
        
    }
    
   //titles for the items in the sliders
    func pickerView(pickerView: AKPickerView, titleForItem item: Int) -> String {
        
        
        if(pickerView.tag == 0) {
            return self.year[item]
        }else if(pickerView.tag == 1) {
            
            
            
            return self.month[item]
        }else if(pickerView.tag == 2) {
            
            return self.day[item]

            
        }else if(pickerView.tag == 3) {
            
            return self.time[item]
        }else if(pickerView.tag == 4) {
            
            return self.minutes[item]
        }
        else{
            return self.year[item]
        }
        
     
    }
    
    //When selected items make sure to unlock and lock sliders
    func pickerView(pickerView: AKPickerView, didSelectItem item: Int) {
        
        if(pickerView.tag == 0) {
            
            
            if(item >= 1){
                changeSliderState(monthPickerView, state: true)
                
                
                //makes sure if februari that it changes the amount of days
                if(monthPickerView.selectedItem == 2){
                    selectCorrectDayArray()
                    
                }
                
                
                
                if(monthPickerView.selectedItem >= 1){
                    changeSliderState(dayPickerView, state: true)
                    
                    if(dayPickerView.selectedItem >= 1){
                        changeSliderState(timePickerView, state: true)
                        
                        if(minutePickerView.selectedItem >= 1){
                            changeSliderState(minutePickerView, state: true)
                        }
                    }
                }
               
            }else{
                
                 changeSliderState(monthPickerView, state: false)
                 changeSliderState(dayPickerView, state: false)
                 changeSliderState(timePickerView, state: false)
                 changeSliderState(minutePickerView, state: false)
            }
            
        }else if(pickerView.tag == 1) {
            
        
            if(item >= 1){
                
                
            //Add correct days to month and year
                
                
              selectCorrectDayArray()
                
                changeSliderState(dayPickerView, state: true)
                
                if(dayPickerView.selectedItem >= 1){
                    changeSliderState(timePickerView, state: true)
                    
                    if(minutePickerView.selectedItem >= 1){
                        changeSliderState(minutePickerView, state: true)
                    }
                }
                
            }else{
               changeSliderState(dayPickerView, state: false)
               changeSliderState(timePickerView, state: false)
                changeSliderState(minutePickerView, state: false)
                
              
            }
        }else if(pickerView.tag == 2) {
           
            if(item >= 1){
            changeSliderState(timePickerView, state: true)
                
                
                    if(minutePickerView.selectedItem >= 1){
                        changeSliderState(minutePickerView, state: true)
                    }
                
             
            }else{
                
              changeSliderState(timePickerView, state: false)
              changeSliderState(minutePickerView, state: false)
            }
        }else if(pickerView.tag == 3) {
         
           if(item >= 1){
           changeSliderState(minutePickerView, state: true)
           }else{
           
           changeSliderState(minutePickerView, state: false)
            }
        }else if(pickerView.tag == 4) {
            
            
        }
       
    }
    
    
    //Make sure that the correc day array is selected, and if you change to a month with less days when example 31 is selected and the other month has max 30 it changes to 30 instead.
    func selectCorrectDayArray(){
        // day = prepareSliderData("Day >", startValue: 1, amount: getDaysInMonth(monthPickerView.selectedItem, year: yearPickerview.selectedItem), increasing: true) as! [String]
        day = prepareSliderData("Day >", startValue: 1, amount: getDaysInMonth(monthPickerView.selectedItem, year: Int(year[yearPickerview.selectedItem])!), increasing: true) as! [String]
        
        let a = dayPickerView.selectedItem
        
        
        
        if(day.count < a){
            
            let minus = a-day.count
            dayPickerView.selectItem(a-minus-1)
            dayPickerView.reloadData()
        }else if(day.count == a){
            dayPickerView.selectItem(a-1)
            dayPickerView.reloadData()
        }
    }
    
    //This changes the sliders to being active or unactive
    
    func changeSliderState(pickerView:AKPickerView, state:Bool){
        
        
        pickerView.userInteractionEnabled = state
        
        if state {
            pickerView.highlightedTextColor = UIColor(netHex:0x00bdb7)
            
        }else{
             pickerView.highlightedTextColor = UIColor(netHex:0xe2e2e2)
        }
        
        pickerView.reloadData()
        
        
    }
  
    //Different sizes for the sliders
    func pickerView(pickerView: AKPickerView, marginForItem item: Int) -> CGSize {
        
        if(pickerView.tag == 0) {
            return CGSizeMake(20, 40)
        }else if(pickerView.tag == 1) {
            
          return CGSizeMake(30, 40)
        }else if(pickerView.tag == 2) {
            
           return CGSizeMake(20, 40)
        }else if(pickerView.tag == 3) {
            
            return CGSizeMake(20, 40)
        }else if(pickerView.tag == 4) {
            
           return CGSizeMake(15, 40)
        }
        else{
            return CGSizeMake(100, 40)
        }
        
        
    }
    
    func reloadAll (){
        yearPickerview.reloadData()
        monthPickerView.reloadData()
        dayPickerView.reloadData()
        timePickerView.reloadData()
        minutePickerView.reloadData()
    }

    func scrollViewDidScroll(scrollView: UIScrollView) {
        // println("\(scrollView.contentOffset.x)")
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if (segue.identifier == "GoToFactors"){
            
            //view to pass data too, guard expect it to be true, check if it is an object of a class we want it ot be
            guard segue.destinationViewController is PSFactorsViewController else {
                
                //Stop doing any code
                return
            }
            
           chosenStrings.removeAll()
           chosenStrings = collectSelectedSliderDataString()
           chosenInfo = collectSelectedSliderData()
            
            
            //store data
            
            let chosenStringConcenate = chosenStrings.joinWithSeparator(" ") // "1 2 3 "
            NSUserDefaults.standardUserDefaults().setObject(chosenStringConcenate, forKey: "chosenTimesString")
            NSUserDefaults.standardUserDefaults().setObject(chosenInfo, forKey: "chosenTimeAlternatives")
            NSUserDefaults.standardUserDefaults().synchronize()
            
            
            //as! we know that this is the same type and we know we want to use it as this type, so we can get access to its properties. ! Strictly this is a viewcontroller without expection be like that. - sergei
            let nextScreen = segue.destinationViewController as! PSFactorsViewController
            
            
            
        }
    }
    
    //collect what is selected
    func collectSelectedSliderData()-> Array<Int>{
        
        //Check if the slider is active or not
        let chosenYear = yearPickerview.userInteractionEnabled == true ? yearPickerview.selectedItem : 0
        let chosenMonth = monthPickerView.userInteractionEnabled == true ? monthPickerView.selectedItem : 0
        let chosenDay = dayPickerView.userInteractionEnabled == true ? dayPickerView.selectedItem : 0
        let chosenHour = timePickerView.userInteractionEnabled == true ? timePickerView.selectedItem : 0
        let chosenMinute = minutePickerView.userInteractionEnabled == true ? minutePickerView.selectedItem : 0
        
          let chosenSliderValues = [chosenYear,chosenMonth,chosenDay,chosenHour,chosenMinute]
        
        return chosenSliderValues
        
    }
    
    //collect string of collected data
    func collectSelectedSliderDataString()-> Array<String>{
        
        //Check if the slider is active or not
        let chosenYear = yearPickerview.userInteractionEnabled == true && yearPickerview.selectedItem != 0 ? year[yearPickerview.selectedItem] : ""
        let chosenMonth = monthPickerView.userInteractionEnabled == true && monthPickerView.selectedItem != 0 ? month[monthPickerView.selectedItem] : ""
        let chosenDay = dayPickerView.userInteractionEnabled == true && dayPickerView.selectedItem != 0 ? day[dayPickerView.selectedItem] : ""
        let chosenHour = timePickerView.userInteractionEnabled == true && timePickerView.selectedItem != 0 ? time[timePickerView.selectedItem] : ""
        //let chosenMinute = minutePickerView.userInteractionEnabled == true  && yearPickerview.selectedItem != 0 ? minutes[minutePickerView.selectedItem] : ""
        
        let chosenSliderStringValues = [chosenYear,chosenMonth,chosenDay,chosenHour]
        
        return chosenSliderStringValues
        
    }
    
    
    
    
    
    
    
    //get the days in a month
    func getDaysInMonth(month: Int, year: Int) -> Int
    {
        let calendar = NSCalendar.currentCalendar()
        
        let startComps = NSDateComponents()
        startComps.day = 1
        startComps.month = month
        startComps.year = year
        
        let endComps = NSDateComponents()
        endComps.day = 1
        endComps.month = month == 12 ? 1 : month + 1
        endComps.year = month == 12 ? year + 1 : year
        
        let startDate = calendar.dateFromComponents(startComps)!
        let endDate = calendar.dateFromComponents(endComps)!
        
        let diff = calendar.components(NSCalendarUnit.Day, fromDate: startDate, toDate: endDate, options: NSCalendarOptions.MatchFirst)
        
        //print(diff.day)
        return diff.day
    }

}
