//
//  Result.swift
//  QuizEngine
//
//  Created by Christophe Bugnon on 16/12/2018.
//  Copyright © 2018 Christophe Bugnon. All rights reserved.
//

import Foundation

public struct Result<Question: Hashable, Answer> {
    public let answers: [Question: Answer]
    public let score: Int
}
