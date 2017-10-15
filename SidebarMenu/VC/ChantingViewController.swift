//
//  ChantingViewController.swift
//  SidebarMenu
//
//  Created by Pavankumar on 15/10/2017.
//  Copyright © 2017 AppCoda. All rights reserved.
//

import Foundation
class ChantingViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var menuButton:UIBarButtonItem!
    @IBOutlet weak var chantingTableView: UITableView!

    var chantingList: [String] = ["ఓం","ఓం నారాయణాయ","ఓం నమో వెంకటేశాయ"]
    var chantingFileNames: [String] = ["OM","OmNamoNaraanaya","Om_Namo_Venkateshaya"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.revealViewController() != nil
        {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
      self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
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
    
    //MARK: - TableView Delegate and DataSource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chantingList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "chantingIdentifier"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        cell.textLabel?.text = chantingList[indexPath.row]
        cell.textLabel?.backgroundColor = UIColor.clear
        
        cell.contentView.backgroundColor = UIColor.clear
        chantingTableView.backgroundColor = UIColor.clear
        cell.layer.backgroundColor = UIColor.clear.cgColor
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.playSong(song: chantingFileNames[indexPath.row] as NSString)
        
    }
}
