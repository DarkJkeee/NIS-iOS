//
//  ViewController.swift
//  InTouchApp
//
//  Created by Глеб Бурштейн on 28.10.2020.
//

import UIKit
import MessageUI

class ViewController: UIViewController, MFMailComposeViewControllerDelegate, MFMessageComposeViewControllerDelegate {
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        switch result {
        case MessageComposeResult.sent:
            print("Result: Text Message Sent!")
        case MessageComposeResult.cancelled:
            print("Result: Text Message Cancelled.")
        case MessageComposeResult.failed:
            print("Result: Error, Unable to Send Text Message.")
        }
        self.dismiss(animated:true, completion: nil)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        switch result {
            case MFMailComposeResult.sent:
                print("Result: Email Sent!")
            case MFMailComposeResult.cancelled:
                print("Result: Email Cancelled.")
            case MFMailComposeResult.failed:
                print("Result: Error, Unable to Send Email.")
            case MFMailComposeResult.saved:
                print("Result: Mail Saved as Draft.")
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func sendEmail(_ sender: UIButton) {
        if MFMailComposeViewController.canSendMail() {
            let mailVC = MFMailComposeViewController()
            mailVC.setSubject("MySubject")
            mailVC.setToRecipients(["burshtejn2000@mail.ru"])
            mailVC.setMessageBody("<p>Hi, Mark!<p>", isHTML: true)
            mailVC.mailComposeDelegate = self
            self.present(mailVC, animated: true, completion: nil)
        }
        else {
            print("This device is currently unable to send email!")
        }
    }
    
    @IBAction func openWebsite(_ sender: UIButton) {
        UIApplication.shared.open(URL(string: "https://hse.ru")!, options: [:], completionHandler: nil)
    }
    
    @IBAction func sendText(_ sender: UIButton) {
        if MFMessageComposeViewController.canSendText() {
            let smsVC = MFMessageComposeViewController()
            smsVC.messageComposeDelegate = self
            smsVC.recipients = ["1234500000"]
            smsVC.body = "Please call me back."
            self.present(smsVC, animated: true, completion: nil)
        } else {
            print("This device is currently unable to send text messages")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
        
    }

}

