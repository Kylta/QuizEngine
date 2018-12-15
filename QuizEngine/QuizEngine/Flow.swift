//
//  Flow.swift
//  QuizEngine
//
//  Created by Christophe Bugnon on 15/12/2018.
//  Copyright © 2018 Christophe Bugnon. All rights reserved.
//

import Foundation

protocol Router {
    func routesTo(question: String)
}

class Flow {
    let router: Router
    let questions: [String]

    init(questions: [String], router: Router) {
        self.router = router
        self.questions = questions
    }

    func start() {
        if let firstQuestion = questions.first {
        router.routesTo(question: firstQuestion)
        }
    }
}
