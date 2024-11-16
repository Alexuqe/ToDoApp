//
//  MenuViewController.swift
//  ToDoApp
//
//  Created by Sasha on 24.10.24.
//

import UIKit




class MenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private var trackList = Track.getTrackList()

    enum MenuOption: String, CaseIterable {
        case home = "Home"
        case info = "Information"
        case appRating = "App Raiting"
        case shareApp = "Share App"
        case settings = "Setings"
    }
 
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.backgroundColor = .none
        return tableView
    }()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = CGRect(
            x: 0,
            y: view.safeAreaInsets.top,
            width: view.bounds.size.width,
            height: view.bounds.size.height
        )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
        view.backgroundColor = .none
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let infoVC = segue.destination as? InfoViewController
        infoVC?.track = sender as? Track
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MenuOption.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        
        content.text = MenuOption.allCases[indexPath.row].rawValue
        content.imageProperties.cornerRadius = tableView.rowHeight / 2
        
        cell.backgroundColor = .none
        cell.contentView.backgroundColor = .none
        cell.contentConfiguration = content
        
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let row = MenuOption.allCases[indexPath.row].rawValue
        performSegue(withIdentifier: "showDetails", sender: row)
    }


}
