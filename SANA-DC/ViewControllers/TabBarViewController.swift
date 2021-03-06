//
//  TabBarViewController.swift
//  SANA-DC
//
//  Created by Saleem Sangi on 10/13/17.
//  Copyright © 2017 Saleem Sangi. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = .black
    }

    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        
        tabBar.tintColor = .black
    self.moreNavigationController.topViewController?.view.backgroundColor = .black
        self.moreNavigationController.navigationBar.barTintColor = .black

        self.moreNavigationController.navigationBar.tintColor = .white
        self.moreNavigationController.navigationBar.titleTextAttributes = [
            NSAttributedStringKey.foregroundColor : UIColor.white,
            NSAttributedStringKey.font: UIFont(name: Constants.FontsContants.optimistBold, size: 18)!
        ]
        
    
        
        if let view = self.moreNavigationController.topViewController?.view as? UITableView{
            for cell in view.visibleCells{
                let tableCell = cell as UITableViewCell
                tableCell.backgroundColor = .black
                tableCell.textLabel?.textColor = .white
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
