//
//  SYNATableViewController.swift
//  SANA-DC
//
//  Created by Saleem Sangi on 6/3/18.
//  Copyright © 2018 Saleem Sangi. All rights reserved.
//

import UIKit

class SYNATableViewController: UITableViewController {


    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if let selectedRow = tableView.indexPathForSelectedRow?.row{
            if let destinationVC = segue.destination as? AttractionDetailViewController{
                destinationVC.row = selectedRow
            }
        }
    }
        
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            self.performSegue(withIdentifier: "toAgenda", sender: self)
        } else{
            self.performSegue(withIdentifier: "toVoting", sender: self)

        }
    }
    
    
}
