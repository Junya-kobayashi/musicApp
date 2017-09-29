//
//  postArticle.swift
//  musicApp
//
//  Created by 小林純也 on 2017/09/25.
//  Copyright © 2017年 Junya Kobayashi. All rights reserved.
//

import UIKit
import Firebase

class postArticleViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet var table:UITableView!
    
    @IBOutlet weak var TextField: UITextField!
    @IBOutlet weak var displayUrl: UILabel!
    var urlList = [URL]()
    
    // インスタンス変数
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return urlList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        cell?.textLabel?.text="test"
        
        return cell!
    }
    
    
    @IBAction func add(_ sender: AnyObject) {
        let DBRef:DatabaseReference = Database.database().reference()
        let url: String = String(TextField.text!)
//        print(url)
        let data = ["url": url]
//        print(data)
        DBRef.child("user/01").setValue(data)
        
        let defaultPlace = DBRef.child("user/01")
        defaultPlace.observe(.value) { (snap: DataSnapshot) in
            let dic = snap.value as! [String: Any]
            self.displayUrl.text = dic["url"] as? String
        }
    }
}
