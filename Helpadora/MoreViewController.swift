//
//  MoreViewController.swift
//  Helpadora
//
//  Created by sadiq qasmi on 11/04/2021.
//

import UIKit
import FirebaseAuth

class MoreViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func logout_button(_ sender: Any) {
        do{
        try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        }catch{
            print(error)
        }
        
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
