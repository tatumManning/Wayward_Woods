//
//  GameLogic.swift
//  WaywardWoods
//
//  Created by Tatum Manning on 6/17/23.
//

import Foundation

struct GameLogic {
    
    var promptIndex : Int = 0
    
    let prompt = [
        Prompt("You are lost at a fork. Which way do you go?", "Take the left fork", "a", "Take the right fork.","b", 0),
        Prompt("You come across a faerie circle. What do you do?", "Walk into the circle", "c", "Go back to the fork", "d", 1),
        Prompt("Little wisps of light begin to surround you. What do you do?", "Turn and run", "e", "Give them your picnic basket", "f", 2),
        Prompt("You see a cottage and it is clear someone lives here. Do you", "Walk up to the cabin to ask directions?", "g", "Keep running?", "h", 3),
        Prompt("You walk into a peaceful glade. But you can hear someone walking up behind you. Do you", "Turn and ask for directions?", "i", "Run away without looking back?", "j", 4),
        Prompt("You come upon the edge a swamp. There is a beautiful horse walking towards you from the left and a voice whispering for you to follow coming from the right", "Follow the horse", "k", "Follow the voice", "l", 5),
        //Prompt("You are saved!", "Find out how you survived", "m", "Play again", "n", 6),
        //Prompt("Oh no! You died.", "Find out how you died", "o", "Play again", "n", 7)
        
        
    ]
    
    func getPrompt() -> String {
        return prompt[promptIndex].the_prompt
    }
    
    func getChoiceOne() -> String {
        return prompt[promptIndex].option_one
    }

    func getChoiceTwo() -> String {
        return prompt[promptIndex].option_two
    }
    
    func getImageName(_ promptIndex: Int) -> String {
        let promptImage = promptIndex
        switch promptImage {
        case 0:
             return "fork_background"
        case 1:
            return "circle_background"
        case 2:
            return "wisps_background"
        case 3:
            return "cottage_background"
        case 4:
            return "glade_background"
        case 5:
            return "swamp_background"
        default:
            return "final_background"
        }
    }

    func getNextQuestionIndex(_ choiceId: String) -> Int {
        let choiceId = choiceId
        
        switch choiceId {
        case "a":
            return 1
        case "b":
            return 4
        case "c":
            return 2
        case "d":
            return 0
        case "e":
            return 3
        case "h":
            return 5
        case "j":
            return 5
        default:
            return 0
            
        }
    }
    
    func findYourFate(_ choiceId: String) -> String {
        let choiceId = choiceId
        
        switch choiceId {
        case "f":
            return "The wisps gather around the food and vanish, taking the offering with them. Left behind is a map marking your location and a trail out of the woods! Click Start to play again."
        case "g":
            return "When you get closer you notice the door is open and a young women has her back to you, singing. You start to greet her when all of a sudden she turns, running and screaming at you. The last thing you see before everything fades to black is her shrunken, wrinkled face and rotten missing teeth. Click Start to play again."
        case "i":
            return "You turn around to look for who is making all that noise. \"Hello? Is anyone there?\" Suddenly a monster made of shadows materializes and devours you whole. Click Start to play again."
        case "k":
            return "You step towards the horse and notice it wants you to follow. You follow the horse to the edge of the swamp. All of a sudden the horse transforms into a terrifying kelpie. He grabs you and drags you under the water to become his next meal. Click Start to play again."
        case "l":
            return "You followed the voice as it floated on the wind. After walking a very long ways, your start to see the beginning of the trail where you left your car! Click Start to play again."
        default:
            return "Your fate is undetermined. Click Start to try again."
            
        }
    }
    
    func isItOver(_ choiceId: String) -> Bool {
        let endChoices = ["f", "g", "i", "k", "l"]
        
        for choice in endChoices {
            if choiceId == choice {
                return true
            }
        }
        return false
    }
    
    
}
