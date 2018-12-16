//
//  Flow.swift
//  QuizEngine
//
//  Created by Christophe Bugnon on 15/12/2018.
//  Copyright © 2018 Christophe Bugnon. All rights reserved.
//

import Foundation

protocol Router {
    associatedtype Question: Hashable
    associatedtype Answer
    typealias AnswerCallback = (Answer) -> Void

    func routesTo(question: Question, answerCallback: @escaping AnswerCallback)
    func routeTo(result: [Question: Answer])
}

class Flow<Question, Answer, R: Router> where R.Question == Question, R.Answer == Answer {
    private let router: R
    private let questions: [Question]
    private var result = [Question: Answer]()

    init(questions: [Question], router: R) {
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

    private func nextCallback(from question: Question) -> R.AnswerCallback {
        return { [weak self] in self?.routeNext(question, $0) }
    }

    private func routeNext(_ question: Question, _ answer: Answer) {
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
