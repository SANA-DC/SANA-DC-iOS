//
//  SANARegistrationViewController.swift
//  SANA-DC
//
//  Created by Saleem Sangi on 10/8/17.
//  Copyright © 2017 Saleem Sangi. All rights reserved.
//

import UIKit
import WebKit

class SANARegistrationViewController: UIViewController,WKNavigationDelegate {

    @IBOutlet weak var activityInd: UIActivityIndicatorView!
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        webView.navigationDelegate = self
        self.webView.load(URLRequest(url: URL(string: Constants.URLConstants.sanaURL)!))
    }
    
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.activityInd.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        self.activityInd.startAnimating()
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
