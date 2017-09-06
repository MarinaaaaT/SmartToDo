//
//  LoginController.swift
//  SmartToDo
//
//  Created by Marina Tassi on 9/5/17.
//  Copyright © 2017 Marina Tassi. All rights reserved.
//

import UIKit
import RealmSwift

class LoginController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var loginError: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.hideKeyboardWhenTappedAround()
        loginError.isHidden = true
        
        //Logout all users
        let all = SyncUser.all
        for user in all{
            user.value.logOut()
        }
    }
    
    @IBAction func loginButton(_ sender: Any) {
        let url = URL(string: "http://165.227.86.55:9080")
        
        //Authenticate user to create synchronized realm with
        let username = email.text!
        let pw = password.text!
        if (username != "" && pw != ""){
            let usernameCredentials = SyncCredentials.usernamePassword(username: username, password: pw)
            login(userCred: usernameCredentials, url: url!, username: username, errorMessage: loginError)
        }
    }
    
    func login(userCred: SyncCredentials, url: URL, username: String, errorMessage: UILabel){
        print("This will fail")
        errorMessage.isHidden = false
        
        SyncUser.logIn(with: userCred, server: url){ user, error in
            //if user exists, open synchronized Realm with this user
            if let user = user {
                errorMessage.isHidden = true
                print(user , " now logged in")
                self.performSegue(withIdentifier: "login", sender: self)
            }
                //if user DNE, register a new user to host the synchronized realm
            else if let error = error {
                print("User DNE error" + error.localizedDescription)
            }
            else{
                print("NOT DOING ANYTHING")
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let accountCreationController = segue.destination as? AccountCreationController {
            accountCreationController.emailImport = self.email.text!
            accountCreationController.passwordImport = self.password.text!
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
