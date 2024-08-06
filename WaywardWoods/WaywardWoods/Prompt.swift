//
//  Prompt.swift
//  WaywardWoods
//
//  Created by Tatum Manning on 6/17/23.
//

import Foundation


struct Prompt {
    
    init(_ prompt: String, _ o_one:String, _ o_one_id: String, _ o_two: String, _ o_two_id: String, _ id: Int) {
        the_prompt = prompt
        option_one = o_one
        option_one_id = o_one_id
        option_two = o_two
        option_two_id = o_two_id
        promptId = id
        
    }
    
    var the_prompt: String
    var option_one: String
    var option_one_id: String
    var option_two: String
    var option_two_id: String
    var promptId: Int
    
}
