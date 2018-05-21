//
//  DataSource.swift
//  UIPlayground
//
//  Created by Krzysztof Niestrój.
//  Copyright © 2018 Krzysztof Niestrój. All rights reserved.
//

import UIKit

struct Color {
    let name: String
    let color: UIColor
}

struct DataSource {
    private var colors: [Color]

    init() {
        self.colors = [Color(name: "RED", color: UIColor(red: 252.0/255.0, green: 40.0/255.0, blue: 71.0/255.0, alpha: 1.0)),
                       Color(name: "BLUE", color: UIColor(red: 50.0/255.0, green: 74.0/255.0, blue: 178.0/255.0, alpha: 1.0)),
                       Color(name: "GREEN", color: UIColor(red: 197.0/255.0, green: 227.0/255.0, blue: 132.0/255.0, alpha: 1.0)),
                       Color(name: "ORANGE", color: UIColor(red: 255.0/255.0, green: 174.0/255.0, blue: 66.0/255.0, alpha: 1.0)),
                       Color(name: "BLACK", color: .black),
                       Color(name: "WHITE", color: .white)]
    }

    func getColor(forItemAt index: Int) -> Color {
        return colors[index]
    }

    func getColors() -> [Color] {
        return colors
    }

    func countColors() -> Int {
        return colors.count
    }
}
