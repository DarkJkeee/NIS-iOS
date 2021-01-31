//
//  TripCollectionViewCell.swift
//  TripCard
//
//  Created by Глеб Бурштейн on 24.01.2021.
//

import UIKit

class TripCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var totalDaysLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    
    var isLiked: Bool = false {
        didSet {
            if isLiked {
                likeButton.setImage(UIImage(named: "heartfull"), for: .normal)
            } else {
                likeButton.setImage(UIImage(named: "heart"), for: .normal)
            }
        }
    }
    
}
