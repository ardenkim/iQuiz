//
//  QuestionViewController.swift
//  iQuiz
//
//  Created by studentuser on 11/12/17.
//

import UIKit

class QuestionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var quizTitle : String = ""
    var quizDescription : String = ""
    var quiz : [Any]?
    var options : [String]?
    var correctAnswer = -1;
    
    var curQuestion = -1
    var correct = 0
    var userAnswer = -1
    
    @IBOutlet weak var quizName: UILabel!
    @IBOutlet weak var quizDesc: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        quizName.text = quizTitle
        quizDesc.text = quizDescription
        
        let curQuestionObj = quiz![curQuestion] as! [String:Any]
        options = curQuestionObj["answers"] as! [String]
        correctAnswer = Int(curQuestionObj["answer"] as! String)! - 1
        
        questionLabel.text = curQuestionObj["text"] as! String
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = options![indexPath.row]
        return cell
    }
    
    @IBAction func submitClicked(_ sender: Any) {
        if userAnswer != -1 {
            if userAnswer == correctAnswer {
                correct = correct + 1
            }
            performSegue(withIdentifier: "answer", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let answerVC: AnswerViewController = segue.destination as! AnswerViewController
        answerVC.quizTitle = self.quizTitle
        answerVC.quizDescription = self.quizDescription
        answerVC.curQuestion = self.curQuestion
        answerVC.quiz = self.quiz
        answerVC.correct = self.correct
        answerVC.userAnswer = self.userAnswer
        answerVC.correctAnswer = self.correctAnswer
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.userAnswer = indexPath.row
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
