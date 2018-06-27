//
//  SYNAAgendaTableViewController.swift
//  SANA-DC
//
//  Created by Saleem Sangi on 6/3/18.
//  Copyright © 2018 Saleem Sangi. All rights reserved.
//

import UIKit

class SYNAAgendaTableViewController: UITableViewController {

    //var data:ScheduleResponse?
    
    var day1Array = [Session]()
    var day2Array = [Session]()
    var day3Array = [Session]()
    
    
    var sessionSelected:Session?
    var daySelected:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let session1Day1 = Session(category: "Youth", startTime: "08:00", lead: "Khulda", room: "Larkana", session: "Registration", featuring: "", endTime: "09:30")
        
         let session2Day1 = Session(category: "Youth", startTime: "09:00", lead: "Khulda", room: "Larkana", session: "Icebreakers/Games", featuring: "", endTime: "09:30")
        
        let session1Day2 = Session(category: "Youth", startTime: "09:00", lead: "Khulda", room: "", session: "White House Tour\nTour of National Mall", featuring: "", endTime: "04:00")

        let session2Day2 = Session(category: "Youth", startTime: "08:00", lead: "Khulda", room: "", session: "Dinner", featuring: "", endTime: "10:00")
        
        let session3Day2 = Session(category: "Youth", startTime: "10:00", lead: "Khulda", room: "", session: "Youth Program", featuring: "", endTime: "11:00")
        
        let session1Day3 = Session(category: "Youth", startTime: "10:00", lead: "Khulda", room: "", session: "Youth Program", featuring: "", endTime: "11:45pm")

        day1Array.append(session1Day1)
        day1Array.append(session2Day1)
        day2Array.append(session1Day2)
        day2Array.append(session2Day2)
        day2Array.append(session3Day2)
        day3Array.append(session1Day3)

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
        let cell = tableView.dequeueReusableCell(withIdentifier: "AgendacellSYNA", for: indexPath) as! AgendaTableViewCell
        
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
        
        //self.performSegue(withIdentifier: "ToScheduleDeatilVC", sender: self)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80//super.tableView(tableView, heightForRowAt: indexPath)
    }
    
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
}
