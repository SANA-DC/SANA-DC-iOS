//
//  TransportationTableViewController.swift
//  SANA-DC
//
//  Created by Saleem Sangi on 10/9/17.
//  Copyright © 2017 Saleem Sangi. All rights reserved.
//

import UIKit

class TransportationTableViewController: UITableViewController {

    var airportSelection = 0
    var busStation = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "test"
//    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
       // view.tintColor = .white
        let header : UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        //header.backgroundColor = .red
        header.textLabel?.textColor = UIColor.lightGray
        header.textLabel?.font = UIFont(name: Constants.FontsContants.optimistRegular, size: 17.0)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0{ // Airports
            airportSelection = indexPath.row
            self.performSegue(withIdentifier: "ToAirportVC", sender: self)
        } else if indexPath.section == 2{ // Other Transportation
            if indexPath.row == 0 || indexPath.row == 1{
                busStation = true
                self.performSegue(withIdentifier: "OtherTransportation", sender: self)
            } else if indexPath.row == 2{
                busStation = false
                self.performSegue(withIdentifier: "OtherTransportation", sender: self)
            }  else {
                self.performSegue(withIdentifier: "CarRental", sender: self)
            }
        }
    }
    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToAirportVC"{
            let airportDetailVC = segue.destination as? AirportDetailsViewController
            switch airportSelection{
            case 0:
                airportDetailVC?.airport = Airports.IAD
            case 1:
                airportDetailVC?.airport = Airports.DCA
            case 2:
                airportDetailVC?.airport = Airports.BWI
            default:
                break
            }
        }
        else if segue.identifier == "OtherTransportation"{
            let otherTransportation = segue.destination as? OtherTransportationDetailsViewController
            otherTransportation?.busStation = self.busStation
        }
            
    }
 

}
