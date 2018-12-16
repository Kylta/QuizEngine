//
//  RouterSpy.swift
//  QuizEngineTests
//
//  Created by Christophe Bugnon on 16/12/2018.
//  Copyright © 2018 Christophe Bugnon. All rights reserved.
//

import Foundation
import QuizEngine

class RouterSpy: Router {
    var routedQuestions = [String]()
    var routedResult: Result<String, String>? = nil
    var answerCallback: (String) -> Void = { _ in }

    func routesTo(question: String, answerCallback: @escaping ((String) -> Void)) {
        routedQuestions.append(question)
        self.answerCallback = answerCallback
    }

    func routeTo(result: Result<String, String>) {
        routedResult = result
    }
}
