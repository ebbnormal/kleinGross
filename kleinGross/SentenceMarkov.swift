//
//  SentenceMarkov.swift
//  kleinGross
//
//  Created by Ryan Wieghard on 1/31/16.
//  Copyright © 2016 Ryan Wieghard. All rights reserved.
//

import Foundation



protocol SentenceDelegate: class{
    func sentenceDidFinish()
    
}

class SentenceMarkov : SentenceDelegate{
    
    var ultimateSentence : Sentence {
        didSet{  setUltDelegate() }
    }
    var penultimateSentence : Sentence
   
    init(Ult : Sentence, Penult : Sentence){
        self.ultimateSentence = Ult
        self.penultimateSentence = Penult
        setUltDelegate()
    }
  
    func setUltDelegate(){
        ultimateSentence.sentenceDelegate = self
    }
    
    
    func startChain(){
        self.ultimateSentence.start()
    }
    
    
    func sentenceDidFinish(){
        self.nextSentence(self.ultimateSentence.type, penUltType: self.penultimateSentence.type)
    }
    
    /*
    func swapSentence(first: Sentence, second: Sentence, newType: String){
        first.sentenceDelegate = nil
        var tmp :Sentence = first
        first = Sentence(type: newType)
        first.soundEventDelegate = tmp.soundEventDelegate
        tmp.soundEventDelegate = nil
        self.penultimateSentence = tmp
        self.ultimateSentence.start()
        
    }
    */
    
    
    func nextSentence(ultType: String, penUltType: String){
        let num = arc4random_uniform(100)
        if (penUltType == "S1"){
            if (ultType == "S1"){
                if (Int(num) < 2){
                    self.ultimateSentence.sentenceDelegate = nil
                    let tmp :Sentence = self.ultimateSentence
                    self.ultimateSentence = Sentence(type: "S1")
                    self.ultimateSentence.soundEventDelegate = tmp.soundEventDelegate
                    tmp.soundEventDelegate = nil
                    self.penultimateSentence = tmp
                    self.ultimateSentence.start()
                
                }else if (Int(num) >= 2 && Int(num) < 5){
                    self.ultimateSentence.sentenceDelegate = nil
                    let tmp :Sentence = self.ultimateSentence
                    self.ultimateSentence = Sentence(type: "S2")
                    self.ultimateSentence.soundEventDelegate = tmp.soundEventDelegate
                    tmp.soundEventDelegate = nil
                    self.penultimateSentence = tmp
                    self.ultimateSentence.start()
                    
                }else{
                    self.ultimateSentence.sentenceDelegate = nil
                    let tmp :Sentence = self.ultimateSentence
                    self.ultimateSentence = Sentence(type: "S3")
                    self.ultimateSentence.soundEventDelegate = tmp.soundEventDelegate
                    tmp.soundEventDelegate = nil
                    self.penultimateSentence = tmp
                    self.ultimateSentence.start()
               }
               
            }
            if (ultType == "S2"){
                if (Int(num) < 2){
                    self.ultimateSentence.sentenceDelegate = nil
                    let tmp :Sentence = self.ultimateSentence
                    self.ultimateSentence = Sentence(type: "S1")
                    self.ultimateSentence.soundEventDelegate = tmp.soundEventDelegate
                    tmp.soundEventDelegate = nil
                    self.penultimateSentence = tmp
                    self.ultimateSentence.start()
                }
                if (Int(num) >= 2 && Int(num) < 25){
                    self.ultimateSentence.sentenceDelegate = nil
                    let tmp :Sentence = self.ultimateSentence
                    self.ultimateSentence = Sentence(type: "S2")
                    self.ultimateSentence.soundEventDelegate = tmp.soundEventDelegate
                    tmp.soundEventDelegate = nil
                    self.penultimateSentence = tmp
                    self.ultimateSentence.start()
                }
                if (Int(num) >= 25){
                    self.ultimateSentence.sentenceDelegate = nil
                    let tmp :Sentence = self.ultimateSentence
                    self.ultimateSentence = Sentence(type: "S3")
                    self.ultimateSentence.soundEventDelegate = tmp.soundEventDelegate
                    tmp.soundEventDelegate = nil
                    self.penultimateSentence = tmp
                    self.ultimateSentence.start()
                }
                
            }
            if (ultType == "S3"){
                if (Int(num) < 3){
                    self.ultimateSentence.sentenceDelegate = nil
                    let tmp :Sentence = self.ultimateSentence
                    self.ultimateSentence = Sentence(type: "S1")
                    self.ultimateSentence.soundEventDelegate = tmp.soundEventDelegate
                    tmp.soundEventDelegate = nil
                    self.penultimateSentence = tmp
                    self.ultimateSentence.start()
                    
                }else if (Int(num) >= 3 && Int(num) < 78){
                    self.ultimateSentence.sentenceDelegate = nil
                    let tmp :Sentence = self.ultimateSentence
                    self.ultimateSentence = Sentence(type: "S2")
                    self.ultimateSentence.soundEventDelegate = tmp.soundEventDelegate
                    tmp.soundEventDelegate = nil
                    self.penultimateSentence = tmp
                    self.ultimateSentence.start()
                    
                }else{
                    self.ultimateSentence.sentenceDelegate = nil
                    let tmp :Sentence = self.ultimateSentence
                    self.ultimateSentence = Sentence(type: "S3")
                    self.ultimateSentence.soundEventDelegate = tmp.soundEventDelegate
                    tmp.soundEventDelegate = nil
                    self.penultimateSentence = tmp
                    self.ultimateSentence.start()
                }
            }
        }
        if (penUltType == "S2"){
             if (ultType == "S1"){
                if (Int(num) < 75){
                    self.ultimateSentence.sentenceDelegate = nil
                    let tmp :Sentence = self.ultimateSentence
                    self.ultimateSentence = Sentence(type: "S1")
                    self.ultimateSentence.soundEventDelegate = tmp.soundEventDelegate
                    tmp.soundEventDelegate = nil
                    self.penultimateSentence = tmp
                    self.ultimateSentence.start()
                    
                }else if (Int(num) >= 75 && Int(num) < 80){
                    self.ultimateSentence.sentenceDelegate = nil
                    let tmp :Sentence = self.ultimateSentence
                    self.ultimateSentence = Sentence(type: "S2")
                    self.ultimateSentence.soundEventDelegate = tmp.soundEventDelegate
                    tmp.soundEventDelegate = nil
                    self.penultimateSentence = tmp
                    self.ultimateSentence.start()
                    
                }else{
                    self.ultimateSentence.sentenceDelegate = nil
                    let tmp :Sentence = self.ultimateSentence
                    self.ultimateSentence = Sentence(type: "S3")
                    self.ultimateSentence.soundEventDelegate = tmp.soundEventDelegate
                    tmp.soundEventDelegate = nil
                    self.penultimateSentence = tmp
                    self.ultimateSentence.start()
                }
                
            }
            if (ultType == "S2"){
                if (Int(num) < 75){
                    self.ultimateSentence.sentenceDelegate = nil
                    let tmp :Sentence = self.ultimateSentence
                    self.ultimateSentence = Sentence(type: "S1")
                    self.ultimateSentence.soundEventDelegate = tmp.soundEventDelegate
                    tmp.soundEventDelegate = nil
                    self.penultimateSentence = tmp
                    self.ultimateSentence.start()
                    
                }else if (Int(num) >= 75 && Int(num) < 80){
                    self.ultimateSentence.sentenceDelegate = nil
                    let tmp :Sentence = self.ultimateSentence
                    self.ultimateSentence = Sentence(type: "S2")
                    self.ultimateSentence.soundEventDelegate = tmp.soundEventDelegate
                    tmp.soundEventDelegate = nil
                    self.penultimateSentence = tmp
                    self.ultimateSentence.start()
                    
                }else{
                    self.ultimateSentence.sentenceDelegate = nil
                    let tmp :Sentence = self.ultimateSentence
                    self.ultimateSentence = Sentence(type: "S3")
                    self.ultimateSentence.soundEventDelegate = tmp.soundEventDelegate
                    tmp.soundEventDelegate = nil
                    self.penultimateSentence = tmp
                    self.ultimateSentence.start()
                }
            }
            if (ultType == "S3"){
                if (Int(num) < 5){
                    self.ultimateSentence.sentenceDelegate = nil
                    let tmp :Sentence = self.ultimateSentence
                    self.ultimateSentence = Sentence(type: "S1")
                    self.ultimateSentence.soundEventDelegate = tmp.soundEventDelegate
                    tmp.soundEventDelegate = nil
                    self.penultimateSentence = tmp
                    self.ultimateSentence.start()
                    
                }else if (Int(num) >= 5 && Int(num) < 80){
                    self.ultimateSentence.sentenceDelegate = nil
                    let tmp :Sentence = self.ultimateSentence
                    self.ultimateSentence = Sentence(type: "S2")
                    self.ultimateSentence.soundEventDelegate = tmp.soundEventDelegate
                    tmp.soundEventDelegate = nil
                    self.penultimateSentence = tmp
                    self.ultimateSentence.start()
                    
                }else{
                    self.ultimateSentence.sentenceDelegate = nil
                    let tmp :Sentence = self.ultimateSentence
                    self.ultimateSentence = Sentence(type: "S3")
                    self.ultimateSentence.soundEventDelegate = tmp.soundEventDelegate
                    tmp.soundEventDelegate = nil
                    self.penultimateSentence = tmp
                    self.ultimateSentence.start()
                }
                
            }
        }
        if (penUltType == "S3"){
            if (ultType == "S1"){
                if (Int(num) < 3){
                    self.ultimateSentence.sentenceDelegate = nil
                    let tmp :Sentence = self.ultimateSentence
                    self.ultimateSentence = Sentence(type: "S1")
                    self.ultimateSentence.soundEventDelegate = tmp.soundEventDelegate
                    tmp.soundEventDelegate = nil
                    self.penultimateSentence = tmp
                    self.ultimateSentence.start()
                    
                }else if (Int(num) >= 3 && Int(num) < 25){
                    self.ultimateSentence.sentenceDelegate = nil
                    let tmp :Sentence = self.ultimateSentence
                    self.ultimateSentence = Sentence(type: "S2")
                    self.ultimateSentence.soundEventDelegate = tmp.soundEventDelegate
                    tmp.soundEventDelegate = nil
                    self.penultimateSentence = tmp
                    self.ultimateSentence.start()
                    
                }else{
                    self.ultimateSentence.sentenceDelegate = nil
                    let tmp :Sentence = self.ultimateSentence
                    self.ultimateSentence = Sentence(type: "S3")
                    self.ultimateSentence.soundEventDelegate = tmp.soundEventDelegate
                    tmp.soundEventDelegate = nil
                    self.penultimateSentence = tmp
                    self.ultimateSentence.start()
                }
            }
            if (ultType == "S2"){
                if (Int(num) < 75){
                    self.ultimateSentence.sentenceDelegate = nil
                    let tmp :Sentence = self.ultimateSentence
                    self.ultimateSentence = Sentence(type: "S1")
                    self.ultimateSentence.soundEventDelegate = tmp.soundEventDelegate
                    tmp.soundEventDelegate = nil
                    self.penultimateSentence = tmp
                    self.ultimateSentence.start()
                    
                }else if (Int(num) >= 75 && Int(num) < 95){
                    self.ultimateSentence.sentenceDelegate = nil
                    let tmp :Sentence = self.ultimateSentence
                    self.ultimateSentence = Sentence(type: "S2")
                    self.ultimateSentence.soundEventDelegate = tmp.soundEventDelegate
                    tmp.soundEventDelegate = nil
                    self.penultimateSentence = tmp
                    self.ultimateSentence.start()
                    
                }else{
                    self.ultimateSentence.sentenceDelegate = nil
                    let tmp :Sentence = self.ultimateSentence
                    self.ultimateSentence = Sentence(type: "S3")
                    self.ultimateSentence.soundEventDelegate = tmp.soundEventDelegate
                    tmp.soundEventDelegate = nil
                    self.penultimateSentence = tmp
                    self.ultimateSentence.start()
                }
                
            }
            if (ultType == "S3"){
                if (Int(num) < 20){
                    self.ultimateSentence.sentenceDelegate = nil
                    let tmp :Sentence = self.ultimateSentence
                    self.ultimateSentence = Sentence(type: "S1")
                    self.ultimateSentence.soundEventDelegate = tmp.soundEventDelegate
                    tmp.soundEventDelegate = nil
                    self.penultimateSentence = tmp
                    self.ultimateSentence.start()
                    
                }else if (Int(num) >= 20 && Int(num) < 95){
                    self.ultimateSentence.sentenceDelegate = nil
                    let tmp :Sentence = self.ultimateSentence
                    self.ultimateSentence = Sentence(type: "S2")
                    self.ultimateSentence.soundEventDelegate = tmp.soundEventDelegate
                    tmp.soundEventDelegate = nil
                    self.penultimateSentence = tmp
                    self.ultimateSentence.start()
                    
                }else{
                    self.ultimateSentence.sentenceDelegate = nil
                    let tmp :Sentence = self.ultimateSentence
                    self.ultimateSentence = Sentence(type: "S3")
                    self.ultimateSentence.soundEventDelegate = tmp.soundEventDelegate
                    tmp.soundEventDelegate = nil
                    self.penultimateSentence = tmp
                    self.ultimateSentence.start()
                }
                
            }
        }
    }
    
}