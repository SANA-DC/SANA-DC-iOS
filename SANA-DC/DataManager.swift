//
//  DataManager.swift
//  SANA-DC
//
//  Created by Saleem Sangi on 10/3/17.
//  Copyright © 2017 Saleem Sangi. All rights reserved.
//

import Foundation

class DataManager:NSObject{
    
    static let sharedInstance: DataManager = {
        let instance = DataManager()
        // setup code
        return instance
    }()
    
    // MARK: - Initialization Method
    
    override init() {
        super.init()
    }
    
    
    
    func getSchedule(success: (ScheduleResponse) -> Void, failure:(Error) -> Void) {
       
        let urlString = "https://firebasestorage.googleapis.com/v0/b/sana-dc.appspot.com/o/SANA_DC.json?alt=media&token=54e0aeca-31d4-4fcb-a8ad-3ab08798a684"
        let urlReuest = URLRequest(url: URL(string: urlString)!)
        
        let task = URLSession.shared.dataTask(with: urlReuest) { (data, urlResponse, error) in
            if error == nil{
                let serlizedData = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! Dictionary<String, AnyObject>
                print(serlizedData!)
                
                let day = serlizedData!["Day1"] as? [[String:AnyObject]]
                
            }
        }
        task.resume()
    }
}


struct ScheduleResponse{
    var day1 = [Day1]()
    var day2 = [Day2]()
    
    init(day1:[Day1], day2:[Day2]){
        self.day1 = day1
        self.day2 = day2
    }
    
}

struct Day1{
    var name:String
    var startTime:String
    var endTime:String
    var totalTime:String
    var location:String
    var speaker:String
    var description:String
    
    init(name:String, startTime:String, endTime:String, totalTime:String, location:String, speaker:String, description:String) {
        self.name = name
        self.endTime = endTime
        self.startTime = startTime
        self.totalTime = totalTime
        self.description = description
        self.location = location
        self.speaker = speaker

    }
}

struct Day2{
    var name:String
    var startTime:String
    var endTime:String
    var totalTime:String
    var location:String
    var speaker:String
    var description:String
    
    init(name:String, startTime:String, endTime:String, totalTime:String, location:String, speaker:String, description:String) {
        self.name = name
        self.endTime = endTime
        self.startTime = startTime
        self.totalTime = totalTime
        self.description = description
        self.location = location
        self.speaker = speaker
        
    }
}
