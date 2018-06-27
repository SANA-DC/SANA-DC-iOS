//
//  OtherTransportationDetailsViewController.swift
//  SANA-DC
//
//  Created by Saleem Sangi on 10/14/17.
//  Copyright © 2017 Saleem Sangi. All rights reserved.
//

import UIKit
import WebKit

class OtherTransportationDetailsViewController: UIViewController,WKNavigationDelegate {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var webView: WKWebView!

    var busStation = false
    var map = false
    override func viewDidLoad() {
        super.viewDidLoad()

        webView.navigationDelegate = self
        if map{
            self.navigationItem.title = "Metro Map"
            self.webView.load(URLRequest(url: URL(string: "https://www.wmata.com/schedules/maps/upload/2017-System-Map.pdf")!))
        }
        else if busStation{
            self.navigationItem.title = "Station"
            self.webView.load(URLRequest(url: URL(string: Constants.URLConstants.busStation)!))
        }  else {
            self.navigationItem.title = "Train Station"
            self.webView.load(URLRequest(url: URL(string: Constants.URLConstants.trainStation)!))
        }
        
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.activityIndicator.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        self.activityIndicator.startAnimating()
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
