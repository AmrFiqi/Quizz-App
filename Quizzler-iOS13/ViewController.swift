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
    "Sharks are mammals.",
    "Sea otters have a favorite rock they use to break open food.",
    "The blue whale is the biggest animal to have ever lived.",
    "The hummingbird egg is the world's smallest bird egg.",
    "Bats are blind.",
    "An octopus has seven hearts.",
    "Herbivores are animal eaters."
    ]
    var questionNumber = 0
    
    // MARK: - Class Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupQuestions()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        questionNumber += 1
        setupQuestions()
    }
    
    func setupQuestions() {
        if questionNumber <= quizz.count-1 {
            questionLabel.text = quizz[questionNumber]
        }
        else {
            questionLabel.text = quizz.last
        }
    }
}

