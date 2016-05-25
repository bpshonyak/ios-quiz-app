//
//  ViewController.swift
//  Quiz App
//
//  Created by Bogdan Pshonyak on 5/24/16.
//  Copyright © 2016 Bogdan Pshonyak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var questionLbl: UILabel!
    @IBOutlet weak var trueBtn: UIButton!
    @IBOutlet weak var falseBtn: UIButton!
    @IBOutlet weak var nextQBtn: UIButton!
    @IBOutlet weak var playAgainBtn: UIButton!
    
    var quiz: Quiz!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        quiz = Quiz()
        
        questionLbl.text = quiz.getQuestion()
    }
    
    @IBAction func truePressed(sender: AnyObject) {
        quiz.answerQuestion(true)
        waitforNewQuestion()
    }
    
    @IBAction func falsePressed(sender: AnyObject) {
        quiz.answerQuestion(false)
        waitforNewQuestion()
    }
    
    
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
    
    @IBAction func playAgainPressed(sender: AnyObject) {
        
        quiz = Quiz()
        
        questionLbl.text = quiz.getQuestion()
        
        trueBtn.hidden = false
        falseBtn.hidden = false
        playAgainBtn.hidden = true
    }
    
    
    func waitforNewQuestion() {
        nextQBtn.hidden = false
        trueBtn.hidden = true
        falseBtn.hidden = true
    }

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

