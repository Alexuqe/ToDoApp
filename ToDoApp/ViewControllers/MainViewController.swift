//
//  ViewController.swift
//  ToDoApp
//
//  Created by Sasha on 24.10.24.
//

import UIKit

class MainViewController: UIViewController {
    
    private var trackList = Track.getTrackList()
    
    enum MenuState {
        case opened
        case closed
    }
    
    private var menuState: MenuState = .closed
    
    let menuVC = MenuViewController()
    let homeVC = HomeViewController()
    var navVC: UINavigationController?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChildsVC()
        
    }
    
    private func addChildsVC() {
        addChild(menuVC)
        view.addSubview(menuVC.view)
        menuVC.didMove(toParent: self)
        
        homeVC.delegate = self
        let navigationVC = UINavigationController(rootViewController: homeVC)
        addChild(navigationVC)
        view.addSubview(navigationVC.view)
        navigationVC.didMove(toParent: self)
        self.navVC = navigationVC
    }
}

extension MainViewController: HomeViewControllerDelegate {
    func didTap() {
        switch menuState {
            case .closed:
                UIView
                    .animate(
                        withDuration: 0.5,
                        delay: 0,
                        usingSpringWithDamping: 0.8,
                        initialSpringVelocity: 0,
                        options: .curveEaseInOut) {
                            self.navVC?.view.frame.origin.x = self.homeVC.view.frame.size.width - 200
                        } completion: { [weak self](done) in
                            if done {
                                self?.menuState = .opened
                            }
                        }

            case .opened:
                UIView
                    .animate(
                        withDuration: 0.5,
                        delay: 0,
                        usingSpringWithDamping: 0.8,
                        initialSpringVelocity: 0,
                        options: .curveEaseInOut) {
                            self.navVC?.view.frame.origin.x = 0
                        } completion: { [weak self](done) in
                            if done {
                                self?.menuState = .closed
                            }
                        }
        }
    }

}

