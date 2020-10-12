//
//  MessageViewController.swift
//  ShowMe
//
//  Created by Глеб Бурштейн on 03.10.2020.
//

import UIKit

class MessageViewController: UIViewController {
    
    var messageData: String?
    @IBOutlet weak var messageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageLabel.text = messageData;
        
    }
}
