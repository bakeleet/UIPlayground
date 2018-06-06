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

    private var allVC: TableViewController?
    private var newVC: TableViewController?
    private var featuredVC: TableViewController?

    @IBAction func toggleMenu(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "toggleMenu"), object: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let tableId = "TableViewController"
        allVC = mainStoryboard.instantiateViewController(withIdentifier: tableId) as? TableViewController
        newVC = mainStoryboard.instantiateViewController(withIdentifier: tableId) as? TableViewController
        featuredVC = mainStoryboard.instantiateViewController(withIdentifier: tableId) as? TableViewController

        tabLayout.tabLayoutDelegate = self
        tabLayout.addTabs(tabs: [
                                    Tab(title: "All", image: nil, controller: allVC!),
                                    Tab(title: "New", image: nil, controller: newVC!),
                                    Tab(title: "Featured", image: nil, controller: featuredVC!)
                                ])

        //tabLayout.scrollView?.panGestureRecognizer.require(toFail: screenEdgePanGesture)
    }
}
