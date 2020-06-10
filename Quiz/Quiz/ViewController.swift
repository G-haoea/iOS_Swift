//
//  ViewController.swift
//  Quiz
//
//  Created by Grace Liu on 09/06/2020.
//  Copyright © 2020 Grace Liu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    /// Put questions initialise into an array
    /// - Parameter questions: contains the whole questions and its correct answers
    let questions = [
            QuesAndAns(text: "1+1=2", ans: true),
            QuesAndAns(text: "1+1=3", ans: false),
            QuesAndAns(text: "1+2=3", ans: true)
    ]

    
    /// - Parameter curAns: the answer which user choose currently
    /// - Parameter corAns: the correct answer of this current question
    /// - Parameter curQues: the index of current question, it begins from 0
    /// - Parameter curScore: the current score for users
    /// - Parameter sumScore: the total score which users have obtained
    var curAns = true
    var corAns = true
    var curQues = 0
    var curScore = 0
    var sumScore = 0
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var completeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    
    
    /// what will display when user firstly enter this application
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        questionLabel.text = questions[0].quesText
        completeLabel.text = "Comlete:1/\(questions.count)"
        scoreLabel.text = "Score: 0"
        progressBar.progress = 1 / Float(questions.count)
        
    }
    
    
    /// The action will be different when click different button
    /// - Parameter sender: true and false buttons have different tags
    @IBAction func button(_ sender: UIButton) {
        
        curAns = sender.tag == 1 ? true : false
        corAns = questions[curQues].quesAns
        checkAns()
        updateUI()
        
    }
    
    
    /// TODO get current score and calculate the total score currently
    func checkAns() {
        curScore = curAns == corAns ? 10 : 0
        sumScore += curScore
        
    }
    
    
    /// TODO update the score display and turn to next question situation
    func updateUI() {
        scoreLabel.text = "Score: \(sumScore)"
        nextQues()
        
    }
    
    
    /// TODO when moving into next question, judge the situation first that whether the next question is null
    /// If the next question is null = the current question is the last one, we need to move back 1st one
    func nextQues() {
        curQues += 1
        if curQues < questions.count{
            questionLabel.text = questions[curQues].quesText
            completeLabel.text = "Complete: \(curQues + 1)/\(questions.count)"
            progressBar.progress = Float(curQues + 1) / Float(questions.count)
            
        }else{
            endToBegin()
        }
    }
    
    
    /// Create an alert poped from the center to ask whether user wants to try it again
    /// Then the display will show as beginning shows
    func endToBegin() {
        
        
        /// The variables inside the function should be set as self.
        let alert = UIAlertController(title: "Congratulations!", message: "Do you want to try again?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yes, try again!", style: .default, handler: { _ in
            self.curQues = 0
            self.sumScore = 0
            self.questionLabel.text = self.questions[0].quesText
            self.completeLabel.text = "Comlete:1/\(self.questions.count)"
            self.scoreLabel.text = "Score: 0"
            self.progressBar.progress = 1 / Float(self.questions.count)
            
            
        }))
        
        self.present(alert, animated: true, completion: nil)
        
    }
    



}

