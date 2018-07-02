//
//  AgendaTableViewController.swift
//  SANA-DC
//
//  Created by Saleem Sangi on 9/29/17.
//  Copyright © 2017 Saleem Sangi. All rights reserved.
//

import UIKit
import Firebase
class AgendaTableViewController: UITableViewController {

    //var data:ScheduleResponse?
    
    var day1Array = [Session]()
    var day2Array = [Session]()
    var day3Array = [Session]()
    
    var spinner: UIActivityIndicatorView?
    var storageRef:DatabaseReference!

    var sessionSelected:Session?
    var daySelected:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        storageRef = Database.database().reference()
//        Database.database().reference().child("sana-dc").observe(DataEventType.value, with: { (snapshot) in
//            print(snapshot)
//        }, withCancel: nil)
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        setupSpinner()
//        DataManager.sharedInstance.getSchedule(success: { [weak self](data) in
//            self?.data = data
//            DispatchQueue.main.async {
//                self?.stopSpinner()
//                self?.tableView.reloadData()
//            }
//        }) { (error) in
//            self.stopSpinner()
//            //TODO: Show an alert
//        }
        
        
        
//        Auth.auth().signIn(withEmail: "", password: "") { (user, error) in
//            if error == nil{
//                self.startObservingDB()
//
//            }
//        }
        startObservingDB()
        
    }

    
    
    func startObservingDB(){
        storageRef.observe(.value, with: { (snapshot) in
            
            
            //            for child in snapshot.childSnapshot(forPath: "Day1").children{
            //                print(child["endTime"])
            //            }
            
            
            // print(snapshot.childSnapshot(forPath: "Day1"))
            
      
            
            
            
            if let value = snapshot.value as? [String:AnyObject]{
                
                if  let day1 = value["Day1"] as? [[String:String]]{
                    for session in day1{
                        let eachSession = Session(category: session["category"], startTime: session["startTime"], lead: session["lead"], room: session["room"], session: session["session"], featuring: session["featuring"], endTime: session["endTime"])
                        self.day1Array.append(eachSession)
                        
                    }
                    
                }
                
                if  let day2 = value["Day2"] as? [[String:String]]{
                    for session in day2{
                        let eachSession = Session(category: session["category"], startTime: session["startTime"], lead: session["lead"], room: session["room"], session: session["session"], featuring: session["featuring"], endTime: session["endTime"])
                        self.day2Array.append(eachSession)
                        
                    }
                }
                
                if  let day3 = value["Day3"] as? [[String:String]]{
                    for session in day3{
                        let eachSession = Session(category: session["category"], startTime: session["startTime"], lead: session["lead"], room: session["room"], session: session["session"], featuring: session["featuring"], endTime: session["endTime"])
                        self.day3Array.append(eachSession)
                        
                    }
                }
                DispatchQueue.main.async {
                    self.stopSpinner()
                    self.tableView.reloadData()
                }
            }
            
        }) { (error) in
            print(error.localizedDescription)
        }
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if self.day1Array.count > 0 && self.day2Array.count > 0 && self.day3Array.count > 0{
            switch section{
            case 0:
                return "FRIDAY, JULY 6"
            case 1:
                return "SATURDAY, JULY 7"
            case 2:
                return "SUNDAY, JULY 8"
            default:
                break
            }
           return nil
        } else {
            return nil
        }
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
      //  view.tintColor = .white
        
        let header : UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.lightGray
        header.textLabel?.font = UIFont(name: Constants.FontsContants.optimistRegular, size: 17.0)
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        if self.day1Array.count > 0{
            return 3
        } else {
            return 0
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section{
        case 0:
            return day1Array.count
        case 1:
            return day2Array.count
        case 2:
            return day3Array.count
        default:
            break
        }
        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Agendacell", for: indexPath) as! AgendaTableViewCell
        
        if indexPath.section == 0{
            cell.title.text = day1Array[indexPath.row].session
            cell.starttime.text = day1Array[indexPath.row].startTime
            if let room = day1Array[indexPath.row].room{
                if room != ""{
                    cell.location.text = "Room: \(room)"
                } else {
                    cell.location.text = ""

                }
            }
            cell.endTime.text = day1Array[indexPath.row].endTime


        } else if indexPath.section == 1{
            cell.title.text = day2Array[indexPath.row].session
            cell.starttime.text = day2Array[indexPath.row].startTime
            if let room = day2Array[indexPath.row].room{
                
                if room != ""{
                    cell.location.text = "Room: \(room)"
                } else {
                    cell.location.text = ""

                }
            }
            cell.endTime.text = day2Array[indexPath.row].endTime
        } else {
            cell.title.text = day3Array[indexPath.row].session
            cell.starttime.text = day3Array[indexPath.row].startTime
            if let room = day3Array[indexPath.row].room{
                if room != ""{
                    cell.location.text = "Room: \(room)"
                } else {
                    cell.location.text = ""

                }
                
            }
            cell.endTime.text = day3Array[indexPath.row].endTime
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.section {
        case 0:
            sessionSelected = day1Array[indexPath.row]
            daySelected = "Friday, July 6, 2018"
        case 1:
            sessionSelected = day2Array[indexPath.row]
            daySelected = "Saturday, July 7, 2018"
        case 2:
            sessionSelected = day3Array[indexPath.row]
            daySelected = "Sunday, July 8, 2018"
        default:
            break
        }
        
        
        self.performSegue(withIdentifier: "ToScheduleDeatilVC", sender: self)
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if let destinationVC = segue.destination as? ScheduleDetailViewController{
            destinationVC.session = self.sessionSelected
            destinationVC.day = self.daySelected
        }
    }
    

    
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


struct Session:Codable {
    var category:String?
    var startTime:String?
    var lead:String?
    var room:String?
    var session:String?
    var featuring:String?
    var endTime:String?
}

struct SessionSYNA:Codable {
    var session:String?
    var startTime:String?
    var endTime:String?
    var room:String?
    var category:String?
    var lead:String?
    var featuring:String?
    var descriptionOfSession:String?
}
