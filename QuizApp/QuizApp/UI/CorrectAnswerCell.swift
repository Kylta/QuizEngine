//
//  CorrectAnswerCell.swift
//  QuizApp
//
//  Created by Christophe Bugnon on 16/12/2018.
//  Copyright © 2018 Christophe Bugnon. All rights reserved.
//

import UIKit

class CorrectAnswerCell: UITableViewCell {
    var presentableAnswer: PresentableAnswer! {
        didSet {
            questionLabel.text = presentableAnswer.question
            answerLabel.text = presentableAnswer.answer
        }
    }

    private(set) var questionLabel = UILabel()
    private(set) var answerLabel: UILabel = {
        let label = UILabel()
        label.textColor = .green
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    private func setupViews() {
        [questionLabel, answerLabel].forEach { $0.numberOfLines = 0 }
        
        let stackViewLabel = UIStackView(arrangedSubviews: [questionLabel, answerLabel])

        stackViewLabel.axis = .vertical
        stackViewLabel.alignment = .leading

        addSubview(stackViewLabel)
        stackViewLabel.translatesAutoresizingMaskIntoConstraints = false
        stackViewLabel.topAnchor.constraint(equalTo: topAnchor, constant: 4).isActive = true
        stackViewLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        stackViewLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        stackViewLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4).isActive = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
