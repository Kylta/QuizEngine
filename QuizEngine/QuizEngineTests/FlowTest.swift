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

    // Prevent memory leaks
    weak var weakSUT: Flow<String, String, RouterSpy>?

    override func tearDown() {
        XCTAssertNil(weakSUT)
    }

    let router = RouterSpy()

    func test_start_WithNoQuestions_DoesNotRouteToQuestion() {
        makeSUT(questions: []).start()

        XCTAssertTrue(router.routedQuestions.isEmpty)
    }

    func test_start_WithOneQuestion_routesToCorrectQuestion() {
        makeSUT(questions: ["Q1"]).start()

        XCTAssertEqual(router.routedQuestions, ["Q1"])
    }

    func test_start_WithOneQuestion_routesToCorrectQuestion_2() {
        makeSUT(questions: ["Q2"]).start()

        XCTAssertEqual(router.routedQuestions, ["Q2"])
    }

    func test_start_WithTwoQuestions_routesToFirstQuestion() {
        makeSUT(questions: ["Q1", "Q2"]).start()

        XCTAssertEqual(router.routedQuestions, ["Q1"])
    }

    func test_startTwice_WithTwoQuestions_routesToFirstQuestionTwice() {
        let sut = makeSUT(questions: ["Q1", "Q2"])

        sut.start()
        sut.start()

        XCTAssertEqual(router.routedQuestions, ["Q1", "Q1"])
    }

    func test_startAndAnswerFirstAndSecondQuestion_WithThreeQuestions_routesToSecondAndThirdQuestion() {
        let sut = makeSUT(questions: ["Q1", "Q2", "Q3"])
        sut.start()

        router.answerCallback("A1")
        router.answerCallback("A2")

        XCTAssertEqual(router.routedQuestions, ["Q1", "Q2", "Q3"])
    }

    func test_startAndAnswerFirstQuestion_WithOneQuestion_doesNotRouteToAnotherQuestion() {
        let sut = makeSUT(questions: ["Q1"])
        sut.start()

        router.answerCallback("A1")

        XCTAssertEqual(router.routedQuestions, ["Q1"])
    }

    func test_start_WithNoQuestions_routesToResult() {
        makeSUT(questions: []).start()

        XCTAssertEqual(router.routedResult!, [:])
    }

    func test_start_WithOneQuestions_doesNotRouteToResult() {
        makeSUT(questions: ["Q1"]).start()

        XCTAssertNil(router.routedResult)
    }

    func test_startAndAnswerFirstQuestion_WithTwoQuestions_doesNotRouteToResult() {
        let sut = makeSUT(questions: ["Q1", "Q2"])
        sut.start()

        router.answerCallback("A1")

        XCTAssertNil(router.routedResult)
    }


    func test_startAndAnswerFirstAndSecondQuestion_WithTwoQuestions_routesToResult() {
        let sut = makeSUT(questions: ["Q1", "Q2"])
        sut.start()

        router.answerCallback("A1")
        router.answerCallback("A2")

        XCTAssertEqual(router.routedResult!, ["Q1": "A1", "Q2": "A2"])
    }

    // MARK: - Helpers

    func makeSUT(questions: [String]) -> Flow<String, String, RouterSpy> {
        let flow = Flow(questions: questions, router: router)
        weakSUT = flow
        return flow
    }

    class RouterSpy: Router {
        var routedQuestions = [String]()
        var routedResult: [String: String]? = nil
        var answerCallback: (String) -> Void = { _ in }

        func routesTo(question: String, answerCallback: @escaping ((String) -> Void)) {
            routedQuestions.append(question)
            self.answerCallback = answerCallback
        }

        func routeTo(result: [String: String]) {
            routedResult = result
        }
    }
}
