//
//  SceneDelegate.swift
//  SOLSOL
//
//  Created by 변희주 on 2023/05/13.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?

  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

      guard let windowScene = (scene as? UIWindowScene) else { return }
      self.window = UIWindow(windowScene: windowScene)
      let navigationController = UINavigationController(rootViewController: SOLTabBarController())
      self.window?.rootViewController = navigationController
      self.window?.makeKeyAndVisible()
  }
}
