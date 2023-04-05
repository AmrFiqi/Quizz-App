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
    @IBOutlet var progressBar: UIImageView!
    @IBOutlet var falseButton: UIButton!
    
    // MARK: - Class Variables
    
    let quizz = [
    Questions(text: "Sharks are mammals.", answer: "False"),
    Questions(text: "Sea otters have a favorite rock they use to break open food.", answer: "True"),
    Questions(text: "The blue whale is the biggest animal to have ever lived.", answer: "True"),
    Questions(text: "The hummingbird egg is the world's smallest bird egg.", answer: "True"),
    Questions(text: "Bats are blind.", answer: "False"),
    Questions(text: "An octopus has seven hearts.", answer: "False"),
    Questions(text: "Herbivores are animal eaters.", answer: "False"),
    ]
    var questionNumber = 0
    
    // MARK: - Class Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupQuestions()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle
        let actualAnswer = quizz[questionNumber].answer
        
        if userAnswer == actualAnswer {
            print("Correct")
        }
        else {
            print("Wrong")
        }
        
        nextQuestion()
        setupQuestions()
    }
    
    func setupQuestions() {
        questionLabel.text = quizz[questionNumber].text
    }
    
    func nextQuestion() {
        if questionNumber < quizz.count-1 {
            questionNumber += 1
        }
        else {
            questionNumber = 0
        }
    }
}

