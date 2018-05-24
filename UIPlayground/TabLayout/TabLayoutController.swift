//
//  TabLayoutController.swift
//  UIPlayground
//
//  Created by Krzysztof Niestrój.
//  Copyright © 2018 Krzysztof Niestrój. All rights reserved.
//

import UIKit

class TabLayoutController: UIViewController, TabLayoutDelegate {
    @IBOutlet weak var tabLayout: TabLayout!
    
    private var firstViewController: TableViewController?
    private var secondViewController: TableViewController?
    private var thirdViewController: TableViewController?


    @IBAction func toggleMenu(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "toggleMenu"), object: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)

        firstViewController = mainStoryboard.instantiateViewController(withIdentifier: "TableViewController") as? TableViewController

        secondViewController = mainStoryboard.instantiateViewController(withIdentifier: "TableViewController") as? TableViewController

        thirdViewController = mainStoryboard.instantiateViewController(withIdentifier: "TableViewController") as? TableViewController

        tabLayout.tabLayoutDelegate = self
        tabLayout.addTabs(tabs: [
                                    ("ALL", nil, firstViewController!),
                                    ("NEW", nil, secondViewController!),
                                    ("FEATURED", nil, thirdViewController!)
                                ])
    }
}
