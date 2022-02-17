//
//  ResultsViewController.swift
//  Homework-5.1.PersonalQuiz
//
//  Created by Александр Холод on 16.02.2022.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var animalTypeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var answers: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        updateResult()
    }
}

// MARK: - Private Methods

extension ResultsViewController {
    
    private func updateResult() {
        
        let mostFrequencyAnimal = Dictionary(grouping: answers) { $0.type }
            .sorted { $0.value.count > $1.value.count }
            .first?.key
        
        updateUI(with: mostFrequencyAnimal)
    }
    
    
    
    private func updateUI(with animal: AnimalType?) {
        animalTypeLabel.text = "Вы - \(animal?.rawValue ?? "🐶")!"
        descriptionLabel.text = animal?.definition ?? ""
    }
    
}
