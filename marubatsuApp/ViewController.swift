//
//  ViewController.swift
//  marubatsuApp
//
//  Created by masataka maekawa on 2021/11/06.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var questionLabel: UILabel!
    
    var currentQuestionNum: Int = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let ud = UserDefaults.standard
  
        if (ud.object(forKey: "questions") == nil) {
            ud.set([], forKey: "questions")
        }
 
        showQuestion()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showQuestion()
    }
    
    @IBAction func tappedNoButton(_ sender: UIButton) {
        checkAnswer(yourAnswer: false)
    }
    
    
    @IBAction func tappedYesButton(_ sender: UIButton) {
        checkAnswer(yourAnswer: true)
    }
    
    func showQuestion() {
        let ud = UserDefaults.standard
        let questions:[[String: Any]] = ud.object(forKey: "questions") as! [[String: Any]]
        
        if (questions.count > currentQuestionNum) {
            
            let question = questions[currentQuestionNum]
            
            
            if let que = question["question"] as? String {
                
                questionLabel.text = que
                
            }
        } else {
            questionLabel.text = "問題がありません｡問題を作りましょう！"
        }
    }
    
    func checkAnswer(yourAnswer:Bool){
        let ud = UserDefaults.standard
        let questions: [[String: Any]] = ud.object(forKey: "questions") as! [[String : Any]]
        
        if (questions.count > currentQuestionNum) {

            let question = questions[currentQuestionNum]
        
        if let ans = question["answer"] as? Bool {
            
            if yourAnswer == ans {
                
                currentQuestionNum += 1
                showAlert(message: "正解!")
            } else {
                showAlert(message: "不正解...")
            }
            
        }
        if currentQuestionNum >= questions.count {
            currentQuestionNum = 0
        }
        
        showQuestion()
    }
        
    func showAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        
        let close = UIAlertAction(title: "閉じる", style: .cancel, handler: nil)
        alert.addAction(close)
        present(alert, animated: true, completion: nil)
    }
}
}
