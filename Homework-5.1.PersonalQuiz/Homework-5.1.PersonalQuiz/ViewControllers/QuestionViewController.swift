//
//  QuestionViewController.swift
//  Homework-5.1.PersonalQuiz
//
//  Created by Александр Холод on 11.02.2022.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var singleQuestionStackView: UIStackView!
    @IBOutlet var singleQuestionButtons: [UIButton]!
    
    @IBOutlet weak var multipleQuestionStackView: UIStackView!
    @IBOutlet var multipleQuestionLabels: [UILabel]!
    @IBOutlet var multipleQuestionSwitches: [UISwitch]!
    
    @IBOutlet weak var rangedQuestionStackView: UIStackView!
    @IBOutlet var rangedQuestionLabels: [UILabel]!
    @IBOutlet weak var rangedSlider: UISlider!
    
    @IBOutlet weak var questionProgressView: UIProgressView!
    
    private let questions = Question.getQuestions()
    private var answerChoosen: [Answer] = []
    private var currentAnswers: [Answer] {
        questions[questionIndex].answers
    }
    private var questionIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
        
    @IBAction func singleButtonAnswerPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func multipleAnswerButtonPressed() {
        
    }
    
    
    @IBAction func rangedAnswerButtonPressed() {
    }
    
}

// MARK: - Private Methods
extension QuestionViewController {
    private func setupUI() {
        // Скрыть стеки
        for stackView in [singleQuestionStackView, multipleQuestionStackView, rangedQuestionStackView] {
            stackView?.isHidden = true
        }
        
        // Показать текущий вопрос
        let currentQuestion = questions[questionIndex]
        
        // Установим текущий вопрос для нашего лэйба с вопросами
        questionLabel.text = currentQuestion.title
        
        // Настройка ProgressView
        let totalProgress = Float(questionIndex) / Float(questions.count)
        
        // Установка значений в ProgressView
        questionProgressView.setProgress(totalProgress, animated: true)
        
        // Установим номер вопроса в navigation bar
        title = "Вопрос № \(questionIndex + 1) из \(questions.count)"
        
        // Отобразить текущие ответы (стеки)
        showCurrentAnswers(for: currentQuestion.type)
    }
    
    private func showCurrentAnswers(for type: ResponseType) {
        switch type{
        case .single:
            showSingleQuestionsStackView(with: currentAnswers)
        case .multiple:
            break
        case .ranged:
            break
        }
    }
    
    private func showSingleQuestionsStackView(with answers: [Answer]) {
        singleQuestionStackView.isHidden = false
        
        for (button, answer) in zip(singleQuestionButtons, answers) {
            button.setTitle(answer.title, for: .normal)
        }
        
        
        
    }
    
    private func showMultipleQuestionsStackView() {
        
    }
    
    private func showRangedvQuestionsStackView() {
        
    }
    
}
