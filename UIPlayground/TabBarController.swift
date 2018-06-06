//
//  TabBarController.swift
//  UIPlayground
//
//  Created by Krzysztof Niestrój.
//  Copyright © 2018 Krzysztof Niestrój. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()

        self.delegate = self

        NotificationCenter.default.addObserver(self,
                                               selector: #selector(TabBarController.toggleMostViewed),
                                               name: NSNotification.Name(rawValue: "toggleMostViewed"),
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(TabBarController.toggleFeatured),
                                               name: NSNotification.Name(rawValue: "toggleFeatured"),
                                               object: nil)
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    func toggleTab(for index: Int) {
        self.selectedIndex = index
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "closeMenu"), object: nil)
    }

    @objc func toggleMostViewed() {
        toggleTab(for: 0)
    }

    @objc func toggleFeatured() {
        toggleTab(for: 1)
    }
}
