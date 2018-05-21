//
//  CollectionViewCell.swift
//  UIPlayground
//
//  Created by Krzysztof Niestrój.
//  Copyright © 2018 Krzysztof Niestrój. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet var button: UIButton!

    var cellColor: Color?
    var didSelectColor: ((UIColor) -> ())?

    @IBAction func didTap(button: UIButton) {
        guard let didSelectColor = didSelectColor, let cellColor = cellColor else { return }

        didSelectColor(cellColor.color)
    }

    func configure(for color: Color, didSelectColor: ((UIColor) -> ())? = nil) {
        self.cellColor = color
        self.didSelectColor = didSelectColor

        button.setTitle(color.name, for: .normal)
    }
}
