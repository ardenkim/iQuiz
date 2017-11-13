//
//  AnswerViewController.swift
//  iQuiz
//
//  Created by studentuser on 11/13/17.
//

import UIKit

class AnswerViewController: UIViewController {
    var quizTitle : String = ""
    var quizDescription : String = ""
    var quiz = [(question: String, answer: Int, answers: [String])]()
    var curQuestion = -1
    var correct = 0
    var userAnswer = -1

    @IBOutlet weak var quizName: UILabel!
    @IBOutlet weak var quizDesc: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var correctLabel: UILabel!

    
    @IBAction func nextClicked(_ sender: Any) {
        curQuestion = curQuestion + 1
        if curQuestion < quiz.count {
            performSegue(withIdentifier: "quiz", sender: self)
        } else {
            performSegue(withIdentifier: "result", sender: self)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "quiz" {
            let questionVC: QuestionViewController = segue.destination as! QuestionViewController
            questionVC.quizTitle = self.quizTitle
            questionVC.quizDescription = self.quizDescription
            questionVC.curQuestion = self.curQuestion
            questionVC.quiz = self.quiz
            questionVC.correct = self.correct
            questionVC.userAnswer = -1
        } else {
            let finishVC: FinishViewController = segue.destination as! FinishViewController
            finishVC.result = "You got \(correct) out of \(quiz.count)!"
            if correct == quiz.count {
                finishVC.desc = "Perfect!"
            } else {
                finishVC.desc = "Almost!"
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        quizName.text = quizTitle
        quizDesc.text = quizDescription
        questionLabel.text = quiz[curQuestion].question
        let answerNum = quiz[curQuestion].answer
        answerLabel.text = quiz[curQuestion].answers[answerNum]
        if answerNum == userAnswer {
            correctLabel.text = "CORRECT!"
        } else {
            correctLabel.text = "Sorry, you missed it"
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
