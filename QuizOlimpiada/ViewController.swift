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
    
    @IBOutlet weak var viewFeedBack: UIView!
    
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
        
        let questaoOpcao00 = Answer(answer: "Fuleco e Zakumi", isCorrect : false);
        let questaoOpcao11 = Answer(answer: "Cazuza e Ayrton", isCorrect : false);
        let questaoOpcao22 = Answer(answer: "Raul e Renato", isCorrect : false);
        let questaoOpcao33 = Answer(answer: "Vinicius e Tom", isCorrect : true);
        
        let questao1 = Questao(questao : "Quais foram os nomes escolhidos para os mascotes dos Jogos Olímpicos e Paralímpicos de 2016?", imagemName : "mascotes-olimpicos-rio-2016", answers : [questaoOpcao00, questaoOpcao11, questaoOpcao22, questaoOpcao33]);
        
        let questaoOpcao04 = Answer(answer: "2º lugar", isCorrect : false);
        let questaoOpcao15 = Answer(answer: "3º lugar", isCorrect : false);
        let questaoOpcao26 = Answer(answer: "5º lugar", isCorrect : false);
        let questaoOpcao37 = Answer(answer: "10º lugar", isCorrect : true);
        
        let questao2 = Questao(questao : "Segundo o Comitê Olímpico Brasileiro, o objetivo é que o Brasil fique em que posição no ranking de medalhas?", imagemName : "medalhas", answers : [questaoOpcao04, questaoOpcao15, questaoOpcao26, questaoOpcao37]);
        
        let questaoOpcao08 = Answer(answer: "Alemanha", isCorrect : false);
        let questaoOpcao19 = Answer(answer: "Fança", isCorrect : false);
        let questaoOpcao210 = Answer(answer: "Espanha", isCorrect : false);
        let questaoOpcao311 = Answer(answer: "Grécia", isCorrect : true);
        
        let questao3 = Questao(questao : "A cidade de Olímpia, que deu origem aos jogos olímpicos, fica localizada em que país europeu?", imagemName : "Olimpiada", answers : [questaoOpcao08, questaoOpcao19, questaoOpcao210, questaoOpcao311]);
        
        let questaoOpcao012 = Answer(answer: "Michael Phelps", isCorrect : false);
        let questaoOpcao113 = Answer(answer: "Nadia Comăneci", isCorrect : false);
        let questaoOpcao214 = Answer(answer: "Vanderlei Cordeiro de Lima", isCorrect : true);
        let questaoOpcao315 = Answer(answer: "Usain Bolt", isCorrect : false);
        
        let questao4 = Questao(questao : "Qual desses atletas ganhou a Medalha Pierre de Coubertin, maior honraria dos Jogos Olímpicos?", imagemName : "MedalhaPierreCoubertin", answers : [questaoOpcao012, questaoOpcao113, questaoOpcao214, questaoOpcao315]);
        
        let questaoOpcao016 = Answer(answer: "Shaquille O'Neal", isCorrect : true);
        let questaoOpcao117 = Answer(answer: "Michael Jordan", isCorrect : false);
        let questaoOpcao218 = Answer(answer: "Larry Bird", isCorrect : false);
        let questaoOpcao319 = Answer(answer: "Magic Johnson", isCorrect : false);
        
        let questao5 = Questao(questao : "Qual desses astros do basquete não estava no Dream Team que representou os EUA nos Jogos de 1992?", imagemName : "Eua1992DreamTeamBasquete", answers : [questaoOpcao016, questaoOpcao117, questaoOpcao218, questaoOpcao319]);
        
        
        questoes = [questao0, questao1, questao2,questao3,questao4,questao5];
        
       
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
        btOpcao1.hidden = false;
        btOpcao2.hidden = false;
        btOpcao3.hidden = false;
        btOpcao4.hidden = false;
        
        DescricaoImage.hidden = false;
        DescricaoLabel.hidden = false;
        
        viewFeedBack.hidden = true;
        
      
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
    
    func selectAnswer(answerId : Int) {
        btOpcao1.hidden = true;
        btOpcao2.hidden = true;
        btOpcao3.hidden = true;
        btOpcao4.hidden = true;
        
        DescricaoImage.hidden = true;
        
        viewFeedBack.hidden = false;
        
        let answer1 : Answer = questoes[questaoAtual].answers[answerId];
        
        if (answer1.IsCorrect == true) {
            nota += 1.0;
            lbFeedBack.text = answer1.strAnswers + "\n\nResposta correta!"
        } else{
            lbFeedBack.text = answer1.strAnswers + "\n\nResposta errada...";
        }
        
        if (questaoAtual < questoes.count - 1) {
            btFeedBack.setTitle("Próxima", forState: UIControlState.Normal);
        } else{
            btFeedBack.setTitle("Ver Nota", forState: UIControlState.Normal);
        }
        
    }
    
    
    @IBAction func chooseOpcao1(sender: AnyObject) {
        selectAnswer(0);
    }


    @IBAction func chooseOpcao2(sender: AnyObject) {
        selectAnswer(1);
    }

    @IBAction func chooseOpcao3(sender: AnyObject) {
        selectAnswer(2);
    }
    
    
    @IBAction func chooseOpcao4(sender: AnyObject) {
        selectAnswer(3);
    }
    
    @IBAction func btFeedBack(sender: AnyObject) {
        if(quizEnded){
            startQuiz();
        }else{
            proximaQuestao();
        }
    }
    
    func proximaQuestao(){
        questaoAtual += 1;
        
        if (questaoAtual < questoes.count) {
            showQuestao(questaoAtual);
        } else{
            endQuiz()
        }
    }
    
    func endQuiz() {
        nota = nota / Double(questoes.count) * 100;
        quizEnded = true;
        viewFeedBack.hidden = false;
        DescricaoLabel.hidden = true;
        lbFeedBack.text = "Sua nota: \(nota)";
        btFeedBack.setTitle("Refazer", forState: UIControlState.Normal);
    }

}

