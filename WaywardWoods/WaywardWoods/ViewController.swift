//
//  ViewController.swift
//  WaywardWoods
//
//  Created by Tatum Manning on 6/17/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var choiceOne: UIButton!
    
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var choiceTwo: UIButton!
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var promptLabel: UILabel!
    
    var gameLogic = GameLogic()
    var promptIndex: Int = 0;
    var endingId: String = "z"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        hideOptions()
        resultLabel.isHidden = true
        startButton.isHidden = false
        
        //switchToStart()
        
    }
    
    
    
    @IBAction func clickStart(_ sender: UIButton) {
        startButton.isHidden = true
        //changeLabel()
        resultLabel.isHidden = true
        promptLabel.isHidden = false
        logo.isHidden = false
        startGame()
    }
    
    
    @IBAction func choiceOneLabel(_ sender: UIButton) {
        
        let choiceId = gameLogic.prompt[promptIndex].option_one_id
        
        /*
        if isStartButton() {
            resultLabel.isHidden = true
            startGame()
        }
         */
        
        if gameLogic.isItOver(choiceId) {
            let result = gameLogic.findYourFate(choiceId)
            hideLogo()
            changeLabel()
            hideOptions()
            resultLabel.text = result
            startButton.isHidden = false
        } else {
            promptIndex = gameLogic.getNextQuestionIndex(choiceId)
            gameLogic.promptIndex = promptIndex
            updateUI(promptIndex)
        }
        
        
    }
    
    @IBAction func choiceTwoLabel(_ sender: UIButton) {
        
        let choiceId = gameLogic.prompt[promptIndex].option_two_id
        
        if gameLogic.isItOver(choiceId) {
            let result = gameLogic.findYourFate(choiceId)
            hideLogo()
            changeLabel()
            hideOptions()
            resultLabel.text = result
            startButton.isHidden = false
        } else {
            promptIndex = gameLogic.getNextQuestionIndex(choiceId)
            gameLogic.promptIndex = promptIndex
            updateUI(promptIndex)
        }
    }
    
    func startGame() {
        
        //resultLabel.isHidden = true
        promptIndex = 0
        gameLogic.promptIndex = promptIndex
        
        changeBackground(promptIndex)
        
        promptLabel.text = gameLogic.getPrompt()
        
        choiceOne.setTitle(gameLogic.getChoiceOne(), for: .normal)
        choiceTwo.setTitle(gameLogic.getChoiceTwo(), for: .normal)
        
        //switchToOptions()
        
        choiceOne.isHidden = false
        choiceTwo.isHidden = false
        
        
    }
    
    func updateUI(_ promptIndex: Int) {
        gameLogic.promptIndex = promptIndex
        changeBackground(gameLogic.promptIndex)
        
        promptLabel.text = gameLogic.getPrompt()
        
        choiceOne.setTitle(gameLogic.getChoiceOne(), for: .normal)
        choiceTwo.setTitle(gameLogic.getChoiceTwo(), for: .normal)
        
    }
    
    func changeBackground(_ promptIndex: Int) {
        let imageName =  gameLogic.getImageName(promptIndex)
        
        background.image = UIImage(named: imageName)
    }
    
    
    
    func hideOptions() {
        choiceOne.isHidden = true
        choiceTwo.isHidden = true
    }
    
    
    func changeLabel() {
        if promptLabel.isHidden && !resultLabel.isHidden {
            promptLabel.isHidden = false
            resultLabel.isHidden = true
        } else if !promptLabel.isHidden && resultLabel.isHidden {
            promptLabel.isHidden = true
            resultLabel.isHidden = false
        }
        
       
        
    }
    
    func hideLogo() {
        logo.isHidden = true
    }
}

