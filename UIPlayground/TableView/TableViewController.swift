//
//  TableViewController.swift
//  UIPlayground
//
//  Created by Krzysztof Niestrój.
//  Copyright © 2018 Krzysztof Niestrój. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet var tableView: UITableView!

    private var data: [Int] = []

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        for _ in 1...100 {
            data.append(Int(arc4random_uniform(2)))
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let randomDataForCell = data[indexPath.row]

        if randomDataForCell == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "textOnlyCell",
                                                           for: indexPath) as? TextOnlyCell
                else { return UITableViewCell() }
            cell.configure()
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "textAndImageCell",
                                                           for: indexPath) as? TextAndImageCell
                else { return UITableViewCell() }
            cell.configure()
            return cell
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}
