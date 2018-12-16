//
//  ResultViewControllerTest.swift
//  QuizAppTests
//
//  Created by Christophe Bugnon on 16/12/2018.
//  Copyright © 2018 Christophe Bugnon. All rights reserved.
//

import XCTest
@testable import QuizApp

class ResultViewControllerTest: XCTestCase {

    func test_viewDidLoad_renderSummary() {
        let sut = ResultViewController(summary: "a summary", answers: [])

        _ = sut.view

        XCTAssertEqual(sut.navigationItem.title, "a summary")
    }

    func test_viewDidLoad_withoutAnswers_doesNotRenderAnswers() {
        let sut = ResultViewController(summary: "a summary", answers: [])

        _ = sut.view

        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 0)
    }

    func test_viewDidLoad_withOneAnswer_renderAnswer() {
        let sut = ResultViewController(summary: "a summary", answers: ["A1"])
        
        _ = sut.view

        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 1)
    }

}
