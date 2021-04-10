//
//  RegisterViewController.swift
//  Helpadora
//
//  Created by sadiq qasmi on 07/04/2021.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class RegisterViewController: UIViewController {
    
    var db: Firestore!
    
    let ref: DocumentReference? = nil
    

    @IBOutlet var user_name_text_field: UITextField!
    @IBOutlet var email_text_field: UITextField!
    @IBOutlet var password_text_field: UITextField!
    @IBOutlet var dob_text_field: UITextField!
    @IBOutlet var program_text_field: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        db = Firestore.firestore()
    }
    

    @IBAction func register_button(_ sender: Any) {
        if let email = email_text_field.text , let password = password_text_field.text ,let userName = user_name_text_field.text , let dob = dob_text_field.text , let program = program_text_field.text {
            Auth.auth().createUser(withEmail: email, password: password) { [self] (result, error) in
                let uid = Auth.auth().currentUser?.uid
                if error != nil {
                    print(error!.localizedDescription)
                }
                db.collection("user").document("\(uid!)").setData([
                                                    "user_name" : userName,
                                                    "dob": dob,
                                                    "program": program,
                                                    "uid": uid! ])
                
            }
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
