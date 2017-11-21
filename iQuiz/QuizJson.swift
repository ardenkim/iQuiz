//
//  QuizJson.swift
//  iQuiz
//
//  Created by studentuser on 11/20/17.
//

import UIKit

class QuizJson: NSObject {
    static let quizJson = QuizJson()
    var urlSource: String = "https://tednewardsandbox.site44.com/questions.json"
    var data: [[String:Any]]?
    var fileURL : URL?
    
    override init() {
        super.init()
        let DocumentDirURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        fileURL = DocumentDirURL.appendingPathComponent("quizData").appendingPathExtension("json")
        load(ViewController.vc.sourceURL)
    }
    
    func load(_ newSource: String) {
        do {
            var content: NSData?
            if (newSource != "") {
                content = NSData(contentsOf: URL(string: newSource)!)
            } else {
                content = NSData(contentsOf: URL(string: urlSource)!)
            }
            if (content == nil) {
                do {
                    content = try NSData(contentsOf: fileURL!)
                } catch {
                    print(error)
                }
            }
            if (content != nil) {
                data = try JSONSerialization.jsonObject(with: content as! Data, options: []) as! [[String:Any]]
                save(content!)
            }
        } catch {
            print(error)
        }
    }
    
    func save(_ content:NSData){
        do {
            if let questions = String(data: content as Data, encoding: String.Encoding.utf8) {
                try questions.write(to: fileURL!, atomically: true, encoding: String.Encoding.utf8)
            }
        } catch {
            print(error)
        }
    }
}
