//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Xinyi Zhu on 5/23/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let answer: Array<String>
    let correctAnswer: String
    
    init(q: String, a: Array<String>, correctAnswer: String) {
        text = q
        answer = a
        self.correctAnswer = correctAnswer
    }
}
