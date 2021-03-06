//
//  DocumentsViewController.swift
//  SidebarMenu
//
//  Created by Pavankumar on 13/10/2017.
//  Copyright © 2017 AppCoda. All rights reserved.
//

import Foundation
import WebKit


class DocumentsViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var pdfBGView: UIView!
    @IBOutlet weak var documentsTableView: UITableView!

    @IBOutlet weak var menuButton:UIBarButtonItem!

    
    var documentsList: [String] = ["Bhajagovindam","HanumanChalisa","Bagawadgita","SriVishnu","Govinda-Hari-Govinda"]
    
    var documentsName: [String] = ["bhajagovindham","Sri_Hanuman_Chalisa_Hindi","gita-big","Sri_Vishnu","SriSrinivasaGovinda"]
    
     var originallyWrittenBy: [String] = ["Originally written by 'Adi Shankara'","Originally written by 'Tulsidas'","Originally written by 'Sage Vyasa'","Originally written by 'Yudhisthira'","From బ్రహ్మశ్రీ చాగంటి కోటేశ్వరరావు గారు"]
    
    var documentImageList: [String] = ["Bhajagovindam","Hanuman","Gita","SriVishnu"]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        let rightButton: UIBarButtonItem = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.done, target: self, action: #selector(self.menuButtonTapped(sender:)))

        self.navigationItem.rightBarButtonItem = rightButton
        
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.black

        self.pdfBGView.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func menuButtonTapped(sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)

    }

    
    //MARK: - TableView Delegate and DataSource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return documentsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "documentIdentifier"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
       

       // cell.imageView?.image = UIImage(named:"balajiSymbol")
        cell.textLabel?.text = "❁   \(documentsList[indexPath.row])"
        cell.detailTextLabel?.text = originallyWrittenBy[indexPath.row]
        
        cell.textLabel?.backgroundColor = UIColor.clear
        
        cell.contentView.backgroundColor = UIColor.clear
        documentsTableView.backgroundColor = UIColor.clear
        cell.layer.backgroundColor = UIColor.clear.cgColor
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        loadPdf(pdfName: documentsName[indexPath.row],onView: self.pdfBGView)
            self.pdfBGView.isHidden = false
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    @IBAction func doneButtonClicked(_ sender: Any)
    {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func closePdf(_ sender: Any)
    {
        self.pdfBGView.isHidden = true
    }
    
    //MARK: - PDF Loader Method
    //Load Pdf
    func loadPdf(pdfName: String,onView:UIView) {
        if let pdfURL = Bundle.main.url(forResource: pdfName, withExtension: "pdf", subdirectory: nil, localization: nil)  {
            do {
                let data = try Data(contentsOf: pdfURL)
                let webView = WKWebView(frame: CGRect(x:0,y:0,width:pdfBGView.frame.size.width, height:pdfBGView.frame.size.height))
                
                if #available(iOS 9.0, *) {
                    webView.load(data, mimeType: "application/pdf", characterEncodingName:"", baseURL: pdfURL.deletingLastPathComponent())
                } else {
                    // Fallback on earlier versions
                    print("not ios9.0", separator: "", terminator: "")
                }
                onView.addSubview(webView)
                
            }
            catch {
                // catch errors here
            }
        }
    }
}
