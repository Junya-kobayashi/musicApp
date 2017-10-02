//
//  postUrlViewController.swift
//  musicApp
//
//  Created by 小林純也 on 2017/09/28.
//  Copyright © 2017年 Junya Kobayashi. All rights reserved.
//

import UIKit
import Firebase

class postUrlViewController: UIViewController, UITextViewDelegate {
    
   
    @IBOutlet weak var TextField: UITextField!
    @IBOutlet weak var TextView: UITextView!
    
    @IBOutlet var displayUrl: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func add(_ sender: AnyObject) {
        let DBRef:DatabaseReference = Database.database().reference()
        let url: String = String(TextField.text!)
        let comment: String = String(TextView.text!)
        let data = ["url": url, "comment": comment]
        DBRef.child("user/01").childByAutoId().setValue(data)
        let defaultPlace = DBRef.child("user/01")
        defaultPlace.observe(.value) {(snap: DataSnapshot) in
            let dic = snap.value as! [String: Any]
            self.displayUrl.text = dic["url"] as? String
        }
    }
    
    
//    @IBAction func post(_ sender: AnyObject) {
//        let DBRef:DatabaseReference = Database.database().reference()
//        let url: String = String(TextField.text!)
//        let data = ["url": url]
//        DBRef.child("user/01").setValue(data)
//
//        self.dismiss(animated: true, completion: nil)
//    }
    
}
