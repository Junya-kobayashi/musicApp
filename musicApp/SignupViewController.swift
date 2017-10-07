//
//  SignupViewController.swift
//  musicApp
//
//  Created by 小林純也 on 2017/10/05.
//  Copyright © 2017年 Junya Kobayashi. All rights reserved.
//
//黄金比は1:1.618となる

import UIKit
import Firebase

class SignupViewController: UIViewController, UITextFieldDelegate {
    
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
        super.viewWillAppear(true)
        if self.checkUserVerify() {
            self.transitionToView()
        }
    }
    
    func checkUserVerify() -> Bool{
        guard let user = Auth.auth().currentUser else {return false}
        return user.isEmailVerified
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func willSignup(){
        signup()
    }
    
    @IBAction func willTransitionToLogin() {
        transitionToLogin()
    }
    
//    @IBAction func willLoginWithFacebook(){
//        self.loginWithFacebook()
//    }
    
    func transitionToLogin(){
        self.performSegue(withIdentifier: "toLogin", sender: self)
    }
    
    func transitionToView(){
        self.performSegue(withIdentifier: "toView", sender: self)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func signup() {
        guard let email = emailTextField.text else {return}
        guard let password = passwordTextField.text else {return}
        Auth.auth().createUser(withEmail: email, password: password, completion: { (user, error) in
            if error == nil {
                user?.sendEmailVerification(completion: {(error) in
                    if error == nil {
                        self.transitionToLogin()
                    }else{
                        print("\(String(describing: error?.localizedDescription))")
                    }
                })
                self.transitionToLogin()
            }else{
                print()
            }
        })
    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
