//
//  AccountCreationController.swift
//  SmartToDo
//
//  Created by Marina Tassi on 9/5/17.
//  Copyright © 2017 Marina Tassi. All rights reserved.
//

import UIKit

class AccountCreationController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    var emailImport:String?
    var passwordImport:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if(emailImport == nil){
            emailImport = ""
        }
        if(passwordImport == nil){
            passwordImport = ""
        }
        
        email.text = emailImport
        password.text = passwordImport
        // Do any additional setup after loading the view.
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
