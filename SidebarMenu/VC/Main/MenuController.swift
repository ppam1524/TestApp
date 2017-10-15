

import UIKit

class MenuController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var featuresTableView: UITableView!

    var featuresList: [String] = ["HOME","ABOUT TCSNI","DOCUMENTS","DONATE","SEVAS","CONTACT","GALLARY","CHANTING","REGISTER","SHARE"]
    var navStoryBoardId: String = "" 
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // Mark : UITableViewC Delegate Methods

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var headerTitle:String = ""
        if section == 0
        {
             headerTitle = "Features"
        }
        return headerTitle
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return featuresList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "featuresIdentifier"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.textLabel?.text = featuresList[indexPath.row]
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (indexPath.row == 0)
        {
            //self.revealViewController().revealToggle(animated: true)
            
            //Load HomeViewController
            navStoryBoardId = "HomeNavigationID"
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller: UINavigationController = storyboard.instantiateViewController(withIdentifier: navStoryBoardId) as! UINavigationController
            self.revealViewController().setFront(controller, animated: true)
            self.revealViewController().setFrontViewPosition(FrontViewPosition.left, animated: true)
            
        }else if(indexPath.row == 1)
        {
            //Load TCSNI
            navStoryBoardId = "TCSNINavigationID"
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller: UINavigationController = storyboard.instantiateViewController(withIdentifier: navStoryBoardId) as! UINavigationController
            self.revealViewController().setFront(controller, animated: true)
            self.revealViewController().setFrontViewPosition(FrontViewPosition.left, animated: true)
        }
        else if(indexPath.row == 2)
        {
            let storyboard = UIStoryboard(name: "Documents", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "DocumentsViewControllerID")
            self.present(controller, animated: true, completion: nil)
            
            let alert = UIAlertController(title: "Alert", message: "\(featuresList [indexPath.row]) cliked", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else if(indexPath.row == 3)
        {
      
        }
        else if(indexPath.row == 4)
        {
           
        }
        else if(indexPath.row == 5)
        {
           
        } else if(indexPath.row == 6)
        {
          
        }
        
      
        
    }
    // MARK: - Table view data source


    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as UITableViewCell

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
