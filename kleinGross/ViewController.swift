//
//  ViewController.swift
//  kleinGross
//
//  Created by Ryan Wieghard on 1/31/16.
//  Copyright © 2016 Ryan Wieghard. All rights reserved.
//

import UIKit

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static func randomColor() -> UIColor {
        let r = CGFloat.random()
        let g = CGFloat.random()
        let b = CGFloat.random()
        
        // If you wanted a random alpha, just create another
        // random number for that too.
        return UIColor(red: r, green: g, blue: b, alpha: 1.0)
    }
}



class ViewController: UIViewController, UIGestureRecognizerDelegate {
    //MARK:Properties
    @IBOutlet weak var kleinGrossLabel3: UILabel!
    
    @IBOutlet weak var beginButton: UIButton!
    @IBOutlet weak var kleinGrossLabel: UILabel!
    @IBOutlet weak var kleinGrossLabel2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: Selector("handleTap:"))
        tap.delegate = self
        self.view.addGestureRecognizer(tap)
       
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.kleinGrossLabel.text = SharingManager.sharedInstance.smallBigText
        self.kleinGrossLabel2.hidden = true
        self.kleinGrossLabel3.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //let tap = UITapGestureRecognizer(target: self, action: Selector("handleTap:"))
    //tap.delegate = self
    //myView.addGestureRecognizer(tap)

    //func handleTap(sender: UITapGestureRecognizer? = nil) {
        // handling code
    //}
    
    func pauseImprovisation (){
        print("hello!")
    }
    
    //MARK: actions
    @IBAction func pauseImprov(sender: UIButton) {
        
    
    }
    
    @IBAction func startImprovisation(sender: UIButton) {
        let s1:Sentence = Sentence(type: "S3")
        s1.soundEventDelegate = self
        let s2:Sentence = Sentence(type: "S1")
        SharingManager.sharedInstance.myModel = SentenceMarkov(Ult: s1, Penult: s2)
        SharingManager.sharedInstance.myModel.startChain()
        beginButton.hidden = true
    }   
}

extension ViewController: SoundEventDelegate {
    
    func handleTap(sender: UITapGestureRecognizer? = nil) {
        if (SharingManager.sharedInstance.timerPaused == true){
            print(SharingManager.sharedInstance.globalTimer)
            //create new timer
            
            let nextEvent = SharingManager.sharedInstance.nextEvent
            if (nextEvent < 2){
                SharingManager.sharedInstance.globalTimer = NSTimer.scheduledTimerWithTimeInterval(SharingManager.sharedInstance.myModel.ultimateSentence.eventArray[Int(nextEvent)].duration, target:SharingManager.sharedInstance.myModel.ultimateSentence, selector: Selector("handleTimer:"), userInfo: NSNumber(integer: nextEvent), repeats: false)
            }else{
               NSTimer.scheduledTimerWithTimeInterval(SharingManager.sharedInstance.myModel.ultimateSentence.eventArray[Int(nextEvent)].duration, target:SharingManager.sharedInstance.myModel.ultimateSentence, selector: Selector("sentenceDone"), userInfo: nil, repeats: false)
             }
          
            SharingManager.sharedInstance.timerPaused = false
            
        }
        else{
            guard let userInfo = SharingManager.sharedInstance.globalTimer.userInfo as? Int else {
                print("userInfo was not an Int.")
                return
            }
            
            SharingManager.sharedInstance.nextEvent = userInfo
             SharingManager.sharedInstance.globalTimer.invalidate()
            SharingManager.sharedInstance.timerPaused = true
        }
       
    }
    
    func eventStarted(text: String) {
        //switch bool of SharingManager.sharedIntstance.fontBlack
        SharingManager.sharedInstance.fontBlack = !SharingManager.sharedInstance.fontBlack
        if (SharingManager.sharedInstance.fontBlack){
            kleinGrossLabel.textColor = UIColor.blackColor()
        }
        else{
            kleinGrossLabel.textColor = UIColor.whiteColor()
        }
        kleinGrossLabel.text = text
        kleinGrossLabel.hidden = false
        self.view.backgroundColor = UIColor.randomColor()
        
    }
    func event2Started(text: String) {
        if (SharingManager.sharedInstance.fontBlack){
            kleinGrossLabel2.textColor = UIColor.blackColor()
        }
        else{
            kleinGrossLabel2.textColor = UIColor.whiteColor()
        }
        kleinGrossLabel2.text = text
        kleinGrossLabel2.hidden = false
    }
    func event3Started(text: String) {
        if (SharingManager.sharedInstance.fontBlack){
            kleinGrossLabel3.textColor = UIColor.blackColor()
        }
        else{
            kleinGrossLabel3.textColor = UIColor.whiteColor()
        }
        kleinGrossLabel3.text = text
        kleinGrossLabel3.hidden = false
    }
}

