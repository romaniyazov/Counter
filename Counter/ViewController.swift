//
//  ViewController.swift
//  Counter
//
//  Created by Роман Ниязов on 10.08.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainCountLabel: UILabel!
    @IBOutlet weak var historyTextView: UITextView!
    
    let dateFormatter = DateFormatter()
    
    var count: Int = 0 {
        didSet {
            mainCountLabel.text = "\(count)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
    }
    
    @IBAction func resetButtonPressed(_ sender: Any) {
        count = 0
        historyTextView.text += "\n\(currentDatePretty()): значение сброшено"
    }

    @IBAction func minusButtonPressed(_ sender: Any) {
        if count > 0 {
            count -= 1
            historyTextView.text += "\n\(currentDatePretty()): значение изменено на -1"
        } else {
            historyTextView.text += "\n\(currentDatePretty()): попытка уменьшить значение счётчика ниже 0"
        }
    }

    @IBAction func plusButtonPressed(_ sender: Any) {
        count += 1
        historyTextView.text += "\n\(currentDatePretty()): значение изменено на +1"
    }
    
    func currentDatePretty() -> String {
        dateFormatter.string(from: Date())
    }
}
