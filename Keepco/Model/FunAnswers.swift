//
//  FunAnswers.swift
//  Keepco
//
//  Created by Usman Meraj on 9/14/20.
//  Copyright © 2020 Usman Meraj. All rights reserved.
//

import Foundation

class FunAnswers {
    class func getQuestions(parent: Int, child: Int) -> [Questions] {
        var array = [Questions]()
        if(language == "en"){
            if (parent == 0) {
                array = [Questions(question1: "I dance", question2: "I dance__ competitively", question3: "")]
                
            } else if (parent == 1) {
                array = [Questions(question1: "I like to watch", question2: "I play", question3: "I’m a fan of")]
                
            } else if (parent == 2) {
                array = [Questions(question1: "I like to watch", question2: "I love playing / to train", question3: "")]
                
            } else if (parent == 3) {
                array = [Questions(question1: "I love playing", question2:"I compete in", question3: "")]
                
            } else if (parent == 4) {
                array = [Questions(question1: "", question2:"", question3: "")]
                
            } else if (parent == 5) {
                array = [Questions(question1: "I like to watch__ shows", question2: "I love to", question3: "")]
                
            } else if (parent == 6) {
                array = [Questions(question1: "", question2: "", question3: "")]
                
            } else if (parent == 7) {
                array = [Questions(question1: "", question2: "", question3: "")]
                
            } else if (parent == 8) {
                array = [Questions(question1: "", question2: "", question3: "")]
                
            } else if (parent == 9) {
                array = [Questions(question1: "", question2: "", question3: "")]
                
            } else if (parent == 10) {
                array = [Questions(question1: "I like to watch__ shows", question2: "I love to/ to do", question3: "")]
                
            } else {
                array = [Questions(question1: "", question2: "", question3: "")]
            }
            return array
        }
        else {
           if (parent == 0) {
               array = [Questions(question1: "אני אוהב לרקוד ___ .", question2: "אני רוקד/ת  ___ באופן מקצועני.", question3: "")]
               
           } else if (parent == 1) {
               array = [Questions(question1: "אני אוהב/ת לצפות ב __ .", question2: "אני אוהב/ת לשחק ___ .", question3: "אני אוהד/ת את ___ .")]
               
           } else if (parent == 2) {
               array = [Questions(question1: "אני אוהב/ת לצפות ב ___ .", question2: "אני אוהב/ת לשחק/ להתאמן ב ___ .", question3: "")]
               
           } else if (parent == 3) {
            array = [Questions(question1: "אני אוהב/ת לשחק ב ___ .", question2: "אני מתחרה ב ___ .", question3: "")]
               
           } else if (parent == 4) {
               array = [Questions(question1: "", question2:"", question3: "")]
               
           } else if (parent == 5) {
               array = [Questions(question1: "אני אוהב/ת לצפות בתכניות ___ .", question2: "אני אוהב/ת ___ .", question3: "")]
               
           } else if (parent == 6) {
               array = [Questions(question1: "", question2: "", question3: "")]
               
           } else if (parent == 7) {
               array = [Questions(question1: "", question2: "", question3: "")]
               
           } else if (parent == 8) {
               array = [Questions(question1: "", question2: "", question3: "")]
               
           } else if (parent == 9) {
               array = [Questions(question1: "", question2: "", question3: "")]
               
           } else if (parent == 10) {
               array = [Questions(question1: "אני אוהב/ת לצפות בתכניות ___ .", question2: "אני אוהב/ת לעשות ___ . ", question3: "")]
               
           } else {
               array = [Questions(question1: "", question2: "", question3: "")]
           }
           return array
        }
    }
}




class Questions {
    
    internal init(question1: String, question2: String, question3: String) {
        self.question1 = question1
        self.question2 = question2
        self.question3 = question3
    }
    
    var question1: String
    var question2: String
    var question3: String
    
}
