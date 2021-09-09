//
//  FunArrays.swift
//  Keepco
//
//  Created by Usman Meraj on 4/30/20.
//  Copyright © 2020 Usman Meraj. All rights reserved.
//

import Foundation
import UIKit

class FunArrays {

    class func thinkingNames() -> [Fun] {
        if(language == "en"){
            return [Fun(id: 1, parentId: 8, name: "Mind Games", icon: UIImage(named: "ic_mind")!, selected: false),
                    Fun(id: 2, parentId: 8, name: "Cards", icon: UIImage(named: "ic_cards")!, selected: false),
                    Fun(id: 3, parentId: 8, name: "Chess", icon: UIImage(named: "ic_chess")!, selected: false),
                    Fun(id: 4, parentId: 8, name: "Crossword Puzzles", icon: UIImage(named: "ic_crossword")!, selected: false),
                    Fun(id: 5, parentId: 8, name: "Sudoku", icon: UIImage(named: "ic_sodoku")!, selected: false),
                    Fun(id: 6, parentId: 8, name: "Backgammon", icon: UIImage(named: "ic_backgammon")!, selected: false),
                    Fun(id: 7, parentId: 8, name: "Checkers", icon: UIImage(named: "ic_checkers")!, selected: false),
                    Fun(id: 8, parentId: 8, name: "Learning languages", icon: UIImage(named: "ic_learning")!, selected: false)
            ]
        }
        else {
            return [Fun(id: 1, parentId: 8, name: "משחקי חשיבה", icon: UIImage(named: "ic_mind")!, selected: false),
                    Fun(id: 2, parentId: 8, name: "קלפים", icon: UIImage(named: "ic_cards")!, selected: false),
                    Fun(id: 3, parentId: 8, name: "שחמט", icon: UIImage(named: "ic_chess")!, selected: false),
                    Fun(id: 4, parentId: 8, name: "תשבצים", icon: UIImage(named: "ic_crossword")!, selected: false),
                    Fun(id: 5, parentId: 8, name: "סודוקו", icon: UIImage(named: "ic_sodoku")!, selected: false),
                    Fun(id: 6, parentId: 8, name: "שש בש", icon: UIImage(named: "ic_backgammon")!, selected: false),
                    Fun(id: 7, parentId: 8, name: "דמקה שש", icon: UIImage(named: "ic_checkers")!, selected: false),
                    Fun(id: 8, parentId: 8, name: "לימוד שפות", icon: UIImage(named: "ic_learning")!, selected: false)
            ]
        }
    }
    
    class func artsAndSkillsNames() -> [Fun] {
        if(language == "en"){
            return [Fun(id: 1, parentId: 10, name: "Photographer", icon: UIImage(named: "ic_photographer")!, selected: false),
                    Fun(id: 2, parentId: 10, name: "Art Collection", icon: UIImage(named: "ic_art_collection")!, selected: false),
                    Fun(id: 3, parentId: 10, name: "Mages", icon: UIImage(named: "ic_mages")!, selected: false),
                    Fun(id: 4, parentId: 10, name: "Juggling", icon: UIImage(named: "ic_juggling")!, selected: false),
                    Fun(id: 5, parentId: 10, name: "Clowning", icon: UIImage(named: "ic_clowning")!, selected: false),
                    Fun(id: 6, parentId: 10, name: "Mentalism Magic", icon: UIImage(named: "ic_mentalism")!, selected: false),
                    Fun(id: 7, parentId: 10, name: "Stand Up", icon: UIImage(named: "ic_stand_up")!, selected: false),
                    Fun(id: 8, parentId: 10, name: "Imitation", icon: UIImage(named: "ic_imitation")!, selected: false),
                    Fun(id: 9, parentId: 10, name: "Pantomime", icon: UIImage(named: "ic_pantomime")!, selected: false)
            ]
        }
        else {
            return [Fun(id: 1, parentId: 10, name: "צילום", icon: UIImage(named: "ic_photographer")!, selected: false),
                    Fun(id: 2, parentId: 10, name: "איסוף אומנות", icon: UIImage(named: "ic_art_collection")!, selected: false),
                    Fun(id: 3, parentId: 10, name: "קוסמות", icon: UIImage(named: "ic_mages")!, selected: false),
                    Fun(id: 4, parentId: 10, name: "ג'אגלינג", icon: UIImage(named: "ic_juggling")!, selected: false),
                    Fun(id: 5, parentId: 10, name: "ליצנות", icon: UIImage(named: "ic_clowning")!, selected: false),
                    Fun(id: 6, parentId: 10, name: "אמן חושים", icon: UIImage(named: "ic_mentalism")!, selected: false),
                    Fun(id: 7, parentId: 10, name: "סטנד אפ", icon: UIImage(named: "ic_stand_up")!, selected: false),
                    Fun(id: 8, parentId: 10, name: "חקיינות", icon: UIImage(named: "ic_imitation")!, selected: false),
                    Fun(id: 9, parentId: 10, name: "פנטומימה", icon: UIImage(named: "ic_pantomime")!, selected: false)
            ]
        }
    }
    
    class func cultureNames() -> [Fun] {
        if(language == "en"){
            return [Fun(id: 1, parentId: 4, name: "Opera", icon: UIImage(named: "ic_opera")!, selected: false),
                    Fun(id: 2, parentId: 4, name: "Cinema", icon: UIImage(named: "ic_cinema")!, selected: false),
                    Fun(id: 3, parentId: 4, name: "Performance & Theater", icon: UIImage(named: "ic_performance")!, selected: false),
                    Fun(id: 4, parentId: 4, name: "Singer", icon: UIImage(named: "ic_singer")!, selected: false),
                    Fun(id: 5, parentId: 4, name: "Writing", icon: UIImage(named: "ic_writing")!, selected: false),
                    Fun(id: 6, parentId: 4, name: "Playing Muscial Instruments", icon: UIImage(named: "ic_musical")!, selected: false),
                    Fun(id: 7, parentId: 4, name: "Reading", icon: UIImage(named: "ic_reading")!, selected: false),
                    Fun(id: 8, parentId: 4, name: "Karaoke", icon: UIImage(named: "ic_karaoke")!, selected: false),
                    Fun(id: 9, parentId: 4, name: "TV Watching", icon: UIImage(named: "ic_tv_watching")!, selected: false)
            ]
        }
        else {
            return [Fun(id: 1, parentId: 4, name: "אופרה", icon: UIImage(named: "ic_opera")!, selected: false),
                    Fun(id: 2, parentId: 4, name: "קולנוע", icon: UIImage(named: "ic_cinema")!, selected: false),
                    Fun(id: 3, parentId: 4, name: "הצגות ותיאטרון", icon: UIImage(named: "ic_performance")!, selected: false),
                    Fun(id: 4, parentId: 4, name: "שירה", icon: UIImage(named: "ic_singer")!, selected: false),
                    Fun(id: 5, parentId: 4, name: "כתיבה", icon: UIImage(named: "ic_writing")!, selected: false),
                    Fun(id: 6, parentId: 4, name: "נגינה", icon: UIImage(named: "ic_musical")!, selected: false),
                    Fun(id: 7, parentId: 4, name: "קריאה", icon: UIImage(named: "ic_reading")!, selected: false),
                    Fun(id: 8, parentId: 4, name: "קריוקי", icon: UIImage(named: "ic_karaoke")!, selected: false),
                    Fun(id: 9, parentId: 4, name: "צפיה בטלויזיה", icon: UIImage(named: "ic_tv_watching")!, selected: false)
            ]
        }
    }
    
    class func cookingNames() -> [Fun] {
        if(language == "en"){
            return [Fun(id: 1, parentId: 5, name: "Baking", icon: UIImage(named: "ic_baking")!, selected: false),
                    Fun(id: 2, parentId: 5, name: "Cooking", icon: UIImage(named: "ic_cooking")!, selected: false),
                    Fun(id: 3, parentId: 5, name: "Confectionery", icon: UIImage(named: "ic_confectionery")!, selected: false),
                    Fun(id: 4, parentId: 5, name: "BBQ", icon: UIImage(named: "ic_bbq")!, selected: false)
            ]
        }
        else {
            return [Fun(id: 1, parentId: 5, name: "אפייה", icon: UIImage(named: "ic_baking")!, selected: false),
                    Fun(id: 2, parentId: 5, name: "בישול", icon: UIImage(named: "ic_cooking")!, selected: false),
                    Fun(id: 3, parentId: 5, name: "קונדיטוריה", icon: UIImage(named: "ic_confectionery")!, selected: false),
                    Fun(id: 4, parentId: 5, name: "על האש", icon: UIImage(named: "ic_bbq")!, selected: false)
            ]
        }
       }
    
    class func tripsNames() -> [Fun] {
        if(language == "en"){
            return [Fun(id: 1, parentId: 7, name: "Travel World", icon: UIImage(named: "ic_travel_world")!, selected: false),
                    Fun(id: 2, parentId: 7, name: "Camping", icon: UIImage(named: "ic_camping")!, selected: false),
                    Fun(id: 3, parentId: 7, name: "Nature Trip", icon: UIImage(named: "ic_nature")!, selected: false),
                    Fun(id: 4, parentId: 7, name: "Fishing", icon: UIImage(named: "ic_fishing")!, selected: false),
                    Fun(id: 5, parentId: 7, name: "Bicycle Tour", icon: UIImage(named: "ic_bicycle")!, selected: false),
                    Fun(id: 6, parentId: 7, name: "Jeep Tour", icon: UIImage(named: "ic_jeep")!, selected: false),
                    Fun(id: 7, parentId: 7, name: "Caravan Excursions", icon: UIImage(named: "ic_caravan")!, selected: false),
                    Fun(id: 8, parentId: 7, name: "Motorcycle Tours", icon: UIImage(named: "ic_motorcycle")!, selected: false),
                    Fun(id: 9, parentId: 7, name: "Mountain Climbing", icon: UIImage(named: "ic_mountain")!, selected: false),
            ]
        }
        else {
            return [Fun(id: 1, parentId: 7, name: "לטייל בעולם", icon: UIImage(named: "ic_travel_world")!, selected: false),
                    Fun(id: 2, parentId: 7, name: "מחנאות", icon: UIImage(named: "ic_camping")!, selected: false),
                    Fun(id: 3, parentId: 7, name: "טיולי טבע", icon: UIImage(named: "ic_nature")!, selected: false),
                    Fun(id: 4, parentId: 7, name: "דיג", icon: UIImage(named: "ic_fishing")!, selected: false),
                    Fun(id: 5, parentId: 7, name: "טיול אופניים", icon: UIImage(named: "ic_bicycle")!, selected: false),
                    Fun(id: 6, parentId: 7, name: "טיולי ג'יפים", icon: UIImage(named: "ic_jeep")!, selected: false),
                    Fun(id: 7, parentId: 7, name: "טיולי קרוואנים", icon: UIImage(named: "ic_caravan")!, selected: false),
                    Fun(id: 8, parentId: 7, name: "טיולי אופנועים", icon: UIImage(named: "ic_motorcycle")!, selected: false),
                    Fun(id: 9, parentId: 7, name: "טיפוס הרים", icon: UIImage(named: "ic_mountain")!, selected: false),
            ]
        }
       }
    
    class func fashionNames() -> [Fun] {
        if(language == "en"){
            return [Fun(id: 1, parentId: 6, name: "Fashion Blogger", icon: UIImage(named: "ic_fashion_blogger")!, selected: false),
                    Fun(id: 2, parentId: 6, name: "Shopping", icon: UIImage(named: "ic_shopping")!, selected: false),
                    Fun(id: 3, parentId: 6, name: "Swapping Used Clothes", icon: UIImage(named: "ic_swapping")!, selected: false)
            ]
        }
        else {
            return [Fun(id: 1, parentId: 6, name: "בלוגר אופנה", icon: UIImage(named: "ic_fashion_blogger")!, selected: false),
                    Fun(id: 2, parentId: 6, name: "שופינג", icon: UIImage(named: "ic_shopping")!, selected: false),
                    Fun(id: 3, parentId: 6, name: "החלפת בגדים משומשים", icon: UIImage(named: "ic_swapping")!, selected: false)
            ]
        }
    }
       
    class func gamingNames() -> [Fun] {
        if(language == "en"){
            return [Fun(id: 1, parentId: 3, name: "PSP", icon: UIImage(named: "ic_psp")!, selected: false),
                    Fun(id: 2, parentId: 3, name: "Play Station", icon: UIImage(named: "ic_ps")!, selected: false),
                    Fun(id: 3, parentId: 3, name: "Computer Game", icon: UIImage(named: "ic_computer")!, selected: false),
                    Fun(id: 4, parentId: 3, name: "Xbox", icon: UIImage(named: "ic_xbox")!, selected: false),
                    Fun(id: 5, parentId: 3, name: "Wii", icon: UIImage(named: "ic_wii")!, selected: false)]
        }
        else {
            return [Fun(id: 1, parentId: 3, name: "PSP", icon: UIImage(named: "ic_psp")!, selected: false),
                    Fun(id: 2, parentId: 3, name: "פלייסטיישן", icon: UIImage(named: "ic_ps")!, selected: false),
                    Fun(id: 3, parentId: 3, name: "משחקי מחשב", icon: UIImage(named: "ic_computer")!, selected: false),
                    Fun(id: 4, parentId: 3, name: "Xbox", icon: UIImage(named: "ic_xbox")!, selected: false),
                    Fun(id: 5, parentId: 3, name: "Wii", icon: UIImage(named: "ic_wii")!, selected: false)]
        }
    }
    
    class func danceNames() -> [Fun] {
        if(language == "en"){
            return [Fun(id: 1, parentId: 0, name: "Ballet", icon: UIImage(named: "ic_ballet")!, selected: false),
                    Fun(id: 2, parentId: 0, name: "Modern Jazz", icon: UIImage(named: "ic_modern")!, selected: false),
                    Fun(id: 3, parentId: 0, name: "Hip Hop", icon: UIImage(named: "ic_hiphop")!, selected: false),
                    Fun(id: 4, parentId: 0, name: "Modern Dance", icon: UIImage(named: "ic_hiphop")!, selected: false),
                    Fun(id: 5, parentId: 0, name: "Salsa", icon: UIImage(named: "ic_salsa")!, selected: false),
                    Fun(id: 6, parentId: 0, name: "Poll Dance", icon: UIImage(named: "ic_poll")!, selected: false),
                    Fun(id: 7, parentId: 0, name: "Folk Dances", icon: UIImage(named: "ic_folk")!, selected: false),
                    Fun(id: 8, parentId: 0, name: "Ballroom", icon: UIImage(named: "ic_ballroom")!, selected: false)
            ]
        }
        else {
            return [Fun(id: 1, parentId: 0, name: "בלט", icon: UIImage(named: "ic_ballet")!, selected: false),
                    Fun(id: 2, parentId: 0, name: "ג'ז", icon: UIImage(named: "ic_modern")!, selected: false),
                    Fun(id: 3, parentId: 0, name: "היפ הופ", icon: UIImage(named: "ic_hiphop")!, selected: false),
                    Fun(id: 4, parentId: 0, name: "ריקוד מודרני", icon: UIImage(named: "ic_hiphop")!, selected: false),
                    Fun(id: 5, parentId: 0, name: "סלסה", icon: UIImage(named: "ic_salsa")!, selected: false),
                    Fun(id: 6, parentId: 0, name: "ריקוד על עמוד", icon: UIImage(named: "ic_poll")!, selected: false),
                    Fun(id: 7, parentId: 0, name: "ריקודי עם", icon: UIImage(named: "ic_folk")!, selected: false),
                    Fun(id: 8, parentId: 0, name: "ריקודים סלוניים", icon: UIImage(named: "ic_ballroom")!, selected: false)
            ]
        }
    }
    
    class func handymenNames() -> [Fun] {
        if(language == "en"){
            return [Fun(id: 1, parentId: 9, name: "Pluming", icon: UIImage(named: "ic_pluming")!, selected: false),
                    Fun(id: 2, parentId: 9, name: "Renovations", icon: UIImage(named: "ic_renovations")!, selected: false),
                    Fun(id: 3, parentId: 9, name: "Gardening", icon: UIImage(named: "ic_gardening")!, selected: false),
                    Fun(id: 4, parentId: 9, name: "Car Mechanic", icon: UIImage(named: "ic_mechanic")!, selected: false),
                    Fun(id: 5, parentId: 9, name: "Welding", icon: UIImage(named: "ic_welding")!, selected: false)
            ]
        }
        else {
            return [Fun(id: 1, parentId: 9, name: "אינסטלציה", icon: UIImage(named: "ic_pluming")!, selected: false),
                    Fun(id: 2, parentId: 9, name: "שיפוצים", icon: UIImage(named: "ic_renovations")!, selected: false),
                    Fun(id: 3, parentId: 9, name: "גינון", icon: UIImage(named: "ic_gardening")!, selected: false),
                    Fun(id: 4, parentId: 9, name: "מכונאות רכב", icon: UIImage(named: "ic_mechanic")!, selected: false),
                    Fun(id: 5, parentId: 9, name: "רתכות", icon: UIImage(named: "ic_welding")!, selected: false)
            ]
        }
    }
    
    class func handiCraft() -> [Fun] {
        if(language == "en"){
            return [Fun(id: 1, parentId: 11, name: "Coloring", icon: UIImage(named: "ic_coloring")!, selected: false),
                    Fun(id: 2, parentId: 11, name: "Carpentry", icon: UIImage(named: "ic_carpentry")!, selected: false),
                    Fun(id: 3, parentId: 11, name: "Knitting", icon: UIImage(named: "ic_knitting")!, selected: false),
                    Fun(id: 4, parentId: 11, name: "Sculpting", icon: UIImage(named: "ic_sculpting")!, selected: false),
                    Fun(id: 5, parentId: 11, name: "Painting", icon: UIImage(named: "ic_painting")!, selected: false),
                    Fun(id: 6, parentId: 11, name: "Blacksmithing", icon: UIImage(named: "ic_blacksmithing")!, selected: false),
                    Fun(id: 7, parentId: 11, name: "Sewing", icon: UIImage(named: "ic_sewing")!, selected: false)
            ]
        }
        else {
            return [Fun(id: 1, parentId: 11, name: "צביעה", icon: UIImage(named: "ic_coloring")!, selected: false),
                    Fun(id: 2, parentId: 11, name: "נגרות", icon: UIImage(named: "ic_carpentry")!, selected: false),
                    Fun(id: 3, parentId: 11, name: "סריגה", icon: UIImage(named: "ic_knitting")!, selected: false),
                    Fun(id: 4, parentId: 11, name: "פיסול", icon: UIImage(named: "ic_sculpting")!, selected: false),
                    Fun(id: 5, parentId: 11, name: "ציור", icon: UIImage(named: "ic_painting")!, selected: false),
                    Fun(id: 6, parentId: 11, name: "נפחות", icon: UIImage(named: "ic_blacksmithing")!, selected: false),
                    Fun(id: 7, parentId: 11, name: "תפירה", icon: UIImage(named: "ic_sewing")!, selected: false)
            ]
        }
    }
    
    class func teamSportsNames() -> [Fun] {
        if(language == "en"){
            return [Fun(id: 1, parentId: 1, name: "Baseball", icon: UIImage(named: "ic_baseball")!, selected: false),
                    Fun(id: 2, parentId: 1, name: "Handball", icon: UIImage(named: "ic_handyball")!, selected: false),
                    Fun(id: 3, parentId: 1, name: "Volleyball", icon: UIImage(named: "ic_volleyball")!, selected: false),
                    Fun(id: 4, parentId: 1, name: "Football", icon: UIImage(named: "ic_football")!, selected: false),
                    Fun(id: 5, parentId: 1, name: "Basketball", icon: UIImage(named: "ic_basketball")!, selected: false),
                    Fun(id: 6, parentId: 1, name: "American Football", icon: UIImage(named: "ic_american_football")!, selected: false),
                    Fun(id: 7, parentId: 1, name: "Hockey", icon: UIImage(named: "ic_hockey")!, selected: false)
            ]
        }
        else {
            return [Fun(id: 1, parentId: 1, name: "בייסבול", icon: UIImage(named: "ic_baseball")!, selected: false),
                    Fun(id: 2, parentId: 1, name: "כדור יד", icon: UIImage(named: "ic_handyball")!, selected: false),
                    Fun(id: 3, parentId: 1, name: "כדור עף", icon: UIImage(named: "ic_volleyball")!, selected: false),
                    Fun(id: 4, parentId: 1, name: "כדורגל", icon: UIImage(named: "ic_football")!, selected: false),
                    Fun(id: 5, parentId: 1, name: "כדורסל", icon: UIImage(named: "ic_basketball")!, selected: false),
                    Fun(id: 6, parentId: 1, name: "פוטבול", icon: UIImage(named: "ic_american_football")!, selected: false),
                    Fun(id: 7, parentId: 1, name: "הוקי", icon: UIImage(named: "ic_hockey")!, selected: false)
            ]
        }
      }
      
    class func uniqueSportsNames() -> [Fun] {
        if(language == "en"){
            return [Fun(id: 1, parentId: 2, name: "Martial Arts", icon: UIImage(named: "ic_martialarts")!, selected: false),
                    Fun(id: 2, parentId: 2, name: "Bowling", icon: UIImage(named: "ic_bowling")!, selected: false),
                    Fun(id: 3, parentId: 2, name: "Surfing", icon: UIImage(named: "ic_surfing")!, selected: false),
                    Fun(id: 4, parentId: 2, name: "Weight Lifting", icon: UIImage(named: "ic_weight_lifting")!, selected: false),
                    Fun(id: 5, parentId: 2, name: "Running", icon: UIImage(named: "ic_running")!, selected: false),
                    Fun(id: 6, parentId: 2, name: "Swimming", icon: UIImage(named: "ic_swimming_sports")!, selected: false),
                    Fun(id: 7, parentId: 2, name: "Tennis", icon: UIImage(named: "ic_tennis")!, selected: false),
                    Fun(id: 8, parentId: 2, name: "Extreme Sports", icon: UIImage(named: "ic_extreme_sports")!, selected: false),
                    Fun(id: 9, parentId: 2, name: "Snooker", icon: UIImage(named: "ic_snooker")!, selected: false),
                    Fun(id: 10, parentId: 2, name: "Yoga/Meditation", icon: UIImage(named: "ic_yoga")!, selected: false),
                    Fun(id: 11, parentId: 2, name: "Gym/Crossfit", icon: UIImage(named: "ic_gym")!, selected: false),
                    Fun(id: 12, parentId: 2, name: "Gymnastics", icon: UIImage(named: "ic_gymnastics")!, selected: false)
            ]
        }
        else {
            return [Fun(id: 1, parentId: 2, name: "אומנויות לחימה", icon: UIImage(named: "ic_martialarts")!, selected: false),
                    Fun(id: 2, parentId: 2, name: "באולינג", icon: UIImage(named: "ic_bowling")!, selected: false),
                    Fun(id: 3, parentId: 2, name: "גלישה", icon: UIImage(named: "ic_surfing")!, selected: false),
                    Fun(id: 4, parentId: 2, name: "הרמת משקולות", icon: UIImage(named: "ic_weight_lifting")!, selected: false),
                    Fun(id: 5, parentId: 2, name: "ריצה", icon: UIImage(named: "ic_running")!, selected: false),
                    Fun(id: 6, parentId: 2, name: "שחיה", icon: UIImage(named: "ic_swimming_sports")!, selected: false),
                    Fun(id: 7, parentId: 2, name: "טניס", icon: UIImage(named: "ic_tennis")!, selected: false),
                    Fun(id: 8, parentId: 2, name: "ספורט אתגרי", icon: UIImage(named: "ic_extreme_sports")!, selected: false),
                    Fun(id: 9, parentId: 2, name: "סנוקר", icon: UIImage(named: "ic_snooker")!, selected: false),
                    Fun(id: 10, parentId: 2, name: "יוגה/ מדיטציה", icon: UIImage(named: "ic_yoga")!, selected: false),
                    Fun(id: 11, parentId: 2, name: "חדר כושר/קרוספיט", icon: UIImage(named: "ic_gym")!, selected: false),
                    Fun(id: 12, parentId: 2, name: "התעמלות אומנותית", icon: UIImage(named: "ic_gymnastics")!, selected: false)
            ]
        }
    }
      
    class func allNames() -> [Fun] {
          var array = thinkingNames()
          array.append(contentsOf: artsAndSkillsNames())
          array.append(contentsOf: cultureNames())
          array.append(contentsOf: cookingNames())
          array.append(contentsOf: tripsNames())
          array.append(contentsOf: fashionNames())
          array.append(contentsOf: gamingNames())
          array.append(contentsOf: danceNames())
          array.append(contentsOf: handymenNames())
          array.append(contentsOf: handiCraft())
          array.append(contentsOf: teamSportsNames())
          array.append(contentsOf: uniqueSportsNames())
          
          return array
      }
      
}
