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
        [[(question: "1 + 3 = ?", answer: 0, answers: ["4", "13", "3", "100"]),
          (question: "3^2 = ?", answer: 1, answers: ["3", "9", "1", "6"])],
         [(question: "What is Thor's hammer's name?", answer: 0, answers: ["Mjolnir", "Thunder Bringer", "Fjordir", "Anduril"])],
         [(question: "What is the boiling point of water?", answer: 1, answers: ["21ºF", "212ºF", "300ºF", "45ºF"])]]
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

