//
//  SevaViewController.swift
//  SidebarMenu
//
//  Created by Pavankumar on 15/10/2017.
//  Copyright © 2017 AppCoda. All rights reserved.
//

import Foundation
class SevaViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    
    @IBOutlet weak var menuButton:UIBarButtonItem!
    @IBOutlet weak var sevaTableView: UITableView!

    
    var dayList: [String] = ["Monday - Friday","Saturday","Sunday"]
    
    var morningSevaList: [String] = ["6.30am Suprabatha seva","8am Suprabatha seva and followed by Abhishekam","8am Suprabatha seva"]
    
    var eveningSevaList: [String] = ["7pm Vishnu Sahasranaamarchana","6pm Archana followed Vishnu Sahasranaamarchana","6pm Vishnu Sahasranaamarchana"]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - TableView Delegate and DataSource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dayList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "sevaTableViewCellIdentifier"

        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! SevaTableViewCell

        
        cell.dayLabel?.text = dayList[indexPath.row]
        cell.morningLabel?.text = morningSevaList[indexPath.row]
        cell.eveningLabel?.text = eveningSevaList[indexPath.row]

        cell.textLabel?.backgroundColor = UIColor.clear
        
        cell.contentView.backgroundColor = UIColor.clear
        sevaTableView.backgroundColor = UIColor.clear
        cell.layer.backgroundColor = UIColor.clear.cgColor
        
        return cell
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
