//
//  LoginViewController.swift
//  Helpadora
//
//  Created by sadiq qasmi on 06/04/2021.
//

import UIKit
import FirebaseAuth
class LoginViewController: UIViewController {

    @IBOutlet var email_text_field: UITextField!
    @IBOutlet var pass_text_field: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        let imageView = UIImageView(frame: CGRect())
        imageView.contentMode = .scaleToFill
           let image = UIImage(named: "Login Image")
           imageView.image = image
           navigationItem.titleView = imageView
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func login_button(_ sender: Any) {
        Auth.auth().createUser(withEmail: email_text_field.text!, password: pass_text_field.text!) { (result, err) in
            let error = err
            if error != nil{
                print(error!)
            }
            self.performSegue(withIdentifier: "toHome", sender: self)
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
