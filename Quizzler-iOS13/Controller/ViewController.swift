//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var choiceOne: UIButton!
    @IBOutlet weak var choiceTwo: UIButton!
    @IBOutlet weak var choiceThree: UIButton!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!    // True or false
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        
        choiceOne.setTitle(quizBrain.getChoiceOne(), for: .normal)
        choiceTwo.setTitle(quizBrain.getChoiceTwo(), for: .normal)
        choiceThree.setTitle(quizBrain.getChoiceThree(), for: .normal)
        
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        choiceOne.backgroundColor = UIColor.clear
        choiceTwo.backgroundColor = UIColor.clear
        choiceThree.backgroundColor = UIColor.clear
    }
}
