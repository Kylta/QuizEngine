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

    func test_start_WithNoQuestions_DoesNotRouteToQuestion() {
        let router = RouterSpy()
        let sut = Flow(questions: [], router: router)

        sut.start()

        XCTAssertEqual(router.routedQuestionCount, 0)
    }

    func test_start_WithOneQuestion_routesToQuestion() {
        let router = RouterSpy()
        let sut = Flow(questions: ["Q1"], router: router)

        sut.start()

        XCTAssertEqual(router.routedQuestionCount, 1)
    }

    func test_start_WithOneQuestion_routesToCorrectQuestion() {
        let router = RouterSpy()
        let sut = Flow(questions: ["Q1"], router: router)

        sut.start()

        XCTAssertEqual(router.routedQuestion, "Q1")
    }

    func test_start_WithOneQuestion_routesToCorrectQuestion_2() {
        let router = RouterSpy()
        let sut = Flow(questions: ["Q2"], router: router)

        sut.start()

        XCTAssertEqual(router.routedQuestion, "Q2")
    }

    func test_start_WithTwoQuestions_routesToFirstQuestion() {
        let router = RouterSpy()
        let sut = Flow(questions: ["Q1", "Q2"], router: router)

        sut.start()

        XCTAssertEqual(router.routedQuestion, "Q1")
    }

    class RouterSpy: Router {
        var routedQuestionCount: Int = 0
        var routedQuestion: String? = nil

        func routesTo(question: String) {
            routedQuestionCount += 1
            routedQuestion = question
        }

    }
}
