//
//  AirportDetailsViewController.swift
//  SANA-DC
//
//  Created by Saleem Sangi on 10/9/17.
//  Copyright © 2017 Saleem Sangi. All rights reserved.
//

import UIKit

enum Airports {
    case DCA
    case IAD
    case BWI
}

class AirportDetailsViewController: UIViewController {
    
    //IBOutlest
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var phone: UITextView!
    @IBOutlet weak var estimatedTaxiFare: UILabel!
    @IBOutlet weak var hotelDirection: UILabel!
    
    //Porperties
    var airport:Airports?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let airport = self.airport else {
            return
        }
        
        switch airport {
        case .BWI:
            name.text = "Baltimore/Washington International Thurgood Marshall Airport - BWI"
            phone.text = "Airport Phone: +1 410 859 7111"
            estimatedTaxiFare.text = "Estimated taxi fare: 70 USD  (one way)"
            hotelDirection.text = "Hotel direction: 37.6 miles SW"
        case .DCA:
            name.text = "Ronald Reagan Washington National Airport - DCA"
            phone.text = "Airport Phone: +1 703 417 8000"
            estimatedTaxiFare.text = "Estimated taxi fare: 55 USD  (one way)"
            hotelDirection.text = "Hotel direction: 23 miles NW"
        case .IAD:
            name.text = "Washington Dulles International Airport - IAD"
            phone.text = "Airport Phone: +1 703 572 2700"
            estimatedTaxiFare.text = "Estimated taxi fare: 60 USD  (one way)"
            hotelDirection.text = "Hotel direction: 25 miles NE"
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
