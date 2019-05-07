//
//  Question.swift
//  Asking All Them Questions
//
//  Created by Giovanni Humphrey on 11/26/18.
//  
//

import Foundation

class Question {
    
    let questionText : String
    let answer : Bool
    
    init(text: String, correctAnswer: Bool) {
        questionText = text
        answer = correctAnswer
        
    }
}

