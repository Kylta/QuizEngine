//
//  GameTest.swift
//  QuizEngineTests
//
//  Created by Christophe Bugnon on 16/12/2018.
//  Copyright © 2018 Christophe Bugnon. All rights reserved.
//

import XCTest
import QuizEngine

class GameTest: XCTestCase {

    let router = RouterSpy()
    var game: Game<String, String, RouterSpy>!

    func test_startGame_answerOneOutOfTwoCorrectly_scoreZero() {
        game = startGame(questions: ["Q1", "Q2"], router: router, correctAnswers: ["Q1": "A1", "Q2": "A2"])

        router.answerCallback("wrong")
        router.answerCallback("wrong")

        XCTAssertEqual(router.routedResult!.score, 0)
    }

    func test_startGame_answerOneOutOfTwoCorrectly_scoreOne() {
        game = startGame(questions: ["Q1", "Q2"], router: router, correctAnswers: ["Q1": "A1", "Q2": "A2"])

        router.answerCallback("A1")
        router.answerCallback("wrong")

        XCTAssertEqual(router.routedResult!.score, 1)
    }

    func test_startGame_answerOneOutOfTwoCorrectly_scoreTwo() {
        game = startGame(questions: ["Q1", "Q2"], router: router, correctAnswers: ["Q1": "A1", "Q2": "A2"])

        router.answerCallback("A1")
        router.answerCallback("A2")

        XCTAssertEqual(router.routedResult!.score, 2)
    }

}
