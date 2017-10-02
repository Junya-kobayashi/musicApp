//
//  postArticle.swift
//  musicApp
//
//  Created by 小林純也 on 2017/09/25.
//  Copyright © 2017年 Junya Kobayashi. All rights reserved.
//

import UIKit
import Firebase

class postArticleViewController: UITableViewController {
    
    @IBOutlet var table:UITableView!
    
    @IBOutlet weak var TextField: UITextField!
    @IBOutlet weak var TextView: UITextView!
    @IBOutlet weak var displayUrl: UILabel!
    
    
    var ref: DatabaseReference!
    var refHandle: UInt!
    
    var urlList = [URL]()
    
    var displayurl: String!
    
    // インスタンス変数
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return urlList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        cell?.textLabel?.text = urlList[indexPath.row].url
        return cell!
    }
    
    
   
    
}
