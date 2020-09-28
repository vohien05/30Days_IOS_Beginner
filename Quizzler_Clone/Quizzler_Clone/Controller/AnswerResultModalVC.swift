//
//  AnswerResultModalVC.swift
//  Quizzler_Clone
//
//  Created by Thien Tran on 9/27/20.
//

import UIKit

class AnswerResultModalVC: UIViewController {

    @IBOutlet weak var resultView: UIView!
    @IBOutlet weak var resultLabel: UILabel!
    
    var numberCorrectAnswer : Int = 0
    var numberQuestion: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(white: 0.5, alpha: 0.5)

        resultView.layer.cornerRadius = 5
        
        resultLabel.text = "\(numberCorrectAnswer) / \(numberQuestion) Correct Answer"

    }

    @IBAction func okButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
