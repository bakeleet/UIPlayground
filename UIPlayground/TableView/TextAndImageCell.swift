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
    @IBOutlet var infoImage: UIImageView!
    @IBOutlet var descriptionLabel: UILabel!

    func configure() {
        titleLabel.text? = "Apple Worldwide Developers Conference"
        descriptionLabel.text? = "San Jose, CA, June 4-8"
        infoImage.image = UIImage(named: "wwdc2018")
    }
}
