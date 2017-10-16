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
    @IBOutlet weak var godBGView: UIImageView!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var leftLamp: UIImageView!
    @IBOutlet weak var volumeButton: UIButton!
    var isMuted:Bool = false

    override func viewDidLoad() {

        super.viewDidLoad()
        godBGView.contentMode = .scaleAspectFill
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
       
        let jeremyGif = UIImage.gifImageWithName("giphy")
        leftLamp.image = jeremyGif;
        rightLamp.image = jeremyGif;
        
        volumeButton.setImage(UIImage(named:"unMute"), for: .normal)
        volumeButton.addTarget(self, action:#selector(handleVolume), for: .touchUpInside)
        

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    func handleVolume()
    {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate

        
        if isMuted == false {
            isMuted = true
            appDelegate.audioPlayer?.volume = 0
            volumeButton.setImage(UIImage(named:"Mute"), for: .normal)
        } else {
            isMuted = false
            appDelegate.audioPlayer?.volume = 1
            volumeButton.setImage(UIImage(named:"unMute"), for: .normal)
        }
       
        /*if volumeButton.isSelected
        {
            volumeButton.setImage(UIImage(named:"unMute"), for: .normal)
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            
        }
        else
        {
            volumeButton.setImage(UIImage(named:"Mute"), for: .normal)
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.stopAudio()
        }
 */
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
