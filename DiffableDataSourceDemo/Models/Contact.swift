//
//  Contact.swift
//  DiffableDataSourceDemo
//
//  Created by Ahmed Komsan on 14/07/2020.
//  Copyright © 2020 akomsan. All rights reserved.
//

import Foundation

struct Contact : Hashable {
    
    var id = UUID()
    var firstName: String
    var lastName: String
    var emailAddress: String
    
    
    init(firstName: String, lastName: String, emailAddress: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.emailAddress = emailAddress
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Contact, rhs: Contact) -> Bool {
        lhs.id == rhs.id
    }
}

extension Contact {
    
    static var friendsContacts: [Contact] = [
        Contact(firstName: "Sally", lastName: "Payne", emailAddress: "spayne@yahoo.com"),
        Contact(firstName: "Adrian", lastName: "Murray", emailAddress: "amurray@gmail.com"),
        Contact(firstName: "Nicola", lastName: "Chapman", emailAddress: "nchapman@yahoo.com"),
    ]
    
    static var allContacts: [Contact] = [
        Contact(firstName: "Katherine", lastName: "Reid", emailAddress: "kreid@yahoo.com"),
        Contact(firstName: "Brandon", lastName: "Morgan", emailAddress: "kreid@gmail.com"),
        Contact(firstName: "Frank", lastName: "Ball", emailAddress: "fball@yahoo.com"),
        Contact(firstName: "Felicity", lastName: "Black", emailAddress: "fblack@gmail.com"),
        Contact(firstName: "Sally", lastName: "Payne", emailAddress: "spayne@yahoo.com"),
        Contact(firstName: "Luke", lastName: "Morgan", emailAddress: "lmorgan@gmail.com"),
        Contact(firstName: "Joanne", lastName: "Parr", emailAddress: "jparr@yahoo.com"),
        Contact(firstName: "Steven", lastName: "Butler", emailAddress: "sbutler@gmail.com"),
        Contact(firstName: "Abigail", lastName: "Burgess", emailAddress: "aburgess@yahoo.com"),
        Contact(firstName: "Faith", lastName: "Hudson", emailAddress: "fhudson@gmail.com"),
        Contact(firstName: "Dorothy", lastName: "Tucker", emailAddress: "dtucker@yahoo.com"),
        Contact(firstName: "Jake", lastName: "White", emailAddress: "jwhite@gmail.com"),
        Contact(firstName: "Brian", lastName: "North", emailAddress: "bnorth@yahoo.com"),
        Contact(firstName: "Elizabeth", lastName: "James", emailAddress: "ejames@gmail.com"),
        Contact(firstName: "Eric", lastName: "Roberts", emailAddress: "eroberts@yahoo.com"),
        Contact(firstName: "Jonathan", lastName: "Davies", emailAddress: "jdavies@gmail.com"),
        Contact(firstName: "Carolyn", lastName: "Wilson", emailAddress: "cwilson@yahoo.com"),
        Contact(firstName: "Adrian", lastName: "Murray", emailAddress: "amurray@gmail.com"),
        Contact(firstName: "Nicola", lastName: "Chapman", emailAddress: "nchapman@yahoo.com"),
        Contact(firstName: "Sonia", lastName: "Vance", emailAddress: "svance@gmail.com"),
    ]
}

