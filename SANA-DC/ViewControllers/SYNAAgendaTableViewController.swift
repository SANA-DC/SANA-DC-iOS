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
    
    var day1Array = [SessionSYNA]()
    var day2Array = [SessionSYNA]()
    var day3Array = [SessionSYNA]()
    
    
    var sessionSelected:SessionSYNA?
    var daySelected:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let session1Day1 = SessionSYNA(session: "Youth Registration", startTime: "6:00 pm", endTime: "9:00 pm", room: "", category: "Registration", lead: "", featuring: "", descriptionOfSession: "")
        
         let session2Day1 = SessionSYNA(session: "Icebreakers", startTime: "8:00 pm", endTime: "10:00 pm", room: "White Oak A & B", category: "Registration", lead: "", featuring: "", descriptionOfSession: "An introduction to the weekend \nIcebreakers & Games\nFor ages 12 and younger: Face painting and balloon animals!")
        
        let session1Day2 = SessionSYNA(session: "Meet in the lobby for check-in!", startTime: "8:45 am", endTime: "N/A", room: "", category: "Registration", lead: "", featuring: "", descriptionOfSession: "")

        let session2Day2 = SessionSYNA(session: "DC Tour", startTime: "9:00 am", endTime: "4:00 pm", room: "", category: "Registration", lead: "", featuring: "", descriptionOfSession: "A tour of Capitol Hill and the National Mall - feel free to explore the monuments, take a trip to the museums, or stop at a food truck for a bite to eat!")
        
        let session3Day2 = SessionSYNA(session: "Youth Hour", startTime: "9:00 pm", endTime: "10:00 pm", room: "Banquet Hall", category: "Registration", lead: "", featuring: "", descriptionOfSession: "Various performers and speeches from the Youth.\nWelcome Dance - Numrah Shaikh \nSpeech - Saad Ahmed Abbasi\nSkit\nSinging - Risha Shaikh\nRecognition of SYNA over the years - Sabrina Lakho\nPoetry Game - Will require audience participation!")
        
        let session1Day3 = SessionSYNA(session: "Interactive Panel with Saif Samejho", startTime: "10 am", endTime: "11 am", room: "White Oak", category: "Registration", lead: "", featuring: "", descriptionOfSession: "Interactive panel surrounding current issues in Sindh using music as a medium to create awareness. Open to everyone at SANA!")

        let session2Day3 = SessionSYNA(session: "Career Panel", startTime: "11 am", endTime: "1 pm", room: "White Oak", category: "Registration", lead: "", featuring: "", descriptionOfSession: "Panel for high school and College/University students to talk about their experiences in their respective career path\nBusiness/nSocial Work\nMental Health therapist\nMedicine/Bio\nArt/Music\nCriminal Justice/Law\nEngineering")
        
        let session3Day3 = SessionSYNA(session: "Masquerade Ball - Dessert Banquet!", startTime: "10:00 pm", endTime: "Midnight", room: "White Oak", category: "Registration", lead: "", featuring: "", descriptionOfSession: "")
        
        day1Array.append(session1Day1)
        day1Array.append(session2Day1)
        day2Array.append(session1Day2)
        day2Array.append(session2Day2)
        day2Array.append(session3Day2)
        day3Array.append(session1Day3)
        day3Array.append(session2Day3)
        day3Array.append(session3Day3)


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
        
        self.performSegue(withIdentifier: "SYNADetailSchedule", sender: self)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80//super.tableView(tableView, heightForRowAt: indexPath)
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if let destinationVC = segue.destination as? SYNAScheduleDetailViewController{
            destinationVC.session = self.sessionSelected
            destinationVC.day = self.daySelected
        }
    }
}
