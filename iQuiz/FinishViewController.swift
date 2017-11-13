//
//  FinishViewController.swift
//  iQuiz
//
//  Created by studentuser on 11/13/17.
//

import UIKit

class FinishViewController: UIViewController {
    var result: String = ""
    var desc: String = ""
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!

    @IBAction func nextClicked(_ sender: Any) {
//        let mainVC = storyboard?.instantiateViewController(withIdentifier: "viewController") as! ViewController
//        present(mainVC, animated: false, completion: nil)
        performSegue(withIdentifier: "mainview", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        descriptionLabel.text = desc
        resultLabel.text = result
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
