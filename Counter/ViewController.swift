//
//  ViewController.swift
//  Counter
//
//  Created by Роман Ниязов on 10.08.2024.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet private weak var mainCountLabel: UILabel!
    @IBOutlet private weak var historyTextView: UITextView!
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        return formatter
    }()
    
    private var count: Int = 0 {
        didSet {
            mainCountLabel.text = "\(count)"
        }
    }
    
    @IBAction private func resetButtonPressed(_ sender: Any) {
        count = 0
        historyTextView.text += "\n\(currentDatePretty()): значение сброшено"
    }
    
    @IBAction private func minusButtonPressed(_ sender: Any) {
        if count > 0 {
            count -= 1
            historyTextView.text += "\n\(currentDatePretty()): значение изменено на -1"
        } else {
            historyTextView.text += "\n\(currentDatePretty()): попытка уменьшить значение счётчика ниже 0"
        }
    }
    
    @IBAction private func plusButtonPressed(_ sender: Any) {
        count += 1
        historyTextView.text += "\n\(currentDatePretty()): значение изменено на +1"
    }
    
    private func currentDatePretty() -> String {
        dateFormatter.string(from: Date())
    }
}
