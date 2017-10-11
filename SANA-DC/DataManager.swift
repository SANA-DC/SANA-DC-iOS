//
//  DataManager.swift
//  SANA-DC
//
//  Created by Saleem Sangi on 10/3/17.
//  Copyright © 2017 Saleem Sangi. All rights reserved.
//

import Foundation

class DataManager:NSObject{
    var schedule:ScheduleResponse?
    
    static let sharedInstance: DataManager = {
        let instance = DataManager()
        // setup code
        return instance
    }()
    
    // MARK: - Initialization Method
    
    override init() {
        super.init()
    }
    
    
    
    func getSchedule(success: @escaping (ScheduleResponse) -> Void, failure:@escaping (Error) -> Void) {
       
        let urlReuest = URLRequest(url: URL(string: Constants.URLConstants.firebaseURL)!)
        
        let task = URLSession.shared.dataTask(with: urlReuest) { (data, urlResponse, error) in
            if error == nil{
                let serlizedData = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! Dictionary<String, AnyObject>
              //  print(serlizedData!)
                
                var day1Schedule = [Day1]()
                if let firstDay = serlizedData!["Day1"] as? [[String:String]]{
                    for schedule in firstDay{
                        let day1 = Day1(dictonary: schedule)
                        day1Schedule.append(day1)
                    }
                    
                }
                
                //For Day2
                
                var day2Schedule = [Day2]()
                if let secondDay = serlizedData!["Day2"] as? [[String:String]]{
                    for schedule in secondDay{
                        let day2 = Day2(dictonary: schedule)
                        day2Schedule.append(day2)
                    }
                }
                self.schedule = ScheduleResponse(day1: day1Schedule, day2: day2Schedule)
                success(self.schedule!)
            } else {
                failure(error!)
            }
        }
        task.resume()
    }
}


class ScheduleResponse:NSObject{
    var day1 = [Day1]()
    var day2 = [Day2]()
    
    init(day1:[Day1], day2:[Day2]){
        super.init()
        self.day1 = day1
        self.day2 = day2
    }
    
}

class Day1: NSObject{
    var name:String?
    var location:String?
    var speaker:String?
    var endTime:String?
    var startTime:String?
    var sessionDescription:String?
    var totalTime:String?
    
    init(dictonary:[String:String]) {
        super.init()
        
        self.name = dictonary["name"]
        self.location = dictonary["location"]
        self.speaker = dictonary["speaker"]
        self.endTime = dictonary["endTime"]
        self.startTime = dictonary["startTime"]
        self.sessionDescription = dictonary["sessionDescription"]
        self.totalTime = dictonary["totalTime"]

    }
}

class Day2: NSObject{
    var name:String?
    var location:String?
    var speaker:String?
    var endTime:String?
    var startTime:String?
    var sessionDescription:String?
    var totalTime:String?
    
    init(dictonary:[String:String]) {
        super.init()
        
        self.name = dictonary["name"]
        self.location = dictonary["location"]
        self.speaker = dictonary["speaker"]
        self.endTime = dictonary["endTime"]
        self.startTime = dictonary["startTime"]
        self.sessionDescription = dictonary["sessionDescription"]
        self.totalTime = dictonary["totalTime"]
        
    }
}
