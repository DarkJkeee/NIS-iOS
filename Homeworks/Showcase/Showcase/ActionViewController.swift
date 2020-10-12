//
//  ActionViewController.swift
//  Showcase
//
//  Created by Глеб Бурштейн on 04.10.2020.
//

import UIKit

class ActionViewController: UIViewController {

    @IBOutlet weak var actionControl: UISegmentedControl!
    @IBOutlet weak var showmeButton: UIButton!
    
    @IBAction func performAction(_ sender: UIButton) {
        if actionControl.selectedSegmentIndex == 0 {
            let controller = UIAlertController(title: "This is an alert", message: "You've created an alert view", preferredStyle: UIAlertController.Style.alert)
                                         
            controller.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: { alert in controller.dismiss(animated: true, completion: nil) } ))
            present(controller, animated: true);
            
        } else {
            let controller = UIAlertController(title: "This is an action sheet", message: "You've created an a action sheet", preferredStyle: UIAlertController.Style.actionSheet)
                                         
            controller.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: { alert in controller.dismiss(animated: true, completion: nil) } ))
            present(controller, animated: true);
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showmeButton.backgroundColor = UIColor(red: 9/255.0, green: 95/255.0, blue: 134/255.0, alpha: 1.0)
        showmeButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
        showmeButton.layer.cornerRadius = 5.0
        // Do any additional setup after loading the view.
    }

}
