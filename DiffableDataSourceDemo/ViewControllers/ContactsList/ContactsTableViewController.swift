//
//  ViewController.swift
//  DiffableDataSourceDemo
//
//  Created by Ahmed Komsan on 13/07/2020.
//  Copyright © 2020 akomsan. All rights reserved.
//

import UIKit

enum Section : Int, CaseIterable {
    case friendsContacts
    case allContacts
}

class ContactsTableViewController: UITableViewController {
    
    private var friendsContacts : [Contact] = Contact.friendsContacts
    private var allContacts : [Contact] = Contact.allContacts
    private var searchController = UISearchController(searchResultsController: nil)
    typealias DataSource = UITableViewDiffableDataSource<Section, Contact>
    private lazy var dataSource = makeDataSource()
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Contact>
    
    init(){
        super.init(style: .grouped)
        self.tableView.register(ContactTableCell.self, forCellReuseIdentifier: ContactTableCell.reuseIdentifier)
        self.tableView.register(SectionHeaderReusableView.self, forHeaderFooterViewReuseIdentifier: SectionHeaderReusableView.reuseIdentifier)
        self.title = "Contacts"
        self.view.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        configureSearchController()
        applySnapshot(animatingDifferences: false)
    }
    
    // MARK:- DataSource
    
    func makeDataSource() -> DataSource {
        let dataSource = DataSource(tableView: tableView, cellProvider: {( tableView, indexPath, contact) -> UITableViewCell? in
            
            let cell = tableView.dequeueReusableCell(withIdentifier: ContactTableCell.reuseIdentifier, for: indexPath) as? ContactTableCell
            cell?.configure(with: contact)
            return cell
        })
        
        return dataSource
    }
    
    func applySnapshot(animatingDifferences: Bool = true) {
        var snapshot = Snapshot()
        snapshot.appendSections( Section.allCases )
        snapshot.appendItems(friendsContacts, toSection: .friendsContacts)
        snapshot.appendItems(allContacts, toSection: .allContacts)
        dataSource.apply(snapshot, animatingDifferences: animatingDifferences)
    }
    
}

// MARK: - UISearchResultsUpdating Delegate

extension ContactsTableViewController: UISearchResultsUpdating {
    
    func configureSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Contacts"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        
        let myContacts = Contact.allContacts
        let myFriends = Contact.friendsContacts
        if let text = searchController.searchBar.text, !text.isEmpty {
            allContacts = myContacts.filter { contact in
                return contact.firstName.contains(text) || contact.lastName.contains(text)
            }
            friendsContacts = myFriends.filter { contact in
                return contact.firstName.contains(text) || contact.lastName.contains(text)
            }
        } else {
            allContacts = myContacts
            friendsContacts = myFriends
        }
        applySnapshot()
    }
}

// MARK: - UITableViewDelegate

extension ContactsTableViewController {
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(
            withIdentifier: SectionHeaderReusableView.reuseIdentifier) as? SectionHeaderReusableView
            else {
                return nil
        }
        
        if section == Section.allContacts.rawValue {
            header.titleLabel.text = "Your Contacts"
        } else {
            header.titleLabel.text = "Friends Contacts"
        }
        
        return header
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
}


