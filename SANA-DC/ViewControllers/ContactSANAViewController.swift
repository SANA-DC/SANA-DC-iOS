//
//  ContactSANAViewController.swift
//  SANA-DC
//
//  Created by Saleem Sangi on 11/19/17.
//  Copyright © 2017 Saleem Sangi. All rights reserved.
//

import UIKit
import MessageUI

class ContactSANAViewController: UIViewController, MFMailComposeViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    
    @IBAction func email(_ sender: UIButton) {
        
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["info@sanaonline.org"])
            present(mail, animated: true)
        } else {
            let alertController = UIAlertController(title: "Error", message: "Please setup email", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: { (result) in
                print("ok pressed")
            })
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
            
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func openInstagram() {
        
        let username =  "sindhiassociation"
        let appURL = NSURL(string: "instagram://user?username=\(username)")!
        let webURL = NSURL(string: "https://instagram.com/\(username)")!
        let application = UIApplication.shared
        
        if application.canOpenURL(appURL as URL) {
            application.open(appURL as URL)
        } else {
            // if Instagram app is not installed, open URL inside Safari
            application.open(webURL as URL)
        }
    }
    
    
    @IBAction func openFB() {
        
        let username =  "127510270772819"
        let appURL = NSURL(string: "fb://profile/\(username)")!
        let webURL = NSURL(string: "https://facebook.com/\(username)")!
        let application = UIApplication.shared
        
        if application.canOpenURL(appURL as URL) {
            application.open(appURL as URL)
        } else {
            // if Instagram app is not installed, open URL inside Safari
            application.open(webURL as URL)
        }
    }
    
    @IBAction func openTwitter() {
        
        let username =  "SANA_Sindh2017"
        let appURL = NSURL(string: "twitter:///user?screen_name=\(username)")!
        let webURL = NSURL(string: "https://twitter.com/\(username)")!
        let application = UIApplication.shared
        
        if application.canOpenURL(appURL as URL) {
            application.open(appURL as URL)
        } else {
            // if Instagram app is not installed, open URL inside Safari
            application.open(webURL as URL)
        }
    }
    
}
