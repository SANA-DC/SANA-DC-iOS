//
//  ScheduleDetailViewController.swift
//  SANA-DC
//
//  Created by Saleem Sangi on 10/6/17.
//  Copyright © 2017 Saleem Sangi. All rights reserved.
//

import UIKit

class ScheduleDetailViewController: UIViewController {

    var session:Session?
    var day:String?
    
    @IBOutlet weak var about: UITextView!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var fullTime: UILabel!
    @IBOutlet weak var sessionTitle: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationItem.title = "Info"
        
        if let session = self.session{
            if session.room != ""{
                location.text = session.room
            }
            date.text = day
            fullTime.text = "\(session.startTime ?? "") - \(session.endTime ?? "")"
            sessionTitle.text = session.session
        }
    }
}
