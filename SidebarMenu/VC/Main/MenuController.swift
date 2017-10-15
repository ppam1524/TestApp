

import UIKit



class MenuController: UIViewController,UITableViewDelegate, UITableViewDataSource
{
  
    @IBOutlet weak var featuresTableView: UITableView!

    var featuresList: [String] = ["HOME","ABOUT TCSNI","DOCUMENTS","DONATE","SEVAS","GALLARY","CHANTING","SHARE","CONTACT US","ACCOUNT"]
    var navStoryBoardId: String = "" 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let frame = CGRectMake(0, 0, 250,310)
        let headerImageView = UIImageView(frame: frame)
        let image: UIImage = UIImage(named: "TCSNILogo")!
        headerImageView.image = image
        featuresTableView.tableHeaderView = headerImageView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    func CGRectMake(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) -> CGRect {
        return CGRect(x: x, y: y, width: width, height: height)
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
        cell.textLabel?.text = "❁  \(featuresList[indexPath.row])"
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        if (indexPath.row == 0)
        {
            //self.revealViewController().revealToggle(animated: true)
            
            //Load HomeViewController
            navStoryBoardId = "HomeNavigationID"
            let controller: UINavigationController = storyboard.instantiateViewController(withIdentifier: navStoryBoardId) as! UINavigationController
            self.revealViewController().setFront(controller, animated: true)
            self.revealViewController().setFrontViewPosition(FrontViewPosition.left, animated: true)
            
        }else if(indexPath.row == 1)
        {
            //Load TCSNI
            navStoryBoardId = "TCSNINavigationID"
            let controller: UINavigationController = storyboard.instantiateViewController(withIdentifier: navStoryBoardId) as! UINavigationController
            self.revealViewController().setFront(controller, animated: true)
            self.revealViewController().setFrontViewPosition(FrontViewPosition.left, animated: true)
        }
        else if(indexPath.row == 2)
        {
            navStoryBoardId = "DocumentsViewControllerID"
            let storyboard = UIStoryboard(name: "Documents", bundle: nil)
            let controller: UINavigationController = storyboard.instantiateViewController(withIdentifier: navStoryBoardId) as! UINavigationController
            

            self.present(controller, animated: true, completion: nil)
       
        }
        else if(indexPath.row == 3)
        {
      //DONATE
            //Load TCSNI
            navStoryBoardId = "DonateNavigationVCID"
            let controller: UINavigationController = storyboard.instantiateViewController(withIdentifier: navStoryBoardId) as! UINavigationController
            self.revealViewController().setFront(controller, animated: true)
            self.revealViewController().setFrontViewPosition(FrontViewPosition.left, animated: true)
        }
        else if(indexPath.row == 4)
        {
            //SEVAS
            navStoryBoardId = "sevasNavigationVCID"
            let controller: UINavigationController = storyboard.instantiateViewController(withIdentifier: navStoryBoardId) as! UINavigationController
            self.revealViewController().setFront(controller, animated: true)
            self.revealViewController().setFrontViewPosition(FrontViewPosition.left, animated: true)
        }
        else if(indexPath.row == 5)
        {
            //GALLARY
            let alert = UIAlertController(title: "Alert", message: "Sorry! \(featuresList [indexPath.row]), yet to implement", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else if(indexPath.row == 6)
        {
            //CHANTING
            let alert = UIAlertController(title: "Alert", message: "Sorry! \(featuresList [indexPath.row]), yet to implement", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
//        else if(indexPath.row == 7)
//        {
//            //REGISTER
//            //Load TCSNI
//            navStoryBoardId = "RegisterNavigationID"
//            let controller: UINavigationController = storyboard.instantiateViewController(withIdentifier: navStoryBoardId) as! UINavigationController
//            self.revealViewController().setFront(controller, animated: true)
//            self.revealViewController().setFrontViewPosition(FrontViewPosition.left, animated: true)
//        }
        else if(indexPath.row == 7)
        {
            //SHARE
            let alert = UIAlertController(title: "Alert", message: "Sorry! \(featuresList [indexPath.row]), yet to implement", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else if(indexPath.row == 8)
        {
            //CONTACT US
            
            navStoryBoardId = "ContactUSNavigationID"
            let controller: UINavigationController = storyboard.instantiateViewController(withIdentifier: navStoryBoardId) as! UINavigationController
            self.revealViewController().setFront(controller, animated: true)
            self.revealViewController().setFrontViewPosition(FrontViewPosition.left, animated: true)
        }
        else if(indexPath.row == 9)
        {
            //CONTACT US
            
//            navStoryBoardId = "ContactUSNavigationID"
//            let controller: UINavigationController = storyboard.instantiateViewController(withIdentifier: navStoryBoardId) as! UINavigationController
//            self.revealViewController().setFront(controller, animated: true)
//            self.revealViewController().setFrontViewPosition(FrontViewPosition.left, animated: true)
            
            let actionSheet = UIAlertController(title: "Account", message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
            actionSheet.addAction(UIAlertAction(title: "Login", style: UIAlertActionStyle.default, handler: { (action) in
               // LoginNavigationVCID
                self.navStoryBoardId = "LoginNavigationVCID"
                let controller: UINavigationController = storyboard.instantiateViewController(withIdentifier: self.navStoryBoardId) as! UINavigationController
                self.revealViewController().setFront(controller, animated: true)
                self.revealViewController().setFrontViewPosition(FrontViewPosition.left, animated: true)
                
            }))
            actionSheet.addAction(UIAlertAction(title: "Register", style: UIAlertActionStyle.default, handler: { (action) in
               
                self.navStoryBoardId = "RegisterNavigationID"
                let controller: UINavigationController = storyboard.instantiateViewController(withIdentifier: self.navStoryBoardId) as! UINavigationController
                self.revealViewController().setFront(controller, animated: true)
                self.revealViewController().setFrontViewPosition(FrontViewPosition.left, animated: true)
            }))
            
            actionSheet.addAction(UIAlertAction.init(title: "Cancel", style: UIAlertActionStyle.cancel, handler: { (action) in
                self.dismiss(animated: true, completion: nil)
            }))
            
            self.present(actionSheet, animated: true, completion: nil)
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
