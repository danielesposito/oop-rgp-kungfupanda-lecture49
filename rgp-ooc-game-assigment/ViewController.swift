//
//  ViewController.swift
//  rgp-ooc-game-assigment
//
//  Created by Daniel Esposito on 3/25/16.
//  Copyright © 2016 Daniel Esposito. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //IBOutlets
    @IBOutlet weak var randomQuoteMessage: UILabel!
    @IBOutlet weak var playerANameLabel: UILabel!
    @IBOutlet weak var playerAHealthLabel: UILabel!
    @IBOutlet weak var playerACurrentAttPwr: UILabel!
    @IBOutlet weak var playerAButton: UIButton!
    @IBOutlet weak var resetGamePlayBtn: UIButton!
    
    @IBOutlet weak var playerBNameLabel: UILabel!
    @IBOutlet weak var playerBHealthLabel: UILabel!
    @IBOutlet weak var playerBCurrentAttPwr: UILabel!
    @IBOutlet weak var playerBButton: UIButton!
    
    //Variables
    //Player A
    var playerPo: Po!
    var quotesPo: String?
    var diePhrasePo: String?
    var randomHealthStartPlayerA: UInt32 = 0
    var randomAttackPwrPlayerA: UInt32 = 0
    var setRandAttackPwrPlayerA: UInt32 = 0
    //Player B
    var playerShifu: Mastershifu!
    var quotesShifu: String?
    var diePhraseShifu: String?
    var randomHealthStartPlayerB: UInt32 = 0
    var randomAttackPwrPlayerB: UInt32 = 0
    var setRandAttackPwrPlayerB: UInt32 = 0
    var rndFighterNumber: Int = 0
    var currentFighter: Int = 0
    var playerABonusHp: Int = 0
    
    var foundBonusPlayerA: (String, Int) = ("",0)
    var foundBonusPlayerB: (String, Int) = ("",0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareGamePlay()
        setUpRndPlayerToStart()
        
}
    //Actions
    @IBAction func playerPoAttackButtonPressed(sender: AnyObject) {
        
        playerShifu.attemptAttack(Int(randomAttackPwrPlayerA))
        
            if playerShifu.hp <= 0 {
                playerBHealthLabel.text = "Health: 0"
            } else {
                playerBHealthLabel.text = "Health: \(playerShifu.hp)"
            }
        quotesPo = playerPo.showFunPhrase()
        randomQuoteMessage.text = "\(playerPo.name): \"\(quotesPo!)\""
        
        
        setNewPlayerAValues()
        
        if !playerShifu.isAlive {
            
            diePhraseShifu = playerShifu.randDidDiePhrases()
            randomQuoteMessage.text = "\(playerShifu.name): \"\(diePhraseShifu!)\""
            playerBButton.enabled = false
            playerBButton.setTitle("YOU DIED!", forState: UIControlState.Normal)
            
            // Set button state for Winner Player A
            playerAButton.enabled = false
            playerAButton.setTitle("YOU WON!!!!", forState: UIControlState.Normal)
            resetGamePlayBtn.hidden = false
        } else {
            
            switchFighters()
        }
        
}
    
    @IBAction func playerBAttackButtonPressed(sender: AnyObject) {
        playerPo.attemptAttack(Int(randomAttackPwrPlayerB))
        if playerPo.hp <= 0 {
            playerAHealthLabel.text = "Health: 0"
        } else {
            playerAHealthLabel.text = "Health: \(playerPo.hp)"
        }
        
        quotesShifu = playerShifu.showFunPhrase()
        randomQuoteMessage.text = "\(playerShifu.name): \"\(quotesShifu!)\""
        
        
        setNewPlayerBValues()
        
        if !playerPo.isAlive {
            diePhrasePo = playerPo.randDidDiePhrases()
            randomQuoteMessage.text = "\(playerPo.name): \"\(diePhrasePo!)\""
            playerAButton.enabled = false
            playerAButton.setTitle("YOU DIED!", forState: UIControlState.Normal)
            
            //Set button state for Winner Player B
            playerBButton.enabled = false
            playerBButton.setTitle("YOU WON!!", forState: UIControlState.Normal)
            resetGamePlayBtn.hidden = false
        } else {
            
            switchFighters()
        }
       
    }
    
    @IBAction func resetGameBtnPressed(sender: AnyObject) {
        prepareGamePlay()
        setNewPlayerAValues()
        setNewPlayerBValues()
    }
    
    func prepareGamePlay() {
        
        randomQuoteMessage.text = ""
        resetGamePlayBtn.hidden = true

        //Initialize Player A
        playerPo = Po(charName: "Po", hp: 0, attPwr: 0, charGraphic: "po")
        playerPo.makeRandAttPwrNumber()
        playerPo.makeRandHealthPwrNumber()
        //Initialize Player B
        playerShifu = Mastershifu(charName: "MasterShifu", hp: 0, attPwr: 0, charGraphic: "mastershifu")
        
        playerShifu.makeRandAttPwrNumber()
        playerShifu.makeRandHealthPwrNumber()
        //Player A - Set up random numbers
        randomHealthStartPlayerA = playerPo.randomHealthNumber
        randomAttackPwrPlayerA = playerPo.randomAttckNumber
        // Player B - Set up random numbers
        randomHealthStartPlayerB = playerShifu.randomHealthNumber
        randomAttackPwrPlayerB = playerShifu.randomAttckNumber
        
        //Player A - Update Score Menu & initializers
        playerAHealthLabel.text = "Health: \(Int(randomHealthStartPlayerA))"
//        playerACurrentAttPwr.text = "Attack Pwr: \(Int(randomAttackPwrPlayerA))"
        
        playerAButton.setTitle("Attack with \(randomAttackPwrPlayerA) PWR", forState: UIControlState.Normal)
        playerANameLabel.text = "Player \(playerPo.name)"
        playerPo = Po(updateHp: Int(randomHealthStartPlayerA), updAttPwr: Int(randomAttackPwrPlayerA))
        //Player B - Update Score Menu & initializers
        playerBHealthLabel.text = "Health: \(Int(randomHealthStartPlayerB))"
//        playerBCurrentAttPwr.text = "Attack Pwr: \(Int(randomAttackPwrPlayerB))"
        
        playerBButton.setTitle("Attack with \(randomAttackPwrPlayerB) PWR", forState: UIControlState.Normal)
        playerBNameLabel.text = "Player \(playerShifu.name)"
        playerShifu = Mastershifu(updateHp: Int(randomHealthStartPlayerB), updAttPwr: Int(randomAttackPwrPlayerB))
        
        setUpRndPlayerToStart()
    }
    
    func makeRandNumbersPlayerA() -> UInt32 {
        randomAttackPwrPlayerA = playerPo.makeRandAttPwrNumber()
        return randomAttackPwrPlayerA
    }
    
    func makeRandNumbersPlayerB() -> UInt32 {
        randomAttackPwrPlayerB = playerShifu.makeRandAttPwrNumber()
        return randomAttackPwrPlayerB
    }
    
    func setNewPlayerAValues() {
        setRandAttackPwrPlayerA = makeRandNumbersPlayerA()
//        playerACurrentAttPwr.text = "AttPwr: \(setRandAttackPwrPlayerA)"
        playerAButton.setTitle("Attack with \(setRandAttackPwrPlayerA) PWR", forState: UIControlState.Normal)
    }
    
    func setNewPlayerBValues() {
        setRandAttackPwrPlayerB = makeRandNumbersPlayerB()
//        playerBCurrentAttPwr.text = "AttPwr: \(setRandAttackPwrPlayerB)"
        playerBButton.setTitle("Attack with \(setRandAttackPwrPlayerB)", forState: UIControlState.Normal)
    }
    
    func genRndFighterNumber() -> Int {
        rndFighterNumber = Int(arc4random_uniform(2))
        return rndFighterNumber
    }
    
    func setUpRndPlayerToStart() {
        if genRndFighterNumber() == 0 {
            //Player A starts / Disable Buttons for Player B
            playerAButton.enabled = true
            playerBButton.enabled = false
            currentFighter = 0
        } else {
            //Player A starts / Disable Buttons for Player B
            playerAButton.enabled = false
            playerBButton.enabled = true
            currentFighter = 1
        }
    }
    
    func switchFighters() {
        
        if currentFighter == 0 {
            currentFighter = 1
            playerAButton.enabled = false
            playerBButton.enabled = true
            didFindBonusPlayerA()
            
            
        } else {
            currentFighter = 0
            playerAButton.enabled = true
            playerBButton.enabled = false
            didFindBonusPlayerB()
        }
    }
    
    func didFindBonusPlayerA(){
        foundBonusPlayerA = playerPo.foundBonusHealth()
        if foundBonusPlayerA.0 == "Nada" {
//            print("Added Bonus: \(foundBonusPlayerA.0) - \(foundBonusPlayerA.1) HP")
        } else {
            print("Added Bonus: \(foundBonusPlayerA.0) - \(foundBonusPlayerA.1) HP")
            playerAHealthLabel.text = "Health: \(Int(playerPo.hp + foundBonusPlayerA.1))"
            let newPlayerAHp = playerPo.hp + foundBonusPlayerA.1
            playerPo = Po(updateHp: newPlayerAHp)
            print(newPlayerAHp)
        }
    }
    
    func didFindBonusPlayerB() {
        foundBonusPlayerB = playerShifu.foundBonusHealth()
        if foundBonusPlayerB.0 == "Nada" {
//            print("Added Bonus: \(foundBonusPlayerB.0) - \(foundBonusPlayerB.1) HP")
        } else {
            print("Added Bonus: \(foundBonusPlayerB.0) - \(foundBonusPlayerB.1) HP")
            playerAHealthLabel.text = "Health: \(Int(playerShifu.hp + foundBonusPlayerB.1))"
            let newPlayerBHp = playerShifu.hp + foundBonusPlayerB.1
            playerShifu = Mastershifu(updateHp: newPlayerBHp)
            print(newPlayerBHp)
        }
   
    }



}