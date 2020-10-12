//
//  ViewController.swift
//  ShowMe
//
//  Created by Глеб Бурштейн on 03.10.2020.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let messageView = segue.destination as! MessageViewController
        messageView.messageData = textField.text;
    }


}

