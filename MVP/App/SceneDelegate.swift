//
//  SceneDelegate.swift
//  MVP
//
//  Created by mariemik on 09/03/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    let coordinator = EditProfileCoordinator()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        let viewController = EditProfileViewController(delegate: coordinator,
                                                        presenter: EditProfilePresenter.make())
        window.rootViewController = viewController
        window.makeKeyAndVisible()
        self.window = window
    }
}

