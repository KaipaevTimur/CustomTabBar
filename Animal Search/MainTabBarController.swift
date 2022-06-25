//
//  MainTabBarController.swift
//  Animal Search
//
//  Created by Admin on 25.06.2022.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        generateTabBar()
        setTabBarAppearance()
    }
    
    private func generateTabBar() {
        viewControllers = [
            generateVC(
                viewContoller: HomeViewController(),
                title: "Home",
                image: UIImage(systemName: "house.fill")
            ),
            generateVC(
                viewContoller: PersonViewController(),
                title: "Person Info",
                image: UIImage(systemName: "person.fill")
            ),
            generateVC(
                viewContoller: SettingsViewController(),
                title: "Settings",
                image: UIImage(systemName: "slider.horizontal.3")
            )
        ]
    }
    
    private func generateVC(viewContoller: UIViewController, title: String, image: UIImage?) -> UIViewController {
        viewContoller.tabBarItem.title = title
        viewContoller.tabBarItem.image = image
        return viewContoller
    }
    private func setTabBarAppearance() {
        let positionOnX: CGFloat = 10
        let positionOnY: CGFloat = 10
        let width = tabBar.bounds.width - positionOnX * 2
        let height = tabBar.bounds.height + positionOnY * 2
        
        let roundLayer = CAShapeLayer()
        
        let bezierPath = UIBezierPath(
        roundedRect: CGRect(
            x: positionOnX,
            y: tabBar.bounds.minY - positionOnY,
            width: width,
            height: height
        ),
        cornerRadius: height/2
        )
        
        roundLayer.path = bezierPath.cgPath
        
        tabBar.layer.insertSublayer((roundLayer), at: 0)
        
        tabBar.itemWidth = width / 5
        tabBar.itemPositioning = .centered
        
        roundLayer.fillColor = UIColor.mainWhite.cgColor
        
        tabBar.tintColor = .tabBarItemAccent
        tabBar.unselectedItemTintColor = .tabBarItemLight
    }
}
