//
//  VotingViewController.swift
//  SANA-DC
//
//  Created by Saleem Sangi on 6/17/18.
//  Copyright © 2018 Saleem Sangi. All rights reserved.
//

import UIKit
import WebKit

class VotingViewController: UIViewController,WKNavigationDelegate {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.navigationDelegate = self
        self.webView.load(URLRequest(url: URL(string: "https://www.surveymonkey.com/r/ZSBB3TD")!))
        
        
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.activityIndicator.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        self.activityIndicator.startAnimating()
    }

}
