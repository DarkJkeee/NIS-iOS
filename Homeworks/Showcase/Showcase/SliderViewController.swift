//
//  SliderViewController.swift
//  Showcase
//
//  Created by Глеб Бурштейн on 04.10.2020.
//

import UIKit

class SliderViewController: UIViewController, UITextFieldDelegate {
    
    var redColor: CGFloat = 1.0
    var greenColor: CGFloat = 1.0
    var blueColor: CGFloat = 1.0
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var redValue: UITextField!
    @IBOutlet weak var greenValue: UITextField!
    @IBOutlet weak var blueValue: UITextField!
    
    
    @IBAction func changeRed(_ sender: UISlider) {
        redColor = CGFloat(redSlider.value);
        redValue.text = String(format: "%0d", Int(redColor * 255));
        updateColors();
    }
    
    @IBAction func changeGreen(_ sender: UISlider) {
        greenColor = CGFloat(greenSlider.value);
        greenValue.text = String(format: "%0d", Int(greenColor * 255));
        updateColors();
    }
    
    @IBAction func changeBlue(_ sender: UISlider) {
        blueColor = CGFloat(blueSlider.value);
        blueValue.text = String(format: "%d", Int(blueColor * 255))
        updateColors();
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        redValue.delegate = self;
        greenValue.delegate = self;
        blueValue.delegate = self;
        
        updateColors();
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder();
        return true
    }
    
    func updateColors() {
        view.backgroundColor = UIColor(red: redColor, green: greenColor, blue: blueColor, alpha: 1.0);
    }
    
    
}
