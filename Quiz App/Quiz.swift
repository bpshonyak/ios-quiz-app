//
//  Quiz.swift
//  Quiz App
//
//  Created by Bogdan Pshonyak on 5/24/16.
//  Copyright © 2016 Bogdan Pshonyak. All rights reserved.
//

import Foundation

/**
  # Quiz Class
  Represents a quiz instance
*/
class Quiz {
    
    // Fields
    var questions:[(q: String, a: Bool)] = []
    var score: Int
    var index: Int
    
    // constructor
    init() {
        // initailize variables
        score = 0
        index = 0
        // load questions
        questions.append((q: "Washington is always sunny.", a: false))
        questions.append((q: "Humans can't breath and swallow at the same time.", a: true))
        questions.append((q: "Google was originally called BACKRUB", a: true))
        questions.append((q: "There is a planet that rains glass sideways.", a: true))
        questions.append((q: "Windows is better than Apple", a: true))
        questions.append((q: "Lightning never strikes in the same place twice.", a: false))
        questions.append((q: "The owner of the company that makes segways died after accidentally driving his segway off a cliff.", a: true))
        questions.append((q: "There is no word that rhymes with orange.", a: true))
        questions.append((q: "The space needle is located in Seattle.", a: true))
        questions.append((q: "E30's are slower than Honda SI's.", a: true))
    }
    
    /**
     *   answerQuestion: Answers the current true of false question
     * - parameter answer: true of false answer value
     */
    func answerQuestion(answer: Bool)-> Bool{
        let question = questions[index]
        index = index + 1
        if(question.a == answer){
            score = score + 1
            return true
        } else {
            return false
        }
    }
    
    /**
     * getQuestion: Retrieves current question text
     * - returns: String
     */
    func getQuestion()-> String {
        let q = questions[index].q
        return q
    }
    
    /**
     * getScore: Retrieves score and total question count
     * - returns: (Int, Int)
     */
    func getScore()-> (score: Int, total: Int) {
        return (score, questions.count);
    }
    
    /**
     * endOfQuiz: Checks for end of quiz state
     * - returns: Bool - true if the current question is the last question
     */
    func endOfQuiz() -> Bool {
        return index >= questions.count;
    }
    
}