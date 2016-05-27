//
//  ViewController.swift
//  Quiz App
//
//  Created by Bogdan Pshonyak on 5/24/16.
//  Copyright © 2016 Bogdan Pshonyak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Fields
    @IBOutlet weak var questionLbl: UILabel!
    @IBOutlet weak var trueBtn: UIButton!
    @IBOutlet weak var falseBtn: UIButton!
    @IBOutlet weak var nextQBtn: UIButton!
    @IBOutlet weak var playAgainBtn: UIButton!
    
    var quiz: Quiz!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initailize quiz
        quiz = Quiz()
        
        // Get first question
        questionLbl.text = quiz.getQuestion()
    }
    
    /**
     *  truePressed: handles a True btn tap event
     */
    @IBAction func truePressed(sender: AnyObject) {
        quiz.answerQuestion(true)
        waitforNewQuestion()
    }
    
    /**
     *  falsePressed: handles a False btn tap event
     */
    @IBAction func falsePressed(sender: AnyObject) {
        quiz.answerQuestion(false)
        waitforNewQuestion()
    }
    
    /**
     *  nextPressed: handles a Next btn tap event
     */
    @IBAction func nextPressed(sender: AnyObject) {
        
        if(quiz.endOfQuiz()) {
            showScore()
        } else {
            questionLbl.text = quiz.getQuestion()
            
            nextQBtn.hidden = true
            trueBtn.hidden = false
            falseBtn.hidden = false
        }
    }
    
    /**
     *  playAgainPressed: handles a True btn tap event
     */
    @IBAction func playAgainPressed(sender: AnyObject) {
        
        quiz = Quiz()
        
        questionLbl.text = quiz.getQuestion()
        
        trueBtn.hidden = false
        falseBtn.hidden = false
        playAgainBtn.hidden = true
    }
    
    /**
     *  waitforNewQuestion: hides answer btns and shows next question btn
     */
    func waitforNewQuestion() {
        nextQBtn.hidden = false
        trueBtn.hidden = true
        falseBtn.hidden = true
    }

    /**
     *  showScore: Displays quiz score
     */
    func showScore() {
        
        let score = quiz.getScore().score
        let total = quiz.getScore().total
            
        questionLbl.text = "Quiz Over! Your score is \(score) out of \(total).";
        nextQBtn.hidden = true
        trueBtn.hidden = true
        falseBtn.hidden = true
        playAgainBtn.hidden = false
    }

}

