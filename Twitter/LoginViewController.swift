//
//  LoginViewController.swift
//  Twitter
//
//  Created by Jeffy Touth on 4/19/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    // Action is what you create when you want to do something when action occurs, outlet is when you create something you want to change
    @IBAction func onLoginButton(_ sender: Any) {
        TwitterAPICaller.client?.login(url: "https://api.twitter.com/oauth/request_token", success: {
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }, failure: { (Error) in
            print("Could not log in")
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
