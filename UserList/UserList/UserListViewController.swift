//
//  ViewController.swift
//  UserList
//
//  Created by Муслим on 14.02.2024.
//

import UIKit

final class UserListViewController: UIViewController {
    
    private let networkService = UserListNetworkService()
    
    private var isSearching = false
    
    private var items: [User] {
        isSearching ? searchedItems : fetchedItems
    }
    
    private var fetchedItems: [User] = []
    
    private var searchedItems: [User] = []
    
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.isHidden = true
        tableView.rowHeight = 80
        return tableView
    }()
    
    private let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.style = .large
        activityIndicator.startAnimating()
        return activityIndicator
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        tableView.register(UserListTableViewCell.self, forCellReuseIdentifier: UserListTableViewCell.reuseID)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        let searchController = UISearchController()
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        
        setupTableViewLayout()
        setupActivityIndicatorLayout()
        fetchData()
    }
    
    private func fetchData() {
        networkService.fetchData {[weak self] users in
            DispatchQueue.main.async{
                guard let self = self else {
                    return
                }
                self.activityIndicator.stopAnimating()
                self.fetchedItems = users
                self.tableView.isHidden = false
                self.tableView.reloadData()
            }
        }
    }
    
    private func setupTableViewLayout() {
        view.addSubview(tableView)
        
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    private func setupActivityIndicatorLayout() {
        view.addSubview(activityIndicator)
        
        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}

extension UserListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell (
            withIdentifier: UserListTableViewCell.reuseID,
            for: indexPath
        ) as? UserListTableViewCell else {
            fatalError ("Can not dequeue UserListTableViewCell")
        }
        
        let user = items[indexPath.row]
        
        cell.configuere(name: user.name, userName: user.username, mail: user.email)
        
        cell.selectionStyle = .none
        
        return cell
    }
}

extension UserListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = items[indexPath.row]
        
        let vc = UserInfoViewController(name: user.name, username: user.username, mail: user.email, phon: user.phone, site: user.website)
        
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension UserListViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {
            return
        }
        
        searchedItems = fetchedItems.filter { item in
            item.name.lowercased().contains(text.lowercased())
        }
        
        tableView.reloadData()
    }
}

extension UserListViewController: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        isSearching = true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        isSearching = false
    }
}
