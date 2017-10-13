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

   
    
    var documentsList: [String] = ["Bhajagovindam","HanumanChalisa","Bagawadgita","SriVishnu"]
    
    var documentsName: [String] = ["bhajagovindham","Sri_Hanuman_Chalisa_Hindi","gita-big","Sri_Vishnu"]
    
     var originallyWrittenBy: [String] = ["❁Originally written by 'Adi Shankara'❁","❁Originally written by 'Tulsidas'❁","❁Originally written by 'Sage Vyasa'❁","❁Originally written by 'Yudhisthira'❁"]
    
    var documentImageList: [String] = ["Bhajagovindam","Hanuman","Gita","SriVishnu"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pdfBGView.isHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - TableView Delegate and DataSource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return documentsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "documentIdentifier"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
       

        //cell.imageView?.image = UIImage(named:documentImageList[indexPath.row])
        cell.imageView?.image = UIImage(named:"SideIcon")
        cell.textLabel?.text = documentsList[indexPath.row]
        cell.detailTextLabel?.text = originallyWrittenBy[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
            loadPdf(pdfName: documentsName[indexPath.row])
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
    func loadPdf(pdfName: String) {
        if let pdfURL = Bundle.main.url(forResource: pdfName, withExtension: "pdf", subdirectory: nil, localization: nil)  {
            do {
                let data = try Data(contentsOf: pdfURL)
                let webView = WKWebView(frame: CGRect(x:0,y:40,width:pdfBGView.frame.size.width, height:pdfBGView.frame.size.height-40))
                
                if #available(iOS 9.0, *) {
                    webView.load(data, mimeType: "application/pdf", characterEncodingName:"", baseURL: pdfURL.deletingLastPathComponent())
                } else {
                    // Fallback on earlier versions
                    print("not ios9.0", separator: "", terminator: "")
                }
                pdfBGView.addSubview(webView)
                
            }
            catch {
                // catch errors here
            }
        }
    }
}
