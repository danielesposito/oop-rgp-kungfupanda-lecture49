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
    @IBOutlet weak var player1CurrentAttPwr: UILabel!
    @IBOutlet weak var player1Button: UIButton!
    //Player 2
    @IBOutlet weak var player2NameLabel: UILabel!
    @IBOutlet weak var player2HealthLabel: UILabel!
    @IBOutlet weak var player2CurrentAttPwr: UILabel!
    @IBOutlet weak var player2Button: UIButton!
    @IBOutlet weak var resetGamePlayBtn: UIButton!
    
    //Variables
    //Player 1
    var playerPo: Po!
    var quotesPo: String?
    var diePhrasePo: String?
    var randomHealthStartPlayer1: UInt32 = 0
    var randomAttackPwrPlayer1: UInt32 = 0
    var setRandAttackPwrPlayer1: UInt32 = 0
    //Player 2
    var playerShifu: Mastershifu!
    var quotesShifu: String?
    var diePhraseShifu: String?
    var randomHealthStartPlayer2: UInt32 = 0
    var randomAttackPwrPlayer2: UInt32 = 0
    var setRandAttackPwrPlayer2: UInt32 = 0
    var rndFighterNumber: Int = 0
    var currentFighter: Int = 0
    
    var foundBonusPlayer1: (String, Int) = ("",0)
    var foundBonusPlayer2: (String, Int) = ("",0)
    
    var newPlayer1Hp: Int = 0
    var newPlayer2Hp: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareGamePlay()
        setUpRndPlayerToStart()
        
}
    //Actions
    @IBAction func playerPoAttackButtonPressed(sender: AnyObject) {
        
        
        
        playerShifu.attemptAttackPlayer2(Int(randomAttackPwrPlayer1))
        didFindBonusPlayerA()
        
            if playerShifu.hpPlayer2 <= 0 {
                player2HealthLabel.text = "Health: 0"
            } else {
                player2HealthLabel.text = "Health: \(playerShifu.hpPlayer2)"
            }
        quotesPo = playerPo.showFunPhrase()
        randomQuoteMessage.text = "\(playerPo.name): \"\(quotesPo!)\""
        
        
        setNewPlayer1Values()
        
        if !playerShifu.isAlivePlayer2 {
            
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
    
    @IBAction func playerBAttackButtonPressed(sender: AnyObject) {
        
        
        
        playerPo.attemptAttackPlayer1(Int(randomAttackPwrPlayer2))
        didFindBonusPlayerB()
        
        if playerPo.hpPlayer1 <= 0 {
            player1HealthLabel.text = "Health: 0"
        } else {
            player1HealthLabel.text = "Health: \(playerPo.hpPlayer1)"
        }
        
        quotesShifu = playerShifu.showFunPhrase()
        randomQuoteMessage.text = "\(playerShifu.name): \"\(quotesShifu!)\""
        
        
        setNewPlayer2Values()
        
        if !playerPo.isAlivePlayer1 {
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
        setNewPlayer1Values()
        setNewPlayer2Values()
    }
    
    func prepareGamePlay() {
        
        randomQuoteMessage.text = ""
        resetGamePlayBtn.hidden = true

        //Initialize Player A
        playerPo = Po(charName: "Po", hpPlayer1: 0, attPwrPlayer1: 0, charGraphic: "po")
        playerPo.makeRandAttPwrNumber()
        playerPo.makeRandHealthPwrNumber()
        //Initialize Player B
        playerShifu = Mastershifu(charName: "Shifu", hpPlayer2: 0, attPwrPlayer2: 0, charGraphic: "mastershifu")
        
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
        player1Button.setTitle("Attack with \(randomAttackPwrPlayer1) PWR", forState: UIControlState.Normal)
        player1NameLabel.text = "Player \(playerPo.name)"
        playerPo = Po(updateHpPlayer1: Int(randomHealthStartPlayer1), updAttPwrPlayer1: Int(randomAttackPwrPlayer1))
        
        
        //Player B - Update Score Menu & initializers
        player2HealthLabel.text = "Health: \(Int(randomHealthStartPlayer2))"
        player2Button.setTitle("Attack with \(randomAttackPwrPlayer2) PWR", forState: UIControlState.Normal)
        player2NameLabel.text = "Player \(playerShifu.name)"
        playerShifu = Mastershifu(updateHpPlayer2: Int(randomHealthStartPlayer2), updAttPwrPlayer2: Int(randomAttackPwrPlayer2))
        
        setUpRndPlayerToStart()
    }
    
    func makeRandNumbersPlayer1() -> UInt32 {
        randomAttackPwrPlayer1 = playerPo.makeRandAttPwrNumber()
        return randomAttackPwrPlayer1
    }
    
    func makeRandNumbersPlayer2() -> UInt32 {
        randomAttackPwrPlayer2 = playerShifu.makeRandAttPwrNumber()
        return randomAttackPwrPlayer2
    }
    
    func setNewPlayer1Values() {
        setRandAttackPwrPlayer1 = makeRandNumbersPlayer1()
//        player1CurrentAttPwr.text = "AttPwr: \(setRandAttackPwrPlayer1)"
        player1Button.setTitle("Attack with \(setRandAttackPwrPlayer1) PWR", forState: UIControlState.Normal)
    }
    
    func setNewPlayer2Values() {
        setRandAttackPwrPlayer2 = makeRandNumbersPlayer2()
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
    
    func didFindBonusPlayerA(){
        foundBonusPlayer1 = playerPo.foundBonusHealth()

            newPlayer1Hp =  foundBonusPlayer1.1
            playerPo.collectBonushealthPlayer1(newPlayer1Hp)
            player1HealthLabel.text = "Health: \(Int(playerPo.hpPlayer1))"
            print("View: Current HP Player 1: \(playerPo.hpPlayer1)")
            print("Added Bonus: \(foundBonusPlayer1.0) - \(foundBonusPlayer1.1) HP")
    }
    
    func didFindBonusPlayerB() {
        foundBonusPlayer2 = playerShifu.foundBonusHealth()
            newPlayer2Hp =  foundBonusPlayer2.1
            playerShifu.collectBonushealthPlayer2(newPlayer2Hp)
            player2HealthLabel.text = "Health: \(Int(playerShifu.hpPlayer2))"
            print("View: Current HP Player 2: \(playerShifu.hpPlayer2)")
            print("Added Bonus: \(foundBonusPlayer2.0) - \(foundBonusPlayer2.1) HP")
    }



}