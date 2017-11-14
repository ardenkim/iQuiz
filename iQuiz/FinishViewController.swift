//
//  FinishViewController.swift
//  iQuiz
//
//  Created by studentuser on 11/13/17.
//

import UIKit

class FinishViewController: UIViewController {
    var correct = 0
    var total = 0
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!

    @IBAction func nextClicked(_ sender: Any) {
//        let mainVC = storyboard?.instantiateViewController(withIdentifier: "viewController") as! ViewController
//        present(mainVC, animated: false, completion: nil)
        performSegue(withIdentifier: "mainview", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var desc = ""
        if correct == total {
            desc = "Perfect!"
        } else if Double(correct) / Double(total) > 0.7 {
            desc = "Almost!"
        } else {
            desc = "Try again!"
        }

        descriptionLabel.text = desc
        resultLabel.text = "You got \(correct) out of \(total)!"
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
