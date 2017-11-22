//
//  ViewController.swift
//  iQuiz
//
//  Created by studentuser on 11/6/17.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIPopoverPresentationControllerDelegate {
    static let vc = ViewController()
    
    var sourceURL: String = ""
    var questions : [[String:Any]]?
    var selectedQuestionList : [Any]?
    var icons : [String] = ["science", "marvel", "math"]
    var quizNum : Int = -1
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dict = questions![indexPath.row] as [String:Any]
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        let title = dict["title"] as! String
        cell.textLabel!.text = title
        cell.detailTextLabel?.text = dict["desc"] as! String
        cell.imageView?.image = UIImage(named: self.icons[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.quizNum = indexPath.row
        let dict = questions![self.quizNum] as [String:Any]
        selectedQuestionList = dict["questions"] as! [Any]
        
        performSegue(withIdentifier: "quiz", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "setting") {
            let settingVC = segue.destination
            settingVC.modalPresentationStyle = UIModalPresentationStyle.popover
            settingVC.popoverPresentationController?.delegate = self
        } else {
            let questionVC: QuestionViewController = segue.destination as! QuestionViewController
            let dict = questions![self.quizNum] as [String:Any]

            questionVC.quizTitle = dict["title"] as! String
            questionVC.quizDescription = dict["desc"] as! String
            questionVC.curQuestion = 0
            questionVC.quiz = selectedQuestionList
        }
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.none
    }

    @IBAction func Settings(_ sender: Any) {
        performSegue(withIdentifier: "setting", sender: self)
    }
    @IBOutlet weak var newURL: UITextField!

    @IBAction func checkNow(_ sender: Any) {
        if newURL.text! != "" {
            QuizJson.quizJson.load(newURL.text!)
            viewDidLoad()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (QuizJson.quizJson.data != nil) {
            questions = QuizJson.quizJson.data!
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private let refreshControl = UIRefreshControl()
    
    @objc
    func refresh() {
        refreshControl.beginRefreshing()
        self.viewDidLoad()
        self.refreshControl.endRefreshing()
    }
}

