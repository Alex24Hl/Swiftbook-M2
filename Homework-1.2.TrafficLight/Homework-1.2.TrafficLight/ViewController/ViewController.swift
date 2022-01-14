//
//  ViewController.swift
//  Homework-1.2.TrafficLight
//
//  Created by Александр Холод on 14.01.2022.
//
import UIKit

enum ColorOfTrafficLight {
    case redLight
    case yellowLight
    case greenLight
}

class ViewController: UIViewController {
    @IBOutlet weak var redLightView: UIView!
    @IBOutlet weak var yellowLightView: UIView!
    @IBOutlet weak var greenLightView: UIView!
    @IBOutlet weak var startButton: UIButton!
    
    private lazy var currentColor = ColorOfTrafficLight.redLight
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillLayoutSubviews() {
        startButton.layer.cornerRadius = 10
        redLightView.layer.cornerRadius = redLightView.frame.width / 2
        yellowLightView.layer.cornerRadius = redLightView.frame.width / 2
        greenLightView.layer.cornerRadius = greenLightView.frame.width / 2
    }
    
    @IBAction func startButtonAction() {
        startButton.setTitle("NEXT", for: .normal)
        
        switch currentColor {
        case .redLight:
            redLightView.alpha = 1
            yellowLightView.alpha = 0.3
            greenLightView.alpha = 0.3
            currentColor = ColorOfTrafficLight.yellowLight
        case .yellowLight:
            redLightView.alpha = 0.3
            yellowLightView.alpha = 1
            greenLightView.alpha = 0.3
            currentColor = ColorOfTrafficLight.greenLight
        case .greenLight:
            redLightView.alpha = 0.3
            yellowLightView.alpha = 0.3
            greenLightView.alpha = 1
            currentColor = ColorOfTrafficLight.redLight
        }
    }
}
