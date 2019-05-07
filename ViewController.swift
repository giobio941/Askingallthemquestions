//
//  ViewController.swift
//  Asking All Them Questions
//
//  Created by Giovanni Humphrey on 11/26/2018.
//  
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    
    let allQuestions = QuestionBank()
    var pickedAnswer : Bool = false
    var questionNumber : Int = 0
    var score : Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextQuestion()
    }

    //This actions is called when either the true or false button is pressed.
    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1 {
            pickedAnswer = true
        }
        else if sender.tag == 2 {
            pickedAnswer = false
        }
        checkAnswer()
        
        questionNumber = questionNumber + 1
        
        nextQuestion()

    }
    
    //This method will update all the views on the screen(progress bar, score label, etc)
    func updateUI() {
      
        scoreLabel.text = "Score: \(score)"
        progressLabel.text = "\(questionNumber + 1) / 13"
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionNumber + 1)
        
    }
    
    //This method will update the question text and check if we reached the end.
    func nextQuestion() {
        
        if questionNumber <= 12 {
            
        questionLabel.text = allQuestions.list[questionNumber].questionText
            
        updateUI()
            
        } else {
            
            let alert = UIAlertController(title: "Yo My G!", message: "You've finished all of the questions, do you want to start over?", preferredStyle: .alert)
            
            let restartAction = UIAlertAction(title: "Restart", style: .default) { (UIAlertAction) in
                self.startOver()
            }
            
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
            
        }
        
    }
    
    //This method will check if the user got the answer right or not
    func checkAnswer() {
        let correctAnswer = allQuestions.list[questionNumber].answer
        
        if correctAnswer == pickedAnswer {
            ProgressHUD.showSuccess("Correct")
            score = score + 1
            
            
        } else {
            ProgressHUD.showError("Wrong")
        }
        
    }
    
    //this Method will wipe the board clean, so the users can retake the quiz. 
    func startOver() {
        
        score = 0
        questionNumber = 0
        nextQuestion()
        
        
        
    }
    

    
}
