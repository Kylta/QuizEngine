//
//  ResultViewController.swift
//  QuizApp
//
//  Created by Christophe Bugnon on 16/12/2018.
//  Copyright © 2018 Christophe Bugnon. All rights reserved.
//

import UIKit

class ResultViewController: UITableViewController {

    private var summary = ""
    private var answers = [PresentableAnswer]()
    private let correctReuseIdentifier = "CorrectAnswerCell"
    private let wrongReuseIdentifier = "wrongAnswerCell"

    convenience init(summary: String, answers: [PresentableAnswer]) {
        self.init()
        self.summary = summary
        self.answers = answers
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = summary
        tableView.register(CorrectAnswerCell.self)
        tableView.register(WrongAnswerCell.self)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return answers.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let answer = answers[indexPath.row]
        guard answer.wrongAnswer == nil else {
            return wrongAnswerCell(for: answer, indexPath: indexPath)
        }
        return correctAnswerCell(for: answer, indexPath: indexPath)
    }

    private func correctAnswerCell(for answer: PresentableAnswer, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(CorrectAnswerCell.self, indexPath: indexPath)
        cell.presentableAnswer = answer
        return cell
    }

    private func wrongAnswerCell(for answer: PresentableAnswer, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(WrongAnswerCell.self, indexPath: indexPath)
        cell.presentableAnswer = answer
        return cell
    }
}
