//
//  ViewController.swift
//  Quiz
//
//  Created by Nubio Knupp on 20/08/16.
//  Copyright © 2016 Nubio Knupp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
 
    @IBOutlet weak var DescricaoLabel: UILabel!
    
    @IBOutlet weak var DescricaoImage: UIImageView!
    
    @IBOutlet weak var btOpcao1: ButtonExtender!
    
    @IBOutlet weak var btOpcao2: ButtonExtender!
    
    @IBOutlet weak var btOpcao3: ButtonExtender!
    
    @IBOutlet weak var btOpcao4: ButtonExtender!
    
    @IBOutlet weak var vwFeedBack: UIView!
    
    @IBOutlet weak var lbFeedBack: UILabel!
    
    @IBOutlet weak var btFeedBack: ButtonExtender!
    
    var questoes : [Questao]!
    var questaoAtual = 0;
    var nota = 0.0;
    var quizEnded = false;
    

    override func viewDidLoad() {
        super.viewDidLoad();
        
        let questaoOpcao0 = Answer(answer: "Michael Phelps", isCorrect : true);
        let questaoOpcao1 = Answer(answer: "Nadia Comăneci", isCorrect : false);
        let questaoOpcao2 = Answer(answer: "Larissa Latynina", isCorrect : false);
        let questaoOpcao3 = Answer(answer: "Usain Bolt", isCorrect : false);
        
        let questao0 = Questao(questao : "Quem é maior campeão olimpico da história?", imagemName : "MedalhaOuro", answers : [questaoOpcao0, questaoOpcao1, questaoOpcao2, questaoOpcao3]);
        
        /*let questaoOpcao00 = Answer(answer: "Michael Phelps", isCorrect : true);
        let questaoOpcao11 = Answer(answer: "Nadia Comăneci", isCorrect : false);
        let questaoOpcao22 = Answer(answer: "Larissa Latynina", isCorrect : false);
        let questaoOpcao33 = Answer(answer: "Usain Bolt", isCorrect : false);
        
        let questao1 = Questao(questao : "Quem é maior campeão olimpico da história?", imagemName : "MedalhaOuro", answers : [questaoOpcao00, questaoOpcao11, questaoOpcao22, questaoOpcao33]);
        
        let questaoOpcao04 = Answer(answer: "Michael Phelps", isCorrect : true);
        let questaoOpcao15 = Answer(answer: "Nadia Comăneci", isCorrect : false);
        let questaoOpcao26 = Answer(answer: "Larissa Latynina", isCorrect : false);
        let questaoOpcao37 = Answer(answer: "Usain Bolt", isCorrect : false);
        
        let questao2 = Questao(questao : "Quem é maior campeão olimpico da história?", imagemName : "MedalhaOuro", answers : [questaoOpcao04, questaoOpcao15, questaoOpcao26, questaoOpcao37]);
        
        let questaoOpcao08 = Answer(answer: "Michael Phelps", isCorrect : true);
        let questaoOpcao19 = Answer(answer: "Nadia Comăneci", isCorrect : false);
        let questaoOpcao210 = Answer(answer: "Larissa Latynina", isCorrect : false);
        let questaoOpcao311 = Answer(answer: "Usain Bolt", isCorrect : false);
        
        let questao3 = Questao(questao : "Quem é maior campeão olimpico da história?", imagemName : "MedalhaOuro", answers : [questaoOpcao08, questaoOpcao19, questaoOpcao210, questaoOpcao311]);
        
        let questaoOpcao012 = Answer(answer: "Michael Phelps", isCorrect : true);
        let questaoOpcao113 = Answer(answer: "Nadia Comăneci", isCorrect : false);
        let questaoOpcao214 = Answer(answer: "Larissa Latynina", isCorrect : false);
        let questaoOpcao315 = Answer(answer: "Usain Bolt", isCorrect : false);
        
        let questao4 = Questao(questao : "Quem é maior campeão olimpico da história?", imagemName : "MedalhaOuro", answers : [questaoOpcao012, questaoOpcao113, questaoOpcao214, questaoOpcao315]);
        
        let questaoOpcao016 = Answer(answer: "Michael Phelps", isCorrect : true);
        let questaoOpcao117 = Answer(answer: "Nadia Comăneci", isCorrect : false);
        let questaoOpcao218 = Answer(answer: "Larissa Latynina", isCorrect : false);
        let questaoOpcao319 = Answer(answer: "Usain Bolt", isCorrect : false);
        
        let questao5 = Questao(questao : "Quem é maior campeão olimpico da história?", imagemName : "MedalhaOuro", answers : [questaoOpcao016, questaoOpcao117, questaoOpcao218, questaoOpcao319]);*/
        
        /*let questaoOpcao020 = Answer(answer: "Michael Phelps", isCorrect : true);
        let questaoOpcao121 = Answer(answer: "Nadia Comăneci", isCorrect : false);
        let questaoOpcao222 = Answer(answer: "Larissa Latynina", isCorrect : false);
        let questaoOpcao323 = Answer(answer: "Usain Bolt", isCorrect : false);
        
        let questao6 = Questao(questao : "Quem é maior campeão olimpico da história?", imagemName : "MedalhaOuro", answers : [questaoOpcao020, questaoOpcao121, questaoOpcao222, questaoOpcao323]);*/
        
        
        
        //questoes = [questao0, questao1, questao2,questao3,questao4,questao5];
        
        questoes = [questao0];
        
        startQuiz();
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func startQuiz(){
        questoes.shuffle();
        for i in 0 ..< questoes.count {
            questoes[i].answers.shuffle();
        }
        
        quizEnded = false;
        nota = 0.0;
        questaoAtual = 0;
        
        showQuestao(0)
        
    }
    
    func showQuestao(index : Int) {
        DescricaoLabel.text = questoes[index].strQuestao;
        DescricaoImage.image = questoes[index].imgQuestao;
        btOpcao1.setTitle(questoes[index].answers[0].strAnswers, forState: UIControlState.Normal)
        btOpcao2.setTitle(questoes[index].answers[1].strAnswers, forState: UIControlState.Normal)
        btOpcao3.setTitle(questoes[index].answers[2].strAnswers, forState: UIControlState.Normal)
        btOpcao4.setTitle(questoes[index].answers[3].strAnswers, forState: UIControlState.Normal)
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func chooseOpcao1(sender: AnyObject) {
    }


    @IBAction func chooseOpcao2(sender: AnyObject) {
    }

    @IBAction func chooseOpcao3(sender: AnyObject) {
    }
    
    
    @IBAction func chooseOpcao4(sender: AnyObject) {
    }
    
    @IBAction func btFeedBack(sender: AnyObject) {
    }
}

