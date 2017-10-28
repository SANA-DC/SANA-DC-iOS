//
//  AirportDetailsViewController.swift
//  SANA-DC
//
//  Created by Saleem Sangi on 10/9/17.
//  Copyright © 2017 Saleem Sangi. All rights reserved.
//

import UIKit
import MapKit

enum Airports {
    case DCA
    case IAD
    case BWI
}

class AirportDetailsViewController: UIViewController {
    
    //IBOutlest
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var phoneAddress: UITextView!
    @IBOutlet weak var estimatedTaxiFare: UILabel!
    @IBOutlet weak var hotelDirection: UILabel!
    
    //Porperties
    var airport:Airports?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Airport"
        guard let airport = self.airport else {
            return
        }
        let annotation = MKPointAnnotation()
        switch airport {
        case .BWI:
            name.text = "Baltimore/Washington International Thurgood Marshall Airport - BWI"
            phoneAddress.text = "Baltimore–Washington \n International Airport \n Phone: +1 410 859 7111"
            estimatedTaxiFare.text = "Estimated taxi fare: 70 USD  (one way)"
            hotelDirection.text = "Hotel direction: 37.6 miles SW"
            annotation.coordinate = CLLocationCoordinate2D(latitude: 39.177404, longitude: -76.668392)
            annotation.title = "BWI"
            
        case .DCA:
            name.text = "Ronald Reagan Washington National Airport - DCA"
            phoneAddress.text = "Ronald Reagan Washington National Airport \n Phone: +1 703 417 8000"
            estimatedTaxiFare.text = "Estimated taxi fare: 55 USD  (one way)"
            hotelDirection.text = "Hotel direction: 23 miles NW"
            annotation.coordinate = CLLocationCoordinate2D(latitude: 38.851242, longitude: -77.040232)
            annotation.title = "DCA"

        case .IAD:
            name.text = "Washington Dulles International Airport - IAD"
            phoneAddress.text = "1 Saarinen Cir \n Dulles, VA 20166 \n Phone: +1 703 572 2700"
            estimatedTaxiFare.text = "Estimated taxi fare: 60 USD  (one way)"
            hotelDirection.text = "Hotel direction: 25 miles NE"
            annotation.coordinate = CLLocationCoordinate2D(latitude: 38.953116, longitude: -77.456539)
            annotation.title = "IAD"
        }
        
        let span = MKCoordinateSpanMake(0.5, 0.5)
        let region = MKCoordinateRegion(center: annotation.coordinate, span: span)
        mapView.setRegion(region, animated: true)
        mapView.addAnnotation(annotation)
        mapView.selectAnnotation(annotation, animated: true)
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
