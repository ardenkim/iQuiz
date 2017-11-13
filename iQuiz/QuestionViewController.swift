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
    var quiz = [(question: String, answer: Int, answers: [String])]()
    var curQuestion = -1
    
    @IBOutlet weak var quizName: UILabel!
    @IBOutlet weak var quizDesc: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        quizName.text = quizTitle
        quizDesc.text = quizDescription
        questionLabel.text = quiz[curQuestion].question
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = quiz[curQuestion].answers[indexPath.row]
        return cell
    }
    
    @IBAction func submitClicked(_ sender: Any) {
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
