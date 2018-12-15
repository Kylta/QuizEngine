//
//  Flow.swift
//  QuizEngine
//
//  Created by Christophe Bugnon on 15/12/2018.
//  Copyright © 2018 Christophe Bugnon. All rights reserved.
//

import Foundation

protocol Router {
    typealias AnswerCallback = (String) -> Void
    func routesTo(question: String, answerCallback: @escaping AnswerCallback)
    func routeTo(result: [String: String])
}

class Flow {
    private let router: Router
    private let questions: [String]
    private var result = [String: String]()

    init(questions: [String], router: Router) {
        self.router = router
        self.questions = questions
    }

    func start() {
        if let firstQuestion = questions.first {
            router.routesTo(question: firstQuestion, answerCallback: nextCallback(from: firstQuestion))
        } else {
            router.routeTo(result: result)
        }
    }

    private func nextCallback(from question: String) -> Router.AnswerCallback {
        return { [weak self] in self?.routeNext(question, $0)
        }
    }

    private func routeNext(_ question: String, _ answer: String) {
        if let currentQuestionIndex = questions.index(of: question) {
            result[question] = answer
            let nextQuestionIndex = currentQuestionIndex + 1
            if nextQuestionIndex < questions.count {
                let nextQuestion = questions[nextQuestionIndex]
                router.routesTo(question: nextQuestion, answerCallback: nextCallback(from: nextQuestion))
            } else {
                router.routeTo(result: result)
            }
        }
    }
}
