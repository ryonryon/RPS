//
//  ViewController.swift
//  RPS
//
//  Created by Ryo Togashi on 2019-08-18.
//  Copyright © 2019 Ryo Togashi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var scafold: UIView!
    @IBOutlet weak var rpcLabel: UILabel!
    @IBOutlet weak var rockPaperScissorsLabel: UILabel!
    @IBOutlet weak var userHandLabel: UILabel!
    @IBOutlet weak var leftHand: UIButton!
    @IBOutlet weak var centerHand: UIButton!
    @IBOutlet weak var rightHand: UIButton!
    @IBOutlet weak var palyAgainButton: UIButton!
    var state: GameState = .start
    var random: RpsRobot = RpsRobot()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        palyAgainButton.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    @IBAction func rockButtonTapped(_ sender: UIButton) {
        let randomSign = random.randomSign()
        state = playRps(.rock, randomSign)
        updateUI()
    }
    
    @IBAction func paperButtonTapped(_ sender: UIButton) {
        let randomSign = random.randomSign()
        state = playRps(.paper, randomSign)
        updateUI()
    }
    
    @IBAction func scissorsButtonTapped(_ sender: UIButton) {
        let randomSign = random.randomSign()
        state = playRps(.scissors, randomSign)
        updateUI()
    }
    
    @IBAction func playAgain(_ sender: UIButton) {
        state = .start
        updateUI()
    }
    
    func playRps(_ userSign: Sign, _ robotSign: Sign) -> GameState {
        
        rockPaperScissorsLabel.text = robotSign.rawValue
        userHandLabel.text = userSign.rawValue
        rockPaperScissorsLabel.font = rockPaperScissorsLabel.font.withSize(72)
        userHandLabel.font = userHandLabel.font.withSize(72)
        
        if userSign == robotSign {
            rpcLabel.text = "Draw"
            return .draw
            
        } else if (userSign == .rock && robotSign == .scissors)
            || (userSign == .paper && robotSign == .rock)
            || (userSign == .scissors && robotSign == .paper){
            rpcLabel.text = "You Won!"
            return .win
            
        } else {
            rpcLabel.text = "You lost!"
            return .lose
        }
    }
    
    func updateUI() {
        if state == .start {
            rpcLabel.text = "🤖"
            rockPaperScissorsLabel.text = "Rock, Paper, Scissors?"
            rockPaperScissorsLabel.font = rockPaperScissorsLabel.font.withSize(17)
            userHandLabel.isHidden = true
            leftHand.isHidden = false
            centerHand.isHidden = false
            rightHand.isHidden = false
            palyAgainButton.isHidden = true
            
            
        } else {
            palyAgainButton.isHidden = false
            userHandLabel.isHidden = false
            leftHand.isHidden = true
            centerHand.isHidden = true
            rightHand.isHidden = true
            palyAgainButton.isHidden = false
        }
    }
}

