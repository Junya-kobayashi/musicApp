//
//  postArticle.swift
//  musicApp
//
//  Created by 小林純也 on 2017/09/25.
//  Copyright © 2017年 Junya Kobayashi. All rights reserved.
//

import UIKit
import Firebase

class postArticleViewController: UIViewController {
    
    @IBOutlet weak var TextField: UITextField!
    @IBOutlet weak var displayUrl: UILabel!
    
    // インスタンス変数
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func add(_ sender: AnyObject) {
        let DBRef:DatabaseReference = Database.database().reference()
        let url: String = String(TextField.text!)
        let data = ["url": url]
        DBRef.child("user/01").setValue(data)
        
        let defaultPlace = DBRef.child("user/01/age")
        defaultPlace.observe(.value) { (snap: DataSnapshot) in self.displayUrl.text = (snap.value! as AnyObject).description
        }
    }
}
