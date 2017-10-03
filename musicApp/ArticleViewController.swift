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
    

    
//    @IBOutlet weak var textField: UITextField!
//    @IBOutlet weak var textView: UITextView!
//    @IBOutlet weak var displayUrl: UILabel!
    
    
    var ref: DatabaseReference!
    var refHandle: UInt!
    
    var contentArray: [[String: Any]] = []
//    var urlList = [URL]()
    
    var displayurl: String!
    
    
    let DBRef:DatabaseReference = Database.database().reference()
    
    
    // インスタンス変数
    override func viewDidLoad() {
        super.viewDidLoad()
        
        read()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        cell?.textLabel?.text = contentArray[contentArray.count - indexPath.row - 1]["url"] as? String
        print("-------")
        print(contentArray[indexPath.row]["url"] as? String)
        print("-------")
        return cell!
    }
    
    func read() {
        let defaultPlace = DBRef.child("user/01")
        defaultPlace.observe(.value) {(snap: DataSnapshot) in
            if snap.children.allObjects is [DataSnapshot] {
                self.reload(snapshot: snap)
            }
//            print(snap)
//            let dic = snap.value as! [String: Any]
//            self.displayUrl.text = dic["url"] as? String
        }
    }
    
    func reload(snapshot: DataSnapshot){
        if snapshot.exists() {
            contentArray.removeAll()
//            contentArray = snapshot.value as! [[String: Any]]
            for item in snapshot.children {
                let a = item as! DataSnapshot
                let b = a.value as! [String: Any]
                contentArray.append(b)
            }
            tableView.reloadData()
        }
    }
    
    
   
    
}
