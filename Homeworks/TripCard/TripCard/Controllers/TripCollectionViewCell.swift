//
//  TripCollectionViewCell.swift
//  TripCard
//
//  Created by Глеб Бурштейн on 31.01.2021.
//

import UIKit

protocol TripCollectionCellDelegate {
    func didLikeButtonPressed(cell: TripCollectionViewCell)
}

class TripCollectionViewCell: UICollectionViewCell {
    
    var delegate: TripCollectionCellDelegate?
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var countryLabel: UILabel!
    @IBOutlet var totalDaysLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var likeButton: UIButton!
    
    var isLiked: Bool = false {
        didSet {
            if isLiked {
                likeButton.setBackgroundImage(UIImage(systemName: "heart.fill"), for: .normal)
            } else {
                likeButton.setBackgroundImage(UIImage(systemName: "heart"), for: .normal)
            }
        }
    }
    @IBAction func likeButtonTapped(_ sender: UIButton) {
        delegate?.didLikeButtonPressed(cell: self)
    }
}
