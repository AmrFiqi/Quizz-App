//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - UI Variables
    
    @IBOutlet var trueButton: UIButton!
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var progressBar: UIProgressView!
    @IBOutlet var falseButton: UIButton!
    
    // MARK: - Struct Objects
    
    var quizBrain = QuizBrain()
    
    
    // MARK: - Class Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        
        
        if quizBrain.checkAnswer(userAnswer) {
            sender.backgroundColor = .green
        }
        else {
            sender.backgroundColor = .red
        }
        
        updateQuestions()
        
    }
    
    func updateUI() {
        trueButton.backgroundColor = .clear
        falseButton.backgroundColor = .clear
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgressBar()
    }
    
    
    func updateQuestions() {
        let seconds = 0.2
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) { [self] in
            // Put your code which should be executed with a delay here
            self.quizBrain.nextQuestion()
            self.updateUI()
        }
    }
}

