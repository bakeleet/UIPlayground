//
//  TextOnlyCell.swift
//  UIPlayground
//
//  Created by Krzysztof Niestrój.
//  Copyright © 2018 Krzysztof Niestrój. All rights reserved.
//

import UIKit

class TextOnlyCell: UITableViewCell {
    func configure() {
        textLabel?.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
                          + "Integer accumsan ullamcorper ipsum ut bibendum."
                          + "Pellentesque neque sapien, lacinia eu odio quis, volutpat mattis sem."
        textLabel?.numberOfLines = 5
    }
}
