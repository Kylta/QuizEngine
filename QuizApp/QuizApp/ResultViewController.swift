//
//  ResultViewController.swift
//  QuizApp
//
//  Created by Christophe Bugnon on 16/12/2018.
//  Copyright © 2018 Christophe Bugnon. All rights reserved.
//

import UIKit

struct PresentableAnswer {
    let question: String
    let answer: String
    let isCorrect: Bool
}

class CorrectAnswerCell: UITableViewCell {

    var presentableAnswer: PresentableAnswer! {
        didSet {
        questionLabel.text = presentableAnswer.question
        answerLabel.text = presentableAnswer.answer
        }
    }

    var questionLabel = UILabel()
    var answerLabel = UILabel()
}

class WrongAnswerCell: UITableViewCell {

}

class ResultViewController: UITableViewController {

    private var summary = ""
    private var answers = [PresentableAnswer]()
    private let correctReuseIdentifier = "CorrectAnswerCell"

    convenience init(summary: String, answers: [PresentableAnswer]) {
        self.init()
        self.summary = summary
        self.answers = answers
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = summary
        tableView.register(CorrectAnswerCell.self, forCellReuseIdentifier: correctReuseIdentifier)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return answers.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let answer = answers[indexPath.row]
        if answer.isCorrect {
            let cell = tableView.dequeueReusableCell(withIdentifier: correctReuseIdentifier, for: indexPath) as! CorrectAnswerCell
            cell.presentableAnswer = answer
            return cell
        }
        return WrongAnswerCell()
    }
}
