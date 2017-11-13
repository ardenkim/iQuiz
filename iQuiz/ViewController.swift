//
//  ViewController.swift
//  iQuiz
//
//  Created by studentuser on 11/6/17.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var titles : [String] = ["Mathematics", "Marvel Superheros", "Science"]
    var descriptions : [String] = ["Math Quiz", "Marvel Superhero Quiz", "Science Quiz"]
    var icons : [String] = ["math", "marvel", "science"]
    var quizNum : Int = -1
    var quiz : [[(question: String, answer: Int, answers: [String])]] =
        [[(question: "math question 1?", answer: 0, answers: ["this is the answer", "two", "three", "four"]),
          (question: "math question 2?", answer: 1, answers: ["one2", "this is the answer2", "three2", "four2"])],
         [(question: "marvel question 1?", answer: 1, answers: ["one", "two", "three", "four"])],
         [(question: "science question 1?", answer: 1, answers: ["one", "two", "three", "four"])]]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        cell.textLabel!.text = self.titles[indexPath.row]
        cell.detailTextLabel?.text = self.descriptions[indexPath.row]
        cell.imageView?.image = UIImage(named: self.icons[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.quizNum = indexPath.row
        performSegue(withIdentifier: "quiz", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let questionVC: QuestionViewController = segue.destination as! QuestionViewController
        questionVC.quizTitle = self.titles[self.quizNum]
        questionVC.quizDescription = self.descriptions[self.quizNum]
        questionVC.curQuestion = 0
        questionVC.quiz = self.quiz[self.quizNum]
    }
    
    @IBAction func Settings(_ sender: Any) {
        let alertController = UIAlertController(title: "Settings", message: "Settings go here", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

