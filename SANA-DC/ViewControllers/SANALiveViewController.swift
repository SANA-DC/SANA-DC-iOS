//
//  SANALiveViewController.swift
//  SANA-DC
//
//  Created by Saleem Sangi on 4/16/18.
//  Copyright © 2018 Saleem Sangi. All rights reserved.
//

import UIKit
import WebKit

class SANALiveViewController: UIViewController, WKNavigationDelegate {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.navigationDelegate = self
        self.webView.load(URLRequest(url: URL(string: Constants.URLConstants.sanaURL)!))
        
        
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.activityIndicator.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        self.activityIndicator.startAnimating()
    }

}
