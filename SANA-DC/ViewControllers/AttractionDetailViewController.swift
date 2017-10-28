//
//  AttractionDetailViewController.swift
//  SANA-DC
//
//  Created by Saleem Sangi on 10/23/17.
//  Copyright © 2017 Saleem Sangi. All rights reserved.
//

import UIKit
import WebKit

class AttractionDetailViewController: UIViewController,WKNavigationDelegate {

    var row = 0
    
    let urls = [Constants.URLConstants.whiteHouse, Constants.URLConstants.holocaust, Constants.URLConstants.strathmore, Constants.URLConstants.monument, Constants.URLConstants.vietnam, Constants.URLConstants.airandspace, Constants.URLConstants.temple, Constants.URLConstants.kennedy, Constants.URLConstants.smithsonian, Constants.URLConstants.nationalZoo
    ]
    
    @IBOutlet weak var activityInd: UIActivityIndicatorView!
    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //self.navigationItem.title = ""
        webView.navigationDelegate = self
        self.webView.load(URLRequest(url: URL(string: urls[row])!))

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
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.activityInd.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        self.activityInd.startAnimating()
    }

}
