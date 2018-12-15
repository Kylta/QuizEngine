//
//  FlowTest.swift
//  QuizEngineTests
//
//  Created by Christophe Bugnon on 15/12/2018.
//  Copyright © 2018 Christophe Bugnon. All rights reserved.
//

import Foundation
import XCTest
@testable import QuizEngine

class FlowTest: XCTestCase {

    func test_startWithNoQuestions_DoesNotRouteToQuestion() {
        let router = RouterSpy()
        let sut = Flow(questions: [], router: router)

        sut.start()

        XCTAssertEqual(router.routedQuestionCount, 0)
    }

    func test_startWithOneQuestion_routesToQuestion() {
        let router = RouterSpy()
        let sut = Flow(questions: ["Q1"], router: router)

        sut.start()

        XCTAssertEqual(router.routedQuestionCount, 1)
    }

    class RouterSpy: Router {
        var routedQuestionCount: Int = 0

        func routesTo(question: String) {
            routedQuestionCount += 1
        }

    }
}
