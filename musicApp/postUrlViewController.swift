//
//  postUrlViewController.swift
//  musicApp
//
//  Created by 小林純也 on 2017/09/28.
//  Copyright © 2017年 Junya Kobayashi. All rights reserved.
//

import UIKit
import Firebase

class postUrlViewController: UIViewController {

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
        let url: String = String(UITextField.text!)
        let data = ["url": url]
        if(data == null){
            DBRef.child("user/01").setValue(data)
        }else{
            DBRef.child("user/01").pushValue(data)
        }
        
    }
    
}
