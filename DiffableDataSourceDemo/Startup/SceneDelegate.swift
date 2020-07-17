//
//  SceneDelegate.swift
//  DiffableDataSourceDemo
//
//  Created by Ahmed Komsan on 13/07/2020.
//  Copyright © 2020 akomsan. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
         
           let window = UIWindow(windowScene: windowScene)
           let navController = UINavigationController(rootViewController:  ContactsTableViewController())
           window.rootViewController = navController
           window.makeKeyAndVisible()
           self.window = window
    }

}

