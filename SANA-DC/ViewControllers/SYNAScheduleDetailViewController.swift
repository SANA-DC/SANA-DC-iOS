//
//  SYNAScheduleDetailViewController.swift
//  SANA-DC
//
//  Created by Saleem Sangi on 7/2/18.
//  Copyright © 2018 Saleem Sangi. All rights reserved.
//

import UIKit

class SYNAScheduleDetailViewController: UIViewController {

    var session:SessionSYNA?
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
            about.text = session.descriptionOfSession
        }
    }
}
