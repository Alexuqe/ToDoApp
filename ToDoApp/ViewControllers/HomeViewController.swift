//
//  HomeViewController.swift
//  ToDoApp
//
//  Created by Sasha on 24.10.24.
//

import UIKit

protocol HomeViewControllerDelegate: AnyObject {
    func didTap()
}


class HomeViewController: UIViewController {
    
    weak var delegate: HomeViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray5
        title = " Home View"
        navigationItem.titleView?.tintColor = .black
            
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "list.dash"),
            style: .done,
            target: self,
            action: #selector(barButtonTapped)
        )
        
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
    
    @objc func barButtonTapped() {
        delegate?.didTap()
    }
    


}
