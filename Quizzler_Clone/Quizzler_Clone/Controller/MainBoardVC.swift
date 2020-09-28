//
//  ViewController.swift
//  Quizzler_Clone
//
//  Created by Thien Tran on 9/24/20.
//

import UIKit

class MainBoardVC: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: RoundBorderButton!
    @IBOutlet weak var falseButton: RoundBorderButton!
    
    let questions = [
        ("Question #1", true),
        ("Question #2", false),
        ("Question #3", true),
        ("Question #4", false),
        ("Question #5", true),
        ("Question #6", true),
        ("Question #7", false)
    ]
    var questionNumber = 0
    let normalBorderButtonColor = "#ff8f00"
    let rightAnswerBorderButtonColor = "#b9f6ca"
    let wrongAnswerBorderButtonColor = "#e65100"
    var numberCorrectAnswer  = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    @IBAction func answerQuestionPressed(_ sender: UIButton){
        questionNumber += 1
        if questionNumber <= questions.count - 1 {
            let rightAnswer = questions[questionNumber].1
            print(questionNumber)
            print("answer \(rightAnswer)")
            var myAnswer = false
            
            if sender.tag == 0 {
                myAnswer = false
            }else{
                myAnswer = true
            }
            
            if(rightAnswer == myAnswer){
                numberCorrectAnswer += 1
                let touchedButton = sender as? RoundBorderButton
                touchedButton?.rBorderColor = UIColor(hex: rightAnswerBorderButtonColor)
                touchedButton?.backgroundColor = UIColor(hex: rightAnswerBorderButtonColor)
            }else{
                let touchedButton = sender as? RoundBorderButton
                touchedButton?.rBorderColor = UIColor(hex: wrongAnswerBorderButtonColor)
                touchedButton?.backgroundColor = UIColor(hex: wrongAnswerBorderButtonColor)
            }
            
            Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
            
           
        }else{
            questionNumber = 0
            updateUI()
            performSegue(withIdentifier: "toAnswerResultModalSegue" , sender: nil)
            numberCorrectAnswer = 0

        }
        
    }
    
    @objc func updateUI() {
        questionLabel.text = questions[questionNumber].0
        trueButton.backgroundColor = .clear
        falseButton.backgroundColor = .clear
        trueButton.rBorderColor = UIColor(hex: normalBorderButtonColor)
        falseButton.rBorderColor = UIColor(hex: normalBorderButtonColor)
        progressBar.progress = Float(questionNumber) / Float(questions.count)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAnswerResultModalSegue" {
            if let answerModalVC = segue.destination as? AnswerResultModalVC {
                answerModalVC.numberQuestion = questions.count
                answerModalVC.numberCorrectAnswer = numberCorrectAnswer
            }
            
        }
    }
    
}

