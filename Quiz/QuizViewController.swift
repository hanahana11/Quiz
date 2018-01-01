//
//  QuizViewController.swift
//  Quiz
//
//  Created by 末利　花 on 2018/01/01.
//  Copyright © 2018年 末利　花. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {

    var QuizArray = [Any]()
    
    var correctAnswer: Int = 0
    
    @IBOutlet var quizTextView: UITextView!
    
    @IBOutlet var choiceButton1: UIButton!
    @IBOutlet var choiceButton2: UIButton!
    @IBOutlet var choiceButton3: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var tmpArray = [Any]()
        
        tmpArray.append(["問題文1","問題文1","問題文2","問題文3",1])
        tmpArray.append(["問題文2","問題文1","問題文2","問題文3",2])
        tmpArray.append(["問題文3","問題文1","問題文2","問題文3",2])
        tmpArray.append(["問題文4","問題文1","問題文2","問題文3",3])
        tmpArray.append(["問題文5","問題文1","問題文2","問題文3",3])
        tmpArray.append(["問題文6","問題文1","問題文2","問題文3",3])

        while (tmpArray.count > 0) {
            let index = Int(arc4random()) % tmpArray.count
            QuizArray.append(tmpArray[index])
            tmpArray.remove(at: index)
            
        }
        
        choiceQuiz()
        
        // Do any additional setup after loading the view.
    }
    func choiceQuiz() {
        
        let tmpArray = QuizArray[0] as! [Any]
        
        quizTextView.text = tmpArray[0] as! String
        
        choiceButton1.setTitle(tmpArray[1] as? String, for: .normal)
        choiceButton2.setTitle(tmpArray[2] as? String, for: .normal)
        choiceButton3.setTitle(tmpArray[3] as? String, for:  .normal)
    }
    
    @IBAction func choiceAnswer(sender: UIButton){
        
        let tmpArray = QuizArray[0] as! [Any]
        
        if tmpArray[4] as! Int == sender.tag {
            
           correctAnswer = correctAnswer + 1
        }
    
        QuizArray.remove(at: 0)
        
        if QuizArray.count == 0 {
            performSegueToResult()
        
        }else{
            choiceQuiz()
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
