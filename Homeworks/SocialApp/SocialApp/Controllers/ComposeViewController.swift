//
//  ComposeViewController.swift
//  SocialApp
//
//  Created by Глеб Бурштейн on 29.11.2020.
//

import UIKit

class ComposeViewController: UIViewController {

    @IBOutlet weak var tweetContent: UITextView!
    
    @IBOutlet weak var postButton: UIButton!
    @IBOutlet weak var postActivity: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        postButton.layer.cornerRadius = 5.0
        tweetContent.layer.cornerRadius = 5.0
    }
    
    @IBAction func dismissView(_ sender: UIButton) {
    }
    
    @IBAction func postToTwitter(_ sender: UIButton) {
    }

}
