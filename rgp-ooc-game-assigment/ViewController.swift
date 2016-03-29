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
    //Player 1
    @IBOutlet weak var randomQuoteMessage: UILabel!
    @IBOutlet weak var player1NameLabel: UILabel!
    @IBOutlet weak var player1HealthLabel: UILabel!
    @IBOutlet weak var player1BonusFoundLabel: UILabel!
    @IBOutlet weak var player1Button: UIButton!
    //Player 2
    @IBOutlet weak var player2NameLabel: UILabel!
    @IBOutlet weak var player2HealthLabel: UILabel!
    @IBOutlet weak var player2BonusFoundLabel: UILabel!
    @IBOutlet weak var player2Button: UIButton!
    //Others
    @IBOutlet weak var resetGamePlayBtn: UIButton!
    
    //Variables
    //Player A
    var playerPo: Po!
    var quotesPo: String?
    var diePhrasePo: String?
    var randomHealthStartPlayer1: UInt32 = 0
    var randomAttackPwrPlayer1: UInt32 = 0
    var setRandAttackPwrPlayer1: UInt32 = 0
    var foundBonusPlayer1: (String, Int) = ("",0)
    //Player B
    var playerShifu: Mastershifu!
    var quotesShifu: String?
    var diePhraseShifu: String?
    var randomHealthStartPlayer2: UInt32 = 0
    var randomAttackPwrPlayer2: UInt32 = 0
    var setRandAttackPwrPlayer2: UInt32 = 0
    var foundBonusPlayer2: (String, Int) = ("",0)
    //Others
    var rndFighterNumber: Int = 0
    var currentFighter: Int = 0
    var playerABonusHp: Int = 0
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareGamePlay()
        setUpRndPlayerToStart()
        player1BonusFoundLabel.text = ""
        player2BonusFoundLabel.text = ""
    }
    //Actions
    @IBAction func player1AttackButtonPressed(sender: AnyObject) {
        
        didFindBonusPlayer1()
        
        playerShifu.attemptAttack(Int(randomAttackPwrPlayer1))
        
        if playerShifu.hp <= 0 {
            player2HealthLabel.text = "Health: 0"
        } else {
            player2HealthLabel.text = "Health: \(playerShifu.hp)"
        }
        quotesPo = playerPo.showFunPhrase()
        randomQuoteMessage.text = "\(playerPo.name): \"\(quotesPo!)\""
        
        
        setNewPlayerAValues()
        
        if !playerShifu.isAlive {
            
            diePhraseShifu = playerShifu.randDidDiePhrases()
            randomQuoteMessage.text = "\(playerShifu.name): \"\(diePhraseShifu!)\""
            player2Button.enabled = false
            player2Button.setTitle("YOU DIED!", forState: UIControlState.Normal)
            
            // Set button state for Winner Player A
            player1Button.enabled = false
            player1Button.setTitle("YOU WON!!!!", forState: UIControlState.Normal)
            resetGamePlayBtn.hidden = false
        } else {
            
            switchFighters()
        }
        
    }
    
    @IBAction func player2AttackButtonPressed(sender: AnyObject) {
        didFindBonusPlayer2()
        playerPo.attemptAttack(Int(randomAttackPwrPlayer2))
        if playerPo.hp <= 0 {
            player1HealthLabel.text = "Health: 0"
        } else {
            player1HealthLabel.text = "Health: \(playerPo.hp)"
        }
        
        quotesShifu = playerShifu.showFunPhrase()
        randomQuoteMessage.text = "\(playerShifu.name): \"\(quotesShifu!)\""
        
        
        setNewPlayerBValues()
        
        if !playerPo.isAlive {
            diePhrasePo = playerPo.randDidDiePhrases()
            randomQuoteMessage.text = "\(playerPo.name): \"\(diePhrasePo!)\""
            player1Button.enabled = false
            player1Button.setTitle("YOU DIED!", forState: UIControlState.Normal)
            
            //Set button state for Winner Player B
            player2Button.enabled = false
            player2Button.setTitle("YOU WON!!", forState: UIControlState.Normal)
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
        randomHealthStartPlayer1 = playerPo.randomHealthNumber
        randomAttackPwrPlayer1 = playerPo.randomAttckNumber
        // Player B - Set up random numbers
        randomHealthStartPlayer2 = playerShifu.randomHealthNumber
        randomAttackPwrPlayer2 = playerShifu.randomAttckNumber
        
        //Player A - Update Score Menu & initializers
        player1HealthLabel.text = "Health: \(Int(randomHealthStartPlayer1))"
        //        player1CurrentAttPwr.text = "Attack Pwr: \(Int(randomAttackPwrPlayer1))"
        
        player1Button.setTitle("Attack with \(randomAttackPwrPlayer1) PWR", forState: UIControlState.Normal)
        player1NameLabel.text = "Player \(playerPo.name)"
        playerPo = Po(updateHp: Int(randomHealthStartPlayer1), updAttPwr: Int(randomAttackPwrPlayer1))
        //Player B - Update Score Menu & initializers
        player2HealthLabel.text = "Health: \(Int(randomHealthStartPlayer2))"
        //        player2CurrentAttPwr.text = "Attack Pwr: \(Int(randomAttackPwrPlayer2))"
        
        player2Button.setTitle("Attack with \(randomAttackPwrPlayer2) PWR", forState: UIControlState.Normal)
        player2NameLabel.text = "Player \(playerShifu.name)"
        playerShifu = Mastershifu(updateHp: Int(randomHealthStartPlayer2), updAttPwr: Int(randomAttackPwrPlayer2))
        
        setUpRndPlayerToStart()
    }
    
    func makeRandNumbersPlayerA() -> UInt32 {
        randomAttackPwrPlayer1 = playerPo.makeRandAttPwrNumber()
        return randomAttackPwrPlayer1
    }
    
    func makeRandNumbersPlayerB() -> UInt32 {
        randomAttackPwrPlayer2 = playerShifu.makeRandAttPwrNumber()
        return randomAttackPwrPlayer2
    }
    
    func setNewPlayerAValues() {
        setRandAttackPwrPlayer1 = makeRandNumbersPlayerA()
        //        player1CurrentAttPwr.text = "AttPwr: \(setRandAttackPwrPlayer1)"
        player1Button.setTitle("Attack with \(setRandAttackPwrPlayer1) PWR", forState: UIControlState.Normal)
    }
    
    func setNewPlayerBValues() {
        setRandAttackPwrPlayer2 = makeRandNumbersPlayerB()
        //        player2CurrentAttPwr.text = "AttPwr: \(setRandAttackPwrPlayer2)"
        player2Button.setTitle("Attack with \(setRandAttackPwrPlayer2)", forState: UIControlState.Normal)
    }
    
    func genRndFighterNumber() -> Int {
        rndFighterNumber = Int(arc4random_uniform(2))
        return rndFighterNumber
    }
    
    func setUpRndPlayerToStart() {
        if genRndFighterNumber() == 0 {
            //Player A starts / Disable Buttons for Player B
            player1Button.enabled = true
            player2Button.enabled = false
            currentFighter = 0
        } else {
            //Player A starts / Disable Buttons for Player B
            player1Button.enabled = false
            player2Button.enabled = true
            currentFighter = 1
        }
    }
    
    func switchFighters() {
        
        if currentFighter == 0 {
            currentFighter = 1
            player1Button.enabled = false
            player2Button.enabled = true
            
            
        } else {
            currentFighter = 0
            player1Button.enabled = true
            player2Button.enabled = false
        }
    }
    
    func didFindBonusPlayer1(){
        foundBonusPlayer1 = playerPo.foundBonusHealth()
        
            player1HealthLabel.text = "Health: \(Int(playerPo.hp + foundBonusPlayer1.1))"
            let player1NewHp = playerPo.hp + foundBonusPlayer1.1
            playerPo = Po(updateHp: player1NewHp)
            print("View: Added Bonus Player 1: \(foundBonusPlayer1.0) - \(foundBonusPlayer1.1) HP")
            print("View: Current HP Player  1: \(playerPo.hp)")
            if foundBonusPlayer1.0 != "Nada" {
                self.player1BonusFoundLabel.fadeOut(completion:{
                    (finished: Bool) -> Void in
                    self.player1BonusFoundLabel.text = "+ \(self.foundBonusPlayer1.0) - \(self.foundBonusPlayer1.1) HP"
                    self.player1BonusFoundLabel.fadeIn()
                    
                    self.player1BonusFoundLabel.fadeOut(completion:{
                        (finished: Bool) -> Void in
                        self.player1BonusFoundLabel.text = ""
                    })
                })
            }
    }
    
    func didFindBonusPlayer2() {
        foundBonusPlayer2 = playerShifu.foundBonusHealth()
        
            player2HealthLabel.text = "Health: \(Int(playerShifu.hp + foundBonusPlayer2.1))"
            let player2NewHp = playerShifu.hp + foundBonusPlayer2.1
            playerShifu = Mastershifu(updateHp: player2NewHp)
            print("View: Added Bonus Player 2: \(foundBonusPlayer2.0) - \(foundBonusPlayer2.1) HP")
            print("View: Current HP Player  2: \(playerShifu.hp)")
            if foundBonusPlayer2.0 != "Nada" {
                self.player2BonusFoundLabel.fadeOut(completion:{
                    (finished: Bool) -> Void in
                    self.player2BonusFoundLabel.text = "+ \(self.foundBonusPlayer2.0) - \(self.foundBonusPlayer2.1) HP"
                    self.player2BonusFoundLabel.fadeIn()
                    
                    self.player2BonusFoundLabel.fadeOut(completion:{
                        (finished: Bool) -> Void in
                        self.player2BonusFoundLabel.text = ""
                    })
                    
                })
            }
        
        
    }
    
    
    
}