//
//  AgendaTableViewController.swift
//  SANA-DC
//
//  Created by Saleem Sangi on 9/29/17.
//  Copyright © 2017 Saleem Sangi. All rights reserved.
//

import UIKit

class AgendaTableViewController: UITableViewController {

    var data:ScheduleResponse?
    var spinner: UIActivityIndicatorView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        setupSpinner()
        DataManager.sharedInstance.getSchedule(success: { [weak self](data) in
            self?.data = data
            DispatchQueue.main.async {
                self?.stopSpinner()
                self?.tableView.reloadData()
            }
        }) { (error) in
            
        }
    }

 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if self.data != nil{
            return section == 0 ? "WEDNESDAY, SEPTEMBER 27" : "THURSDAY, SEPTEMBER 28"
        } else {
            return ""
        }
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
      //  view.tintColor = .white
        
        let header : UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.lightGray
        header.textLabel?.font = UIFont(name: "Optimist-Regular", size: 17.0)
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        if self.data != nil{
            return 2
        } else {
            return 0
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let data = data{
            return section == 0 ? data.day1.count : data.day2.count
        } else {
            return 0
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...
        
        

        return cell
    }
 

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80//super.tableView(tableView, heightForRowAt: indexPath)
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
    func setupSpinner(){
        spinner = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 40, height:40))
        spinner?.activityIndicatorViewStyle = .whiteLarge
        spinner?.center = CGPoint(x:UIScreen.main.bounds.size.width / 2, y:UIScreen.main.bounds.size.height / 2)
        self.view.addSubview(spinner!)
        spinner?.hidesWhenStopped = true
        spinner?.startAnimating()
    }
    
    func stopSpinner(){
        spinner?.stopAnimating()
    }
}
