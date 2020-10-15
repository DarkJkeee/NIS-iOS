//
//  ViewController.swift
//  ShowMe
//
//  Created by Глеб Бурштейн on 03.10.2020.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func showMe(_ sender: UIButton) {
        NSLog("User Wrote: %@", textField.text!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let messageView = segue.destination as! MessageViewController
        messageView.messageData = textField.text;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

