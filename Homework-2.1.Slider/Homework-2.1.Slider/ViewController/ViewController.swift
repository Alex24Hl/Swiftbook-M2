//
//  ViewController.swift
//  Homework-2.1.Slider
//
//  Created by Александр Холод on 17.01.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var redSliderValue: UILabel!
    @IBOutlet weak var greenSliderValue: UILabel!
    @IBOutlet weak var blueSliderValue: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var display: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        display.layer.cornerRadius = 10
        
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        blueSlider.minimumTrackTintColor = .blue
        
        redSliderValue.text = String(redSlider.value)
        greenSliderValue.text = String(greenSlider.value)
        blueSliderValue.text = String(blueSlider.value)
    }
    
    
    @IBAction func redSliderAction() {
        redSliderValue.text = String(format: "%.2f", redSlider.value)
        display.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                          green: CGFloat(greenSlider.value),
                                          blue: CGFloat(blueSlider.value),
                                          alpha: 1)
    }
    
    @IBAction func greenSliderAction() {
        greenSliderValue.text = String(format: "%.2f", greenSlider.value)
        display.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                          green: CGFloat(greenSlider.value),
                                          blue: CGFloat(blueSlider.value),
                                          alpha: 1)
    }
    
    @IBAction func blueSliderAction() {
        blueSliderValue.text = String(format: "%.2f", blueSlider.value)
        display.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                          green: CGFloat(greenSlider.value),
                                          blue: CGFloat(blueSlider.value),
                                          alpha: 1)
    }
    


}

