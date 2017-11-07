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

