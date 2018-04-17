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

class AirportDetailsViewController: UIViewController, MKMapViewDelegate {
    
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
        var airportTitleForMap = ""
        var sourceLocation:CLLocationCoordinate2D?
        
        guard let airport = self.airport else {
            return
        }
        switch airport {
        case .BWI:
            name.text = "Baltimore/Washington International Thurgood Marshall Airport - BWI"
            phoneAddress.text = "Baltimore–Washington \n International Airport \n Phone: +1 410 859 7111"
            estimatedTaxiFare.text = "Estimated taxi fare: 70 USD  (one way)"
            hotelDirection.text = "Hotel direction: 37.6 miles SW"
            sourceLocation = CLLocationCoordinate2D(latitude: 39.177404, longitude: -76.668392)
            airportTitleForMap = "BWI"

        case .DCA:
            name.text = "Ronald Reagan Washington National Airport - DCA"
            phoneAddress.text = "Ronald Reagan Washington National Airport \n Phone: +1 703 417 8000"
            estimatedTaxiFare.text = "Estimated taxi fare: 55 USD  (one way)"
            hotelDirection.text = "Hotel direction: 23 miles NW"
            sourceLocation = CLLocationCoordinate2D(latitude: 38.851242, longitude: -77.040232)
            airportTitleForMap = "DCA"


        case .IAD:
            name.text = "Washington Dulles International Airport - IAD"
            phoneAddress.text = "1 Saarinen Cir \n Dulles, VA 20166 \n Phone: +1 703 572 2700"
            estimatedTaxiFare.text = "Estimated taxi fare: 60 USD  (one way)"
            hotelDirection.text = "Hotel direction: 25 miles NE"
            sourceLocation = CLLocationCoordinate2D(latitude: 38.953116, longitude: -77.456539)
            airportTitleForMap = "IAD"

        }
//
//        let span = MKCoordinateSpanMake(0.5, 0.5)
//        let region = MKCoordinateRegion(center: annotation.coordinate, span: span)
//        mapView.setRegion(region, animated: true)
//        mapView.addAnnotation(annotation)
//        mapView.selectAnnotation(annotation, animated: true)
        
        mapView.delegate = self
        // 2.
        let destinationLocation = CLLocationCoordinate2D(latitude: 39.046970, longitude: -77.115886)
        
        // 3.
        let sourcePlacemark = MKPlacemark(coordinate: sourceLocation!, addressDictionary: nil)
        let destinationPlacemark = MKPlacemark(coordinate: destinationLocation, addressDictionary: nil)
        
        // 4.
        let sourceMapItem = MKMapItem(placemark: sourcePlacemark)
        let destinationMapItem = MKMapItem(placemark: destinationPlacemark)
        
        // 5.
        let sourceAnnotation = MKPointAnnotation()
        sourceAnnotation.title = airportTitleForMap
        
        if let location = sourcePlacemark.location {
            sourceAnnotation.coordinate = location.coordinate
        }
        
        
        let destinationAnnotation = MKPointAnnotation()
        destinationAnnotation.title = "SANA Hotel"
        
        if let location = destinationPlacemark.location {
            destinationAnnotation.coordinate = location.coordinate
        }
        
        // 6.
        self.mapView.showAnnotations([sourceAnnotation,destinationAnnotation], animated: true )
        
        // 7.
        let directionRequest = MKDirectionsRequest()
        directionRequest.source = sourceMapItem
        directionRequest.destination = destinationMapItem
        directionRequest.transportType = .automobile
        
        // Calculate the direction
        let directions = MKDirections(request: directionRequest)
        
        // 8.
        directions.calculate {
            (response, error) -> Void in
            
            guard let response = response else {
                if let error = error {
                    print("Error: \(error)")
                }
                
                return
            }
            
            let route = response.routes[0]
            self.mapView.add((route.polyline), level: MKOverlayLevel.aboveRoads)
            
            let rect = route.polyline.boundingMapRect
            self.mapView.setRegion(MKCoordinateRegionForMapRect(rect), animated: true)
        }
    }

    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = .red
        renderer.lineWidth = 4.0
        
        return renderer
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
