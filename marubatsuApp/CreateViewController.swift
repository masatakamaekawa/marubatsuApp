//
//  CreateViewController.swift
//  marubatsuApp
//
//  Created by masataka maekawa on 2021/11/08.
//

import UIKit

class CreateViewController: UIViewController {
    

    @IBOutlet weak var addTextField: UITextField!
    @IBOutlet weak var answerButton: UISegmentedControl!

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func retuenButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButton(_ sender: Any) {
        
        var answer: Bool = true
        
        if answerButton.selectedSegmentIndex == 0 {
            answer = true
        }
        else {
            answer = false
        }
        
        let questionText:String = addTextField.text!

        let ud = UserDefaults.standard
        var questions: [[String: Any]] = ud.object(forKey: "questions") as! [[String : Any]]
        
        questions.append( [
            "question": questionText,
            "answer": answer
        ])
        ud.set(questions, forKey: "questions")
        if addTextField.text == ""{
        Alert().showAlert(title: "問題を入力してください", message: "", viewController: self)
        }
    }
        
        
    @IBAction func deleteButton(_ sender: Any) {
        let ud = UserDefaults.standard
        
        ud.removeObject(forKey: "questions")
        
        ud.set([], forKey: "questions")
        Alert().showAlert(title: "全ての問題を削除しました", message: "", viewController: self)
    }
 

}
