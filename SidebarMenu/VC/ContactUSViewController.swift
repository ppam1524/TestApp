//
//  ContactUSViewController.swift
//  SidebarMenu
//
//  Created by Pavankumar on 15/10/2017.
//  Copyright © 2017 AppCoda. All rights reserved.
//

import Foundation
class ContactUSViewController: UIViewController
{
    @IBOutlet weak var menuButton:UIBarButtonItem!
    @IBOutlet weak var webView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        if let url = URL(string: "http://tcsni.com/Home/Contact")
        {
            let request = URLRequest(url: url)
            webView.loadRequest(request)
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
