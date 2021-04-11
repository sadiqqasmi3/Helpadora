//
//  SubmitQueryViewController.swift
//  Helpadora
//
//  Created by sadiq qasmi on 10/04/2021.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class SubmitQueryViewController: UIViewController {
    
    @IBOutlet var query_title: UITextField!
    @IBOutlet var query_description: UITextView!
    @IBOutlet var last_date_picker: UIDatePicker!
    @IBOutlet var location_picker: UIPickerView!
    
    
    var db: Firestore!
    let ref: DocumentReference? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        db = Firestore.firestore()
        
        let date2 = last_date_picker.date
        print("\n\(date2)")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        let posterId = Auth.auth().currentUser?.uid
        print(posterId)
        print(Auth.auth().currentUser?.uid)
    }
    @IBAction func submit_query(_ sender: Any) {
        let LastDate = last_date_picker.date
        let posterId = Auth.auth().currentUser?.uid
        if let queryTitle = query_title.text , let queryDescription = query_description.text  {
            db.collection("query").document().setData(["queryTitle" : queryTitle,
                                                       "queryDescription":queryDescription,
                                                       "lastDate":LastDate,
                                                       "posterId":posterId!]) { (error) in
                if error != nil{
                    print(error!)
                }
                    for vc in self.navigationController!.viewControllers {
                        if let myViewCont = vc as? CommunityViewController
                        {
                            print(myViewCont)
                            self.navigationController?.popToViewController(myViewCont, animated: true)
                        }
                    }
                
                
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
