//
//  HotelViewController.swift
//  SANA-DC
//
//  Created by Saleem Sangi on 10/8/17.
//  Copyright © 2017 Saleem Sangi. All rights reserved.
//

import UIKit
import WebKit

class HotelViewController: UIViewController, WKNavigationDelegate{

    let urlString = "https://www.marriott.com/hotels/travel/wasbn-bethesda-north-marriott-hotel-and-conference-center"
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        webView.navigationDelegate = self
        self.webView.load(URLRequest(url: URL(string: urlString)!))
    }

    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.activityIndicator.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        self.activityIndicator.startAnimating()
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
