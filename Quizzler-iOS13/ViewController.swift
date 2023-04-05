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
        Questions(q: "A slug's blood is green.", a: "True"),
        Questions(q: "Approximately one quarter of human bones are in the feet.", a: "True"),
        Questions(q: "The total surface area of two human lungs is approximately 70 square metres.", a: "True"),
        Questions(q: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", a: "True"),
        Questions(q: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", a:"False"),
        Questions(q: "It is illegal to pee in the Ocean in Portugal.", a: "True"),
        Questions(q: "You can lead a cow down stairs but not up stairs.", a: "False"),
        Questions(q: "Google was originally called 'Backrub'.", a: "True"),
        Questions(q: "Buzz Aldrin's mother's maiden name was 'Moon'.", a: "True"),
        Questions(q: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", a: "False"),
        Questions(q: "No piece of square dry paper can be folded in half more than 7 times.", a: "False"),
        Questions(q: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", a: "True")

    ]
    var questionNumber = 0
    
    // MARK: - Class Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle
        let actualAnswer = quizz[questionNumber].answer
        
        if userAnswer == actualAnswer {
            sender.backgroundColor = .green
        }
        else {
            sender.backgroundColor = .red
        }
        let seconds = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) { [self] in
            // Put your code which should be executed with a delay here
            self.nextQuestion()
            self.updateUI()
        }
        
    }
    
    func updateUI() {
        trueButton.backgroundColor = .clear
        falseButton.backgroundColor = .clear
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

