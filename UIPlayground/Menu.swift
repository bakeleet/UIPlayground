//
//  Menu.swift
//  UIPlayground
//
//  Created by Krzysztof Niestrój.
//  Copyright © 2018 Krzysztof Niestrój. All rights reserved.
//

import UIKit

class Menu: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet var tableView: UITableView!

    private let data = ["Most Viewed", "Featured"]


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "toggleMostViewed"), object: nil)
        case 1:
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "toggleFeatured"), object: nil)
        default:
            print("do nothing")
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}
