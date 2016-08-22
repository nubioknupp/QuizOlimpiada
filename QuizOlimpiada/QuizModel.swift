//
//  QuizModel.swift
//  QuizOlimpiada
//
//  Created by Nubio Knupp on 21/08/16.
//  Copyright © 2016 Nubio Knupp. All rights reserved.
//

import Foundation
import UIKit

public class Questao {
    var strQuestao : String!;
    var imgQuestao : UIImage!;
    var answers : [Answer]!;
    
    init(questao : String, imagemName : String, answers : [Answer]){
        self.answers = answers;
        self.imgQuestao = UIImage(named: imagemName);
        self.strQuestao = questao;
    }
    
}

public class Answer {
    var strAnswers : String!;
    var IsCorrect : Bool!;
    
    init(answer : String, isCorrect : Bool){
        self.IsCorrect = isCorrect;
        self.strAnswers = answer;
    }
}