//
//  ContainerViewController.swift
//  UIPlayground
//
//  Created by Krzysztof Niestrój.
//  Copyright © 2018 Krzysztof Niestrój. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {
    @IBOutlet weak var rightContainer: UIView!
    @IBOutlet weak var rightContainerDisabler: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var screenEdgePanGesture: UIScreenEdgePanGestureRecognizer!

    let leftMenuWidth: CGFloat = 260

    @IBAction func swipeRight(_ sender: Any) {
        openMenu()
    }

    @IBAction func swipeLeft(_ sender: Any) {
        closeMenu()
    }

    @IBAction func toggleDisabler(_ sender: Any) {
        closeMenu()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView?.isScrollEnabled = false
        scrollView.panGestureRecognizer.require(toFail: screenEdgePanGesture)

        DispatchQueue.main.async {
            self.closeMenu(animated: false)
        }

        NotificationCenter.default.addObserver(self,
                                               selector: #selector(ContainerViewController.toggleMenu),
                                               name: NSNotification.Name(rawValue: "toggleMenu"),
                                               object: nil)

        NotificationCenter.default.addObserver(self,
                                               selector: #selector(ContainerViewController.closeMenuViaNotification),
                                               name: NSNotification.Name(rawValue: "closeMenu"),
                                               object: nil)

        NotificationCenter.default.addObserver(self,
                                               selector: #selector(ContainerViewController.rotated),
                                               name: NSNotification.Name.UIDeviceOrientationDidChange,
                                               object: nil)
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    @objc func toggleMenu() {
        scrollView.contentOffset.x == 0  ? closeMenu() : openMenu()
    }

    @objc func closeMenuViaNotification() {
        closeMenu()
    }

    func closeMenu(animated: Bool = true) {
        scrollView.setContentOffset(CGPoint(x: leftMenuWidth, y: 0), animated: animated)
        rightContainer.isUserInteractionEnabled = true
        rightContainerDisabler.isUserInteractionEnabled = false
    }

    func openMenu() {
        scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
        rightContainer.isUserInteractionEnabled = false
        rightContainerDisabler.isUserInteractionEnabled = true
    }

    @objc func rotated() {
        if UIDeviceOrientationIsLandscape(UIDevice.current.orientation) {
            DispatchQueue.main.async {
                self.closeMenu()
            }
        }
    }
}
