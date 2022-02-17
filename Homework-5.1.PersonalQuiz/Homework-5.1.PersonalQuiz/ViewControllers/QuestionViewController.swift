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
    @IBOutlet weak var rangedSlider: UISlider! {
        didSet {
            let answerCount = Float(currentAnswers.count - 1)
            rangedSlider.maximumValue = answerCount
            rangedSlider.value = answerCount / 2
        }
    }
    
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let resultVC = segue.destination as? ResultsViewController else { return }
        resultVC.answers = answerChoosen
    }
        
    @IBAction func singleButtonAnswerPressed(_ sender: UIButton) {
        guard let buttonIndex = singleQuestionButtons.firstIndex(of: sender) else { return }
        let currentAnswer = currentAnswers[buttonIndex]
        answerChoosen.append(currentAnswer)
        nextQuestion()
    }
    
    @IBAction func multipleAnswerButtonPressed() {
        for (multipleSwitch, answer) in zip(multipleQuestionSwitches, currentAnswers) {
            if multipleSwitch.isOn {
                answerChoosen.append(answer)
            }
        }
        nextQuestion()
    }
    
    @IBAction func rangedAnswerButtonPressed() {
        let index = lrintf(rangedSlider.value)
        answerChoosen.append(currentAnswers[index])
        nextQuestion()
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
            showMultipleQuestionsStackView(with: currentAnswers)
        case .ranged:
            showRangedvQuestionsStackView(with: currentAnswers)
        }
    }
    
    private func nextQuestion() {
        questionIndex += 1
        if questionIndex < questions.count {
            setupUI()
            return
        }
            
        //performSegue(withIdentifier: "showResult", sender: nil)
    }
    
    private func showSingleQuestionsStackView(with answers: [Answer]) {
        singleQuestionStackView.isHidden = false
        
        for (button, answer) in zip(singleQuestionButtons, answers) {
            button.setTitle(answer.title, for: .normal)
        }
    }
    
    private func showMultipleQuestionsStackView(with answers: [Answer]) {
        multipleQuestionStackView.isHidden = false
        
        for (label, answer) in zip(multipleQuestionLabels, answers) {
            label.text = answer.title
        }
        
    }
    
    private func showRangedvQuestionsStackView(with answers: [Answer]) {
        rangedQuestionStackView.isHidden = false
        rangedQuestionLabels.first?.text = answers.first?.title
        rangedQuestionLabels.last?.text = answers.last?.title
    }
    
}
