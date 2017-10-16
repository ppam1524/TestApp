//
//  HomeViewController.swift
//  SidebarMenu
//
//  Created by Sivarama Arepu on 29/09/17.
//  Copyright © 2017 SRK. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var menuButton:UIBarButtonItem!
    @IBOutlet weak var rightLamp: UIImageView!
    @IBOutlet weak var leftLamp: UIImageView!
   
    override func viewDidLoad() {

        super.viewDidLoad()

        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
       
        let jeremyGif = UIImage.gifImageWithName("giphy")
        leftLamp.image = jeremyGif;
        rightLamp.image = jeremyGif;
        
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
