//
//  SOLTabBarController.swift
//  SOLSOL
//
//  Created by 김민재 on 2023/05/16.
//

import UIKit

final class SOLTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setTabBarControllers()
    }

}

extension SOLTabBarController {
    private func setStyle() {
        tabBar.backgroundColor = .white
        tabBar.isTranslucent = false
        tabBar.tintColor = .blue600
        setUpTabBar()
    }

    private func setTabBarControllers() {
        var navigations: [UINavigationController] = []
        SOLTabBarItem.allCases.forEach {
            let navigation = makeNavigationController(
                selectedImage: $0.selectedImage,
                unselectedImage: $0.unselectedImage,
                rootViewController: $0.viewController
            )
            navigation.tabBarItem.title = $0.name
            navigations.append(navigation)
        }

        setViewControllers(navigations, animated: false)
    }

    private func makeNavigationController(selectedImage: UIImage, unselectedImage: UIImage, rootViewController: UIViewController) -> UINavigationController {

        let navigationController = UINavigationController(rootViewController: rootViewController)

        let tabBarItem = UITabBarItem(
            title: nil,
            image: unselectedImage,
            selectedImage: selectedImage
        )

        navigationController.tabBarItem = tabBarItem
        navigationController.navigationBar.isHidden = true
        return navigationController
    }


}
