//
//  DetailViewController.swift
//  CommitsApp
//
//  Created by Глеб Бурштейн on 29.11.2020.
//

import UIKit

class DetailViewController: UIViewController {

    var detailItem: Commit?
    @IBOutlet weak var detailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
            if let detail = self.detailItem {
                detailLabel.text = detail.message
                // navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Commit
        //1/\(detail.author.commits.count)", style: .plain, target: self, action:
        //#selector(showAuthorCommits))
        }
    }

}
