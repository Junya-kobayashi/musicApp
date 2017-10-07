//
//  LoginViewController.swift
//  musicApp
//
//  Created by 小林純也 on 2017/10/05.
//  Copyright © 2017年 Junya Kobayashi. All rights reserved.
//
//黄金比は1:1.618となる

import UIKit
import Firebase

class LoginViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet var emailTextField: UITextField!
    
    @IBOutlet var passwordTextField: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        passwordTextField.isSecureTextEntry = true

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didRegister(){
        login()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func transitionToView() {
        self.performSegue(withIdentifier: "toVC", sender: self)
    }
    
    func login(){
        guard let email = emailTextField.text else {return}
        guard let password = passwordTextField.text else {return}
        
        Auth.auth().signIn(withEmail: email, password: password, completion: {(user, error) in
            if error == nil {
                if let loginUser = user {
                    if self.checkUserValidate(user: loginUser){
                        print(Auth.auth().currentUser)
                        self.transitionToView()
                    }else{
                        self.presentValidateAlert()
                    }
                    self.transitionToView()
                }
            }else{
                print("error")
            }
        })
    }
    
    func checkUserValidate(user: User) -> Bool{
        return user.isEmailVerified
    }
    
    func presentValidateAlert() {
        let alert = UIAlertController(title: "メール認証", message: "メール認証を送ってください", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated:true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
