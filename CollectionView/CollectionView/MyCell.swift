//
//  MyCell.swift
//  CollectionView
//
//  Created by Глеб Бурштейн on 30.10.2020.
//

import UIKit

class MyCell: UICollectionViewCell {
    
    let imageButton: UIButton = {
        let control = UIButton()
        control.backgroundColor = .white
        control.layer.cornerRadius = 6.0
        control.clipsToBounds = false
        control.setImage(UIImage(named: "Profile"), for: .normal)
        control.translatesAutoresizingMaskIntoConstraints = false
        return control
    }()
    
    let dateLabel: UILabel = {
        let control = UILabel()
        control.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        control.textAlignment = .center
        control.textColor = UIColor.systemBlue
        control.text = "30"
        control.translatesAutoresizingMaskIntoConstraints = false
        return control
        
    }()
    
    let dayLabel: UILabel = {
        let control = UILabel()
        control.font = UIFont.systemFont(ofSize: 12)
        control.textAlignment = .center
        control.textColor = UIColor.systemBlue
        control.text = "Fri"
        control.translatesAutoresizingMaskIntoConstraints = false
        return control
        
    }()
    
    let distanceLabel: UILabel = {
        let control = UILabel()
        control.font = UIFont.systemFont(ofSize: 14)
        control.textColor = UIColor.lightGray
        control.text = "2000 meters"
        control.translatesAutoresizingMaskIntoConstraints = false
        return control
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func addView() {
        backgroundColor = .black
        
        addSubview(imageButton)
        addSubview(dateLabel)
        addSubview(dayLabel)
        // addSubview(distanceLabel)
        
        imageButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 5).isActive = true
        imageButton.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        imageButton.heightAnchor.constraint(equalToConstant: 36).isActive = true
        imageButton.widthAnchor.constraint(equalToConstant: 36).isActive = true
        
        dateLabel.centerYAnchor.constraint(equalTo: imageButton.centerYAnchor, constant: -6).isActive = true
        dateLabel.centerXAnchor.constraint(equalTo: imageButton.centerXAnchor, constant: -6).isActive = true
    }
    
}
