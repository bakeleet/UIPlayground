//
//  TextAndImageCell.swift
//  UIPlayground
//
//  Created by Krzysztof Niestrój.
//  Copyright © 2018 Krzysztof Niestrój. All rights reserved.
//

import UIKit

class TextAndImageCell: UITableViewCell {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var funnyImage: UIImageView!
    @IBOutlet var descriptionLabel: UILabel!


    func configure() {
        titleLabel.text? = "Lorem ipsum dolor sit amet"
        descriptionLabel.text? = "..., consectetur adipiscing elit."
        funnyImage.image = UIImage(named: "monkey")
    }
}
