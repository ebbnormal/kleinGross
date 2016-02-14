//
//  Sentence.swift
//  kleinGross
//
//  Created by Ryan Wieghard on 1/31/16.
//  Copyright © 2016 Ryan Wieghard. All rights reserved.
//

import Foundation

protocol SoundEventDelegate: class {
    func eventStarted(text:String)
    func event2Started(text:String)
    func event3Started(text:String)
}

class SharingManager{
    var smallBigText : String = "KLANG!"
    var globalTimer : NSTimer = NSTimer()
    var fontBlack: Bool = true
    var timerPaused: Bool = false
    var nextEvent : Int = 0
    var myModel : SentenceMarkov = SentenceMarkov(Ult: Sentence(type: "s1"), Penult: Sentence(type:"s2"))
    static let sharedInstance = SharingManager()
}


class SoundEvent {
    var text:String
    var duration:Double
    var num:Int
    init(text: String, duration: Double, num :Int){
        self.text = text
        self.duration = duration
        self.num = num
    }
    
     weak var delegate: SoundEventDelegate?
    
    func startEvent(){
        if(self.num == 1){
      delegate?.eventStarted(self.text)
        }
        if (self.num==2){
            delegate?.event2Started(self.text)
        }
        if(self.num==3){
            delegate?.event3Started(self.text)
        }
    }
    
    func getDuration() -> Double{
        return self.duration //TODO is this common practice?
    }

}


class Sentence : NSObject {
    var type=""
    var eventArray:[SoundEvent] = []
    
    
    var sentenceDelegate: SentenceDelegate? 
    
    weak var soundEventDelegate: SoundEventDelegate? = nil {
        didSet {
            eventArray.forEach() {$0.delegate = soundEventDelegate}
        }
    }
    
    init(type :String){
        super.init()
        let DurationsArray = [0.1, 3.4, 5.1]
        let durationIndex1 = arc4random_uniform(3)
        let durationIndex2 = arc4random_uniform(3)
        let durationIndex3 = arc4random_uniform(3)
        
        if (type=="S1"){
            // kkG
            let event1 = SoundEvent(text: "klein", duration: DurationsArray[Int(durationIndex1)], num: 1)
            let event2 = SoundEvent(text: "klein", duration: DurationsArray[Int(durationIndex2)], num: 2)
            let event3 = SoundEvent(text : "Groß", duration: DurationsArray[Int(durationIndex3)], num: 3)
            
            self.type = "S1"
            self.eventArray.append(event1)
            self.eventArray.append(event2)
            self.eventArray.append(event3)
        }
        else if (type=="S2"){
            let event1 = SoundEvent(text: "Groß", duration: DurationsArray[Int(durationIndex1)], num: 1)
            let event2 = SoundEvent(text: "Groß", duration: DurationsArray[Int(durationIndex2)], num: 2)
            let event3 = SoundEvent(text : "klein", duration: DurationsArray[Int(durationIndex3)], num: 3)
            
            self.type = "S2"
            self.eventArray.append(event1)
            self.eventArray.append(event2)
            self.eventArray.append(event3)
            
            
        }
        else if (type=="S3"){
            let event1 = SoundEvent(text: "Groß", duration: DurationsArray[Int(durationIndex1)], num : 1)
            let event2 = SoundEvent(text: "klein", duration: DurationsArray[Int(durationIndex2)],num: 2)
            let event3 = SoundEvent(text : "Groß", duration: DurationsArray[Int(durationIndex3)], num: 3)
            
            self.type = "S3"
            self.eventArray.append(event1)
            self.eventArray.append(event2)
            self.eventArray.append(event3)
            
        }
        else{
            //Wrong input given
        }
    }
    
    
    func sentenceDone(){
        sentenceDelegate?.sentenceDidFinish()
    }
    
    func start(){
        self.playEvent(0)
    }

    func handleTimer(timer: NSTimer) {
        guard let index = timer.userInfo as? Int else { return }
        playEvent(index)
    }
    
    func playEvent(eventIndex : Int){
        if (eventIndex < 2){
            let currEvent = self.eventArray[eventIndex]
            currEvent.startEvent()
            let nextIndex = eventIndex + 1
            SharingManager.sharedInstance.globalTimer = NSTimer.scheduledTimerWithTimeInterval(currEvent.duration, target: self, selector: Selector("handleTimer:"), userInfo: NSNumber(integer: nextIndex), repeats: false)
        }
        else if (eventIndex==2){
            let currEvent = self.eventArray[eventIndex]
            currEvent.startEvent()
            SharingManager.sharedInstance.globalTimer = NSTimer.scheduledTimerWithTimeInterval(currEvent.duration, target: self, selector: Selector("sentenceDone"), userInfo: nil, repeats: false)
        }
        else{
            //rien faire.
        }
    }
}

