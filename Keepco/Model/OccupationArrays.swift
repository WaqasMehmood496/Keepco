//
//  Occupation.swift
//  Keepco
//
//  Created by Usman Meraj on 4/29/20.
//  Copyright © 2020 Usman Meraj. All rights reserved.
//

import Foundation
import UIKit


class OccupationArrays {
    
    class func repairNames() -> [Occupation] {
        if(language == "en") {
            return [Occupation(id: 1, parentId: 1, name: "Plumbing", icon: UIImage(named: "ic_plumbing")!, selected: false),
                    Occupation(id: 2, parentId: 1, name: "Locksmith", icon: UIImage(named: "ic_locksmith")!, selected: false),
                    Occupation(id: 3, parentId: 1, name: "Glazing", icon: UIImage(named: "ic_glazing")!, selected: false),
                    Occupation(id: 4, parentId: 1, name: "Renovator", icon: UIImage(named: "ic_renovator")!, selected: false),
                    Occupation(id: 5, parentId: 1, name: "Engraver", icon: UIImage(named: "ic_engraver")!, selected: false),
                    Occupation(id: 6, parentId: 1, name: "Carpenter", icon: UIImage(named: "ic_carpenter")!, selected: false),
                    Occupation(id: 7, parentId: 1, name: "Painter", icon: UIImage(named: "ic_painter")!, selected: false),
                    Occupation(id: 8, parentId: 1, name: "Welder", icon: UIImage(named: "ic_welder")!, selected: false),
                    Occupation(id: 9, parentId: 1, name: "Gas Technician", icon: UIImage(named: "ic_gas")!, selected: false),
                    Occupation(id: 10, parentId: 1, name: "Cooling & Air Conditioning", icon: UIImage(named: "ic_ac")!, selected: false),
                    Occupation(id: 11, parentId: 1, name: "Aluminum Worker", icon: UIImage(named: "ic_aluminium")!, selected: false),
                    Occupation(id: 12, parentId: 1, name: "Installation Technician", icon: UIImage(named: "ic_installation")!, selected: false)
            ]
        }
        else {
            return [Occupation(id: 1, parentId: 1, name: "אינסטלציה", icon: UIImage(named: "ic_plumbing")!, selected: false),
                    Occupation(id: 2, parentId: 1, name: "מנעולנ/ית", icon: UIImage(named: "ic_locksmith")!, selected: false),
                    Occupation(id: 3, parentId: 1, name: "זגגות", icon: UIImage(named: "ic_glazing")!, selected: false),
                    Occupation(id: 4, parentId: 1, name: "שיפוצניק/ית", icon: UIImage(named: "ic_renovator")!, selected: false),
                    Occupation(id: 5, parentId: 1, name: "חריטה", icon: UIImage(named: "ic_engraver")!, selected: false),
                    Occupation(id: 6, parentId: 1, name: "נגרות", icon: UIImage(named: "ic_carpenter")!, selected: false),
                    Occupation(id: 7, parentId: 1, name: "צבעי/ת", icon: UIImage(named: "ic_painter")!, selected: false),
                    Occupation(id: 8, parentId: 1, name: "רתכות", icon: UIImage(named: "ic_welder")!, selected: false),
                    Occupation(id: 9, parentId: 1, name: "טכנאי/ת גז", icon: UIImage(named: "ic_gas")!, selected: false),
                    Occupation(id: 10, parentId: 1, name: "קירור ומיזוג אוויר", icon: UIImage(named: "ic_ac")!, selected: false),
                    Occupation(id: 11, parentId: 1, name: "עבודות אלומיניום", icon: UIImage(named: "ic_aluminium")!, selected: false),
                    Occupation(id: 12, parentId: 1, name: "טכנאי/ת התקנות", icon: UIImage(named: "ic_installation")!, selected: false)
            ]
        }
    }
    
    class func lawNames() -> [Occupation] {
        if(language == "en"){
            return [Occupation(id: 1, parentId: 11, name: "Civil Lawyer", icon: UIImage(named: "ic_civil")!, selected: false),
                    Occupation(id: 2, parentId: 11, name: "Commercial Lawyer", icon: UIImage(named: "ic_commercial")!, selected: false),
                    Occupation(id: 3, parentId: 11, name: "Criminal Lawyer", icon: UIImage(named: "ic_criminal")!, selected: false),
                    Occupation(id: 4, parentId: 11, name: "Specialization in Law", icon: UIImage(named: "ic_specialization")!, selected: false),
                    Occupation(id: 5, parentId: 11, name: "Judge", icon: UIImage(named: "ic_judge")!, selected: false),
                    Occupation(id: 6, parentId: 11, name: "Legal Secretary", icon: UIImage(named: "ic_secretary")!, selected: false),
                    Occupation(id: 7, parentId: 11, name: "Legal Counsel", icon: UIImage(named: "ic_legal")!, selected: false),
                    Occupation(id: 8, parentId: 11, name: "Mediation", icon: UIImage(named: "ic_mediation")!, selected: false),
                    Occupation(id: 9, parentId: 11, name: "Typist", icon: UIImage(named: "ic_typist")!, selected: false)
            ]
        }
        else {
            return [Occupation(id: 1, parentId: 11, name: "עורכ/ת דין אזרחי", icon: UIImage(named: "ic_civil")!, selected: false),
                    Occupation(id: 2, parentId: 11, name: "עורכ/ת דין מסחרי", icon: UIImage(named: "ic_commercial")!, selected: false),
                    Occupation(id: 3, parentId: 11, name: "עורכ/ת דין פלילי", icon: UIImage(named: "ic_criminal")!, selected: false),
                    Occupation(id: 4, parentId: 11, name: "מתמחה במשפטים", icon: UIImage(named: "ic_specialization")!, selected: false),
                    Occupation(id: 5, parentId: 11, name: "שופט/ת", icon: UIImage(named: "ic_judge")!, selected: false),
                    Occupation(id: 6, parentId: 11, name: "מזכיר/ה משפטי/ת", icon: UIImage(named: "ic_secretary")!, selected: false),
                    Occupation(id: 7, parentId: 11, name: "יועצ/ת משפטי/ת", icon: UIImage(named: "ic_legal")!, selected: false),
                    Occupation(id: 8, parentId: 11, name: "מגשר/ת", icon: UIImage(named: "ic_mediation")!, selected: false),
                    Occupation(id: 9, parentId: 11, name: "קלדנ/ית", icon: UIImage(named: "ic_typist")!, selected: false)
            ]
        }
    }
    
    class func restaurantNames() -> [Occupation] {
        if(language == "en"){
            return [Occupation(id: 1, parentId: 2, name: "Sous Chef", icon: UIImage(named: "ic_sous")!, selected: false),
                    Occupation(id: 2, parentId: 2, name: "Restaurant Manager", icon: UIImage(named: "ic_res_manager")!, selected: false),
                    Occupation(id: 3, parentId: 2, name: "Kitchen Manager", icon: UIImage(named: "ic_kitchen_manager")!, selected: false),
                    Occupation(id: 4, parentId: 2, name: "Kitchen Worker", icon: UIImage(named: "ic_kitchen_worker")!, selected: false),
                    Occupation(id: 5, parentId: 2, name: "Bartender", icon: UIImage(named: "ic_bartender")!, selected: false),
                    Occupation(id: 6, parentId: 2, name: "Chef", icon: UIImage(named: "ic_chef")!, selected: false),
                    Occupation(id: 7, parentId: 2, name: "Waiter/Waitress", icon: UIImage(named: "ic_waiter")!, selected: false),
                    Occupation(id: 8, parentId: 2, name: "Dishwasher", icon: UIImage(named: "ic_dishwasher")!, selected: false),
                    Occupation(id: 9, parentId: 2, name: "Barista", icon: UIImage(named: "ic_barista")!, selected: false),
                    Occupation(id: 10, parentId: 2, name: "Hostess", icon: UIImage(named: "ic_hostess")!, selected: false)
            ]
        }
        else {
            return [Occupation(id: 1, parentId: 2, name: "סו-שפ/ית", icon: UIImage(named: "ic_sous")!, selected: false),
                    Occupation(id: 2, parentId: 2, name: "מנהל/ת מסעדה", icon: UIImage(named: "ic_res_manager")!, selected: false),
                    Occupation(id: 3, parentId: 2, name: "מנהל/ת מטבח", icon: UIImage(named: "ic_kitchen_manager")!, selected: false),
                    Occupation(id: 4, parentId: 2, name: "עובד/ת מטבח", icon: UIImage(named: "ic_kitchen_worker")!, selected: false),
                    Occupation(id: 5, parentId: 2, name: "ברמנ/ית", icon: UIImage(named: "ic_bartender")!, selected: false),
                    Occupation(id: 6, parentId: 2, name: "שפ/ית", icon: UIImage(named: "ic_chef")!, selected: false),
                    Occupation(id: 7, parentId: 2, name: "מלצר/ית", icon: UIImage(named: "ic_waiter")!, selected: false),
                    Occupation(id: 8, parentId: 2, name: "שוטפ/ת כלים", icon: UIImage(named: "ic_dishwasher")!, selected: false),
                    Occupation(id: 9, parentId: 2, name: "בריסטה", icon: UIImage(named: "ic_barista")!, selected: false),
                    Occupation(id: 10, parentId: 2, name: "מארח/ת", icon: UIImage(named: "ic_hostess")!, selected: false)
            ]
        }
    }
     
    class func medicineNames() -> [Occupation] {
        if(language == "en"){
            return [Occupation(id: 1, parentId: 6, name: "Optometrist", icon: UIImage(named: "ic_optometrist")!, selected: false),
                    Occupation(id: 2, parentId: 6, name: "Nurse", icon: UIImage(named: "ic_nurse")!, selected: false),
                    Occupation(id: 3, parentId: 6, name: "Psychiatry", icon: UIImage(named: "ic_psychiatry")!, selected: false),
                    Occupation(id: 4, parentId: 6, name: "Medical Assistant", icon: UIImage(named: "ic_medical_assitant")!, selected: false),
                    Occupation(id: 5, parentId: 6, name: "Physiotherapy", icon: UIImage(named: "ic_physiotherapy")!, selected: false),
                    Occupation(id: 6, parentId: 6, name: "Paramedic", icon: UIImage(named: "ic_parademic")!, selected: false),
                    Occupation(id: 7, parentId: 6, name: "Doctor", icon: UIImage(named: "ic_doctor")!, selected: false),
                    Occupation(id: 8, parentId: 6, name: "Dentist", icon: UIImage(named: "ic_dentist")!, selected: false),
                    Occupation(id: 9, parentId: 6, name: "Medical Secretary", icon: UIImage(named: "ic_medical")!, selected: false),
                    Occupation(id: 10, parentId: 6, name: "Surgeon", icon: UIImage(named: "ic_surgeon")!, selected: false),
                    Occupation(id: 11, parentId: 6, name: "Pharmacy", icon: UIImage(named: "ic_pharmacy")!, selected: false),
                    Occupation(id: 12, parentId: 6, name: "Alternative Medicine", icon: UIImage(named: "ic_alternative")!, selected: false)
            ]
        }
        else {
            return [Occupation(id: 1, parentId: 6, name: "אופטימטריסט/ית", icon: UIImage(named: "ic_optometrist")!, selected: false),
                    Occupation(id: 2, parentId: 6, name: "אח/ות", icon: UIImage(named: "ic_nurse")!, selected: false),
                    Occupation(id: 3, parentId: 6, name: "פסיכיאטריה", icon: UIImage(named: "ic_psychiatry")!, selected: false),
                    Occupation(id: 4, parentId: 6, name: "חובש/ת", icon: UIImage(named: "ic_medical_assitant")!, selected: false),
                    Occupation(id: 5, parentId: 6, name: "פיזיותרפיה", icon: UIImage(named: "ic_physiotherapy")!, selected: false),
                    Occupation(id: 6, parentId: 6, name: "פרמדיק/ית", icon: UIImage(named: "ic_parademic")!, selected: false),
                    Occupation(id: 7, parentId: 6, name: "רופא/ה", icon: UIImage(named: "ic_doctor")!, selected: false),
                    Occupation(id: 8, parentId: 6, name: "רופא/ת שיניים", icon: UIImage(named: "ic_dentist")!, selected: false),
                    Occupation(id: 9, parentId: 6, name: "מזכיר/ה רפואי/ת", icon: UIImage(named: "ic_medical")!, selected: false),
                    Occupation(id: 10, parentId: 6, name: "מנתח/ת", icon: UIImage(named: "ic_surgeon")!, selected: false),
                    Occupation(id: 11, parentId: 6, name: "רוקחות", icon: UIImage(named: "ic_pharmacy")!, selected: false),
                    Occupation(id: 12, parentId: 6, name: "רפואה אלטרנטיבית", icon: UIImage(named: "ic_alternative")!, selected: false)
            ]
        }
    }
    
    class func financeNames() -> [Occupation] {
        if(language == "en"){
            return [Occupation(id: 1, parentId: 10, name: "Treasurer", icon: UIImage(named: "ic_treasurer")!, selected: false),
                    Occupation(id: 2, parentId: 10, name: "Fund Raising", icon: UIImage(named: "ic_fund")!, selected: false),
                    Occupation(id: 3, parentId: 10, name: "Payroll Computer", icon: UIImage(named: "ic_payroll")!, selected: false),
                    Occupation(id: 4, parentId: 10, name: "Investment Advisor", icon: UIImage(named: "ic_investment")!, selected: false),
                    Occupation(id: 5, parentId: 10, name: "Tax Advisor", icon: UIImage(named: "ic_tax")!, selected: false),
                    Occupation(id: 6, parentId: 10, name: "Mortgage Consultant", icon: UIImage(named: "ic_mortgage")!, selected: false),
                    Occupation(id: 7, parentId: 10, name: "Financial Advisor", icon: UIImage(named: "ic_financial")!, selected: false),
                    Occupation(id: 8, parentId: 10, name: "Pension Counselor", icon: UIImage(named: "ic_pension")!, selected: false),
                    Occupation(id: 9, parentId: 10, name: "Economist", icon: UIImage(named: "ic_economist")!, selected: false),
                    Occupation(id: 10, parentId: 10, name: "Accounts Manager", icon: UIImage(named: "ic_accounts_manager")!, selected: false),
                    Occupation(id: 11, parentId: 10, name: "CPA", icon: UIImage(named: "ic_cpa")!, selected: false),
                    Occupation(id: 12, parentId: 10, name: "Capital Market", icon: UIImage(named: "ic_capital_market")!, selected: false)
            ]
        }
        else {
            return [Occupation(id: 1, parentId: 10, name: "גזבר/ית", icon: UIImage(named: "ic_treasurer")!, selected: false),
                    Occupation(id: 2, parentId: 10, name: "גיוס כספים", icon: UIImage(named: "ic_fund")!, selected: false),
                    Occupation(id: 3, parentId: 10, name: "חשב/ת שכר", icon: UIImage(named: "ic_payroll")!, selected: false),
                    Occupation(id: 4, parentId: 10, name: "יועצ/ת השקעות", icon: UIImage(named: "ic_investment")!, selected: false),
                    Occupation(id: 5, parentId: 10, name: "יועצ/ת מס", icon: UIImage(named: "ic_tax")!, selected: false),
                    Occupation(id: 6, parentId: 10, name: "יועצ/ת משכנתאות", icon: UIImage(named: "ic_mortgage")!, selected: false),
                    Occupation(id: 7, parentId: 10, name: "יועצ/ת פיננסי/ת", icon: UIImage(named: "ic_financial")!, selected: false),
                    Occupation(id: 8, parentId: 10, name: "יועצ/ת פנסיוני/ת", icon: UIImage(named: "ic_pension")!, selected: false),
                    Occupation(id: 9, parentId: 10, name: "כלכלנ/ית", icon: UIImage(named: "ic_economist")!, selected: false),
                    Occupation(id: 10, parentId: 10, name: "מנהל/ת חשבונות", icon: UIImage(named: "ic_accounts_manager")!, selected: false),
                    Occupation(id: 11, parentId: 10, name: "רואה חשבון", icon: UIImage(named: "ic_cpa")!, selected: false),
                    Occupation(id: 12, parentId: 10, name: "שוק ההון", icon: UIImage(named: "ic_capital_market")!, selected: false)
            ]
        }
    }
    
    class func teachingNames() -> [Occupation] {
        if(language == "en"){
            return [Occupation(id: 1, parentId: 4, name: "Kindergarten Teacher", icon: UIImage(named: "ic_kindergarten")!, selected: false),
                    Occupation(id: 2, parentId: 4, name: "Special-needs Education", icon: UIImage(named: "ic_special_needs")!, selected: false),
                    Occupation(id: 3, parentId: 4, name: "Organizational Consultant", icon: UIImage(named: "ic_organizational")!, selected: false),
                    Occupation(id: 4, parentId: 4, name: "Teacher", icon: UIImage(named: "ic_teacher")!, selected: false),
                    Occupation(id: 5, parentId: 4, name: "Sports Teacher", icon: UIImage(named: "ic_sports_teacher")!, selected: false),
                    Occupation(id: 6, parentId: 4, name: "Instructors", icon: UIImage(named: "ic_instructors")!, selected: false),
                    Occupation(id: 7, parentId: 4, name: "Tour Guide", icon: UIImage(named: "ic_tour")!, selected: false),
                    Occupation(id: 8, parentId: 4, name: "Private Teacher", icon: UIImage(named: "ic_private")!, selected: false),
                    Occupation(id: 9, parentId: 4, name: "Practitioner", icon: UIImage(named: "ic_practioner")!, selected: false),
                    Occupation(id: 10, parentId: 4, name: "Kindergarten Assistant", icon: UIImage(named: "ic_kindergarten_assistant")!, selected: false),
                    Occupation(id: 11, parentId: 4, name: "Guiding Groups", icon: UIImage(named: "ic_guiding")!, selected: false),
                    Occupation(id: 12, parentId: 4, name: "Lecturer", icon: UIImage(named: "ic_lecturer")!, selected: false)
            ]
        }
        else {
            return [Occupation(id: 1, parentId: 4, name: "גננ/ת (מעולם ההוראה)", icon: UIImage(named: "ic_kindergarten")!, selected: false),
                    Occupation(id: 2, parentId: 4, name: "חינוך מיוחד", icon: UIImage(named: "ic_special_needs")!, selected: false),
                    Occupation(id: 3, parentId: 4, name: "יועצ/ת ארגוני/ת", icon: UIImage(named: "ic_organizational")!, selected: false),
                    Occupation(id: 4, parentId: 4, name: "מורה", icon: UIImage(named: "ic_teacher")!, selected: false),
                    Occupation(id: 5, parentId: 4, name: "מורה לחינוך גופני", icon: UIImage(named: "ic_sports_teacher")!, selected: false),
                    Occupation(id: 6, parentId: 4, name: "מדריכ/ה", icon: UIImage(named: "ic_instructors")!, selected: false),
                    Occupation(id: 7, parentId: 4, name: "מדריכ/ת טיולים", icon: UIImage(named: "ic_tour")!, selected: false),
                    Occupation(id: 8, parentId: 4, name: "מורה פרטי/ת", icon: UIImage(named: "ic_private")!, selected: false),
                    Occupation(id: 9, parentId: 4, name: "מתרגל/ת", icon: UIImage(named: "ic_practioner")!, selected: false),
                    Occupation(id: 10, parentId: 4, name: "סייעת ילדים", icon: UIImage(named: "ic_kindergarten_assistant")!, selected: false),
                    Occupation(id: 11, parentId: 4, name: "מנחה קבוצות", icon: UIImage(named: "ic_guiding")!, selected: false),
                    Occupation(id: 12, parentId: 4, name: "מרצה", icon: UIImage(named: "ic_lecturer")!, selected: false)
            ]
        }
     }
     
     class func securityNames() -> [Occupation] {
        if(language == "en"){
            return [Occupation(id: 1, parentId: 3, name: "Data Security", icon: UIImage(named: "ic_data_security")!, selected: false),
                    Occupation(id: 2, parentId: 3, name: "Patrolman", icon: UIImage(named: "ic_patrolman")!, selected: false),
                    Occupation(id: 3, parentId: 3, name: "Security Officer", icon: UIImage(named: "ic_security_officer")!, selected: false),
                    Occupation(id: 4, parentId: 3, name: "Security Manager", icon: UIImage(named: "ic_security_manager")!, selected: false),
                    Occupation(id: 5, parentId: 3, name: "Investigator", icon: UIImage(named: "ic_investigator")!, selected: false),
                    Occupation(id: 6, parentId: 3, name: "Security Order", icon: UIImage(named: "ic_security_order")!, selected: false),
                    Occupation(id: 7, parentId: 3, name: "Selector", icon: UIImage(named: "ic_selector")!, selected: false),
                    Occupation(id: 8, parentId: 3, name: "Prison Guard", icon: UIImage(named: "ic_prison_guard")!, selected: false),
                    Occupation(id: 9, parentId: 3, name: "Cyber", icon: UIImage(named: "ic_cyber")!, selected: false),
                    Occupation(id: 10, parentId: 3, name: "Cop", icon: UIImage(named: "ic_cop")!, selected: false),
                    Occupation(id: 11, parentId: 3, name: "Traffic Supervisor", icon: UIImage(named: "ic_traffic")!, selected: false),
                    Occupation(id: 12, parentId: 3, name: "Soldier", icon: UIImage(named: "ic_soldier")!, selected: false)
            ]
        }
        else {
            return [Occupation(id: 1, parentId: 3, name: "אבטחת מידע", icon: UIImage(named: "ic_data_security")!, selected: false),
                    Occupation(id: 2, parentId: 3, name: "סייר/ת", icon: UIImage(named: "ic_patrolman")!, selected: false),
                    Occupation(id: 3, parentId: 3, name: "קצינ/ת ביטחון", icon: UIImage(named: "ic_security_officer")!, selected: false),
                    Occupation(id: 4, parentId: 3, name: "מנהל/ת אבטחה", icon: UIImage(named: "ic_security_manager")!, selected: false),
                    Occupation(id: 5, parentId: 3, name: "חוקר/ת", icon: UIImage(named: "ic_investigator")!, selected: false),
                    Occupation(id: 6, parentId: 3, name: "סדרנ/ית אבטחה", icon: UIImage(named: "ic_security_order")!, selected: false),
                    Occupation(id: 7, parentId: 3, name: "סלקטור/ית", icon: UIImage(named: "ic_selector")!, selected: false),
                    Occupation(id: 8, parentId: 3, name: "סוהר/ת", icon: UIImage(named: "ic_prison_guard")!, selected: false),
                    Occupation(id: 9, parentId: 3, name: "סייבר", icon: UIImage(named: "ic_cyber")!, selected: false),
                    Occupation(id: 10, parentId: 3, name: "שוטר/ת", icon: UIImage(named: "ic_cop")!, selected: false),
                    Occupation(id: 11, parentId: 3, name: "פקח/ית תנועה", icon: UIImage(named: "ic_traffic")!, selected: false),
                    Occupation(id: 12, parentId: 3, name: "חייל/ת", icon: UIImage(named: "ic_soldier")!, selected: false)
            ]
        }
     }
     
     class func humanityNames() -> [Occupation] {
        if(language == "en"){
            return [Occupation(id: 1, parentId: 7, name: "Anthropology", icon: UIImage(named: "ic_anthropology")!, selected: false),
                    Occupation(id: 2, parentId: 7, name: "Sociology", icon: UIImage(named: "ic_sociology")!, selected: false),
                    Occupation(id: 3, parentId: 7, name: "Philosophy", icon: UIImage(named: "ic_philosophy")!, selected: false),
                    Occupation(id: 4, parentId: 7, name: "Psychology", icon: UIImage(named: "ic_psychology")!, selected: false),
                    Occupation(id: 5, parentId: 7, name: "Social Sciences", icon: UIImage(named: "ic_social_sciences")!, selected: false),
                    Occupation(id: 6, parentId: 7, name: "Specializing in Social Science", icon: UIImage(named: "ic_specialization_social")!, selected: false)
            ]
        }
        else {
            return [Occupation(id: 1, parentId: 7, name: "אנטרופולוגיה", icon: UIImage(named: "ic_anthropology")!, selected: false),
                    Occupation(id: 2, parentId: 7, name: "סוציולוגיה", icon: UIImage(named: "ic_sociology")!, selected: false),
                    Occupation(id: 3, parentId: 7, name: "פילוסופיה", icon: UIImage(named: "ic_philosophy")!, selected: false),
                    Occupation(id: 4, parentId: 7, name: "פסיכולוגיה", icon: UIImage(named: "ic_psychology")!, selected: false),
                    Occupation(id: 5, parentId: 7, name: "מדעי החברה", icon: UIImage(named: "ic_social_sciences")!, selected: false),
                    Occupation(id: 6, parentId: 7, name: "מתמחה במדעי החברה", icon: UIImage(named: "ic_specialization_social")!, selected: false)
            ]
        }
     }
    
    class func engineerNames() -> [Occupation] {
        if(language == "en"){
            return [Occupation(id: 1, parentId: 9, name: "Energy Engineering", icon: UIImage(named: "ic_energy_eng")!, selected: false),
                    Occupation(id: 2, parentId: 9, name: "Hardware Engineering", icon: UIImage(named: "ic_hardware_eng")!, selected: false),
                    Occupation(id: 3, parentId: 9, name: "Road Engineering", icon: UIImage(named: "ic_road_eng")!, selected: false),
                    Occupation(id: 4, parentId: 9, name: "Research & Development", icon: UIImage(named: "ic_research_eng")!, selected: false),
                    Occupation(id: 5, parentId: 9, name: "Water Engineering", icon: UIImage(named: "ic_water_eng")!, selected: false),
                    Occupation(id: 6, parentId: 9, name: "Systems Engineering", icon: UIImage(named: "ic_systems_eng")!, selected: false),
                    Occupation(id: 7, parentId: 9, name: "City Engineering", icon: UIImage(named: "ic_city_eng")!, selected: false),
                    Occupation(id: 8, parentId: 9, name: "Plastics Engineering", icon: UIImage(named: "ic_plastics_eng")!, selected: false),
                    Occupation(id: 9, parentId: 9, name: "Component Engineering", icon: UIImage(named: "ic_component_eng")!, selected: false),
                    Occupation(id: 10, parentId: 9, name: "Transportation Engineering", icon: UIImage(named: "ic_transport_eng")!, selected: false),
                    Occupation(id: 11, parentId: 9, name: "Communication Engineering", icon: UIImage(named: "ic_comm_eng")!, selected: false),
                    Occupation(id: 12, parentId: 9, name: "Industrial Engineering", icon: UIImage(named: "ic_industrial")!, selected: false)
            ]
        }
        else {
            return [Occupation(id: 1, parentId: 9, name: "הנדסת אנרגיה", icon: UIImage(named: "ic_energy_eng")!, selected: false),
                    Occupation(id: 2, parentId: 9, name: "הנדסת חומרה", icon: UIImage(named: "ic_hardware_eng")!, selected: false),
                    Occupation(id: 3, parentId: 9, name: "הנדסת כבישים", icon: UIImage(named: "ic_road_eng")!, selected: false),
                    Occupation(id: 4, parentId: 9, name: "הנדסת מחקר ופיתוח", icon: UIImage(named: "ic_research_eng")!, selected: false),
                    Occupation(id: 5, parentId: 9, name: "הנדסת מים", icon: UIImage(named: "ic_water_eng")!, selected: false),
                    Occupation(id: 6, parentId: 9, name: "הנדסת מערכות", icon: UIImage(named: "ic_systems_eng")!, selected: false),
                    Occupation(id: 7, parentId: 9, name: "הנדסת ערים", icon: UIImage(named: "ic_city_eng")!, selected: false),
                    Occupation(id: 8, parentId: 9, name: "הנדסת פלסטיקה", icon: UIImage(named: "ic_plastics_eng")!, selected: false),
                    Occupation(id: 9, parentId: 9, name: "הנדסת רכיבים", icon: UIImage(named: "ic_component_eng")!, selected: false),
                    Occupation(id: 10, parentId: 9, name: "הנדסת תחבורה", icon: UIImage(named: "ic_transport_eng")!, selected: false),
                    Occupation(id: 11, parentId: 9, name: "הנדסת תקשורת", icon: UIImage(named: "ic_comm_eng")!, selected: false),
                    Occupation(id: 12, parentId: 9, name: "הנדסה תעשייה וניהול", icon: UIImage(named: "ic_industrial")!, selected: false)
            ]
        }
       }
    
    class func designNames() -> [Occupation] {
        if(language == "en"){
            return [Occupation(id: 1, parentId: 8, name: "Industrial Design", icon: UIImage(named: "ic_industrial_design")!, selected: false),
                    Occupation(id: 2, parentId: 8, name: "Interior Design", icon: UIImage(named: "ic_interior")!, selected: false),
                    Occupation(id: 3, parentId: 8, name: "Gypsum Design", icon: UIImage(named: "ic_gypsum")!, selected: false),
                    Occupation(id: 4, parentId: 8, name: "Wooden Designer", icon: UIImage(named: "ic_wooden")!, selected: false),
                    Occupation(id: 5, parentId: 8, name: "Product Designer", icon: UIImage(named: "ic_product")!, selected: false),
                    Occupation(id: 6, parentId: 8, name: "Kitchen Designer", icon: UIImage(named: "ic_kitchen")!, selected: false),
                    Occupation(id: 7, parentId: 8, name: "Architecture", icon: UIImage(named: "ic_architecture")!, selected: false),
                    Occupation(id: 8, parentId: 8, name: "Graphic Designer", icon: UIImage(named: "ic_graphic")!, selected: false)
            ]
        }
        else {
            return [Occupation(id: 1, parentId: 8, name: "עיצוב תעשייתי", icon: UIImage(named: "ic_industrial_design")!, selected: false),
                    Occupation(id: 2, parentId: 8, name: "עיצוב פנים", icon: UIImage(named: "ic_interior")!, selected: false),
                    Occupation(id: 3, parentId: 8, name: "מעצב/ת בגבס", icon: UIImage(named: "ic_gypsum")!, selected: false),
                    Occupation(id: 4, parentId: 8, name: "מעצב/ת בעץ", icon: UIImage(named: "ic_wooden")!, selected: false),
                    Occupation(id: 5, parentId: 8, name: "מעצב/ת מוצר", icon: UIImage(named: "ic_product")!, selected: false),
                    Occupation(id: 6, parentId: 8, name: "מעצב/ת מטבחים", icon: UIImage(named: "ic_kitchen")!, selected: false),
                    Occupation(id: 7, parentId: 8, name: "אדריכלות", icon: UIImage(named: "ic_architecture")!, selected: false),
                    Occupation(id: 8, parentId: 8, name: "גרפיקאי/ מעצב גרפי", icon: UIImage(named: "ic_graphic")!, selected: false)
            ]
        }
    }
    
    class func computerNames() -> [Occupation] {
        if(language == "en"){
            return [Occupation(id: 1, parentId: 0, name: "Integration", icon: UIImage(named: "ic_integration")!, selected: false),
                    Occupation(id: 2, parentId: 0, name: "Software Tester", icon: UIImage(named: "ic_software_tester")!, selected: false),
                    Occupation(id: 3, parentId: 0, name: "Hardware", icon: UIImage(named: "ic_hardware")!, selected: false),
                    Occupation(id: 4, parentId: 0, name: "Software Technician", icon: UIImage(named: "ic_software_tech")!, selected: false),
                    Occupation(id: 5, parentId: 0, name: "Website Designer", icon: UIImage(named: "ic_wesite_designer")!, selected: false),
                    Occupation(id: 6, parentId: 0, name: "Webmaster", icon: UIImage(named: "ic_webmaster")!, selected: false),
                    Occupation(id: 7, parentId: 0, name: "Chief Information Officer", icon: UIImage(named: "ic_cio")!, selected: false),
                    Occupation(id: 8, parentId: 0, name: "Programmer", icon: UIImage(named: "ic_programmer")!, selected: false),
                    Occupation(id: 9, parentId: 0, name: "Technical Support", icon: UIImage(named: "ic_technical_support")!, selected: false),
                    Occupation(id: 10, parentId: 0, name: "Software", icon: UIImage(named: "ic_software")!, selected: false),
                    Occupation(id: 11, parentId: 0, name: "Developer", icon: UIImage(named: "ic_developer")!, selected: false),
                    Occupation(id: 12, parentId: 0, name: "System Architect", icon: UIImage(named: "ic_system_architect")!, selected: false)
                
            ]
        }
        else {
            return [Occupation(id: 1, parentId: 0, name: "אינטגרציה", icon: UIImage(named: "ic_integration")!, selected: false),
                    Occupation(id: 2, parentId: 0, name: "בודק תוכנה", icon: UIImage(named: "ic_software_tester")!, selected: false),
                    Occupation(id: 3, parentId: 0, name: "חומרה", icon: UIImage(named: "ic_hardware")!, selected: false),
                    Occupation(id: 4, parentId: 0, name: "טכנאי/ת מחשבים", icon: UIImage(named: "ic_software_tech")!, selected: false),
                    Occupation(id: 5, parentId: 0, name: "מעצב/ת אתרים", icon: UIImage(named: "ic_wesite_designer")!, selected: false),
                    Occupation(id: 6, parentId: 0, name: "וובמאסטר", icon: UIImage(named: "ic_webmaster")!, selected: false),
                    Occupation(id: 7, parentId: 0, name: "מנהל/ת מערכות מידע", icon: UIImage(named: "ic_cio")!, selected: false),
                    Occupation(id: 8, parentId: 0, name: "מתכנת", icon: UIImage(named: "ic_programmer")!, selected: false),
                    Occupation(id: 9, parentId: 0, name: "תמיכה טכנית", icon: UIImage(named: "ic_technical_support")!, selected: false),
                    Occupation(id: 10, parentId: 0, name: "תוכנה", icon: UIImage(named: "ic_software")!, selected: false),
                    Occupation(id: 11, parentId: 0, name: "מפתח/ת", icon: UIImage(named: "ic_developer")!, selected: false),
                    Occupation(id: 12, parentId: 0, name: "ארכיטקט מערכות", icon: UIImage(named: "ic_system_architect")!, selected: false)
            ]
        }
    }
    
    class func communcationNames() -> [Occupation] {
        if(language == "en"){
            return [Occupation(id: 1, parentId: 5, name: "Animator", icon: UIImage(named: "ic_animator")!, selected: false),
                    Occupation(id: 2, parentId: 5, name: "Journalist", icon: UIImage(named: "ic_journalist")!, selected: false),
                    Occupation(id: 3, parentId: 5, name: "Spokesperson", icon: UIImage(named: "ic_spokesperson")!, selected: false),
                    Occupation(id: 4, parentId: 5, name: "Radio Broadcaster", icon: UIImage(named: "ic_radio_broadcaster")!, selected: false),
                    Occupation(id: 5, parentId: 5, name: "Sound Technician", icon: UIImage(named: "ic_sound_tech")!, selected: false),
                    Occupation(id: 6, parentId: 5, name: "Music Editor", icon: UIImage(named: "ic_music_editor")!, selected: false),
                    Occupation(id: 7, parentId: 5, name: "TV Host", icon: UIImage(named: "ic_tv_host")!, selected: false),
                    Occupation(id: 8, parentId: 5, name: "Marketing Communications", icon: UIImage(named: "ic_marketing")!, selected: false),
                    Occupation(id: 9, parentId: 5, name: "Researcher", icon: UIImage(named: "ic_researcher")!, selected: false),
                    Occupation(id: 10, parentId: 5, name: "Language Editor", icon: UIImage(named: "ic_language_editor")!, selected: false),
                    Occupation(id: 11, parentId: 5, name: "Advertising", icon: UIImage(named: "ic_advert")!, selected: false),
                    Occupation(id: 12, parentId: 5, name: "Photography & Digital Media", icon: UIImage(named: "ic_photography")!, selected: false)
            ]
        }
        else {
            return [Occupation(id: 1, parentId: 5, name: "אנימטור/ית", icon: UIImage(named: "ic_animator")!, selected: false),
                    Occupation(id: 2, parentId: 5, name: "עיתונאי/ת", icon: UIImage(named: "ic_journalist")!, selected: false),
                    Occupation(id: 3, parentId: 5, name: "דוברות", icon: UIImage(named: "ic_spokesperson")!, selected: false),
                    Occupation(id: 4, parentId: 5, name: "שדרנ/ית רדיו", icon: UIImage(named: "ic_radio_broadcaster")!, selected: false),
                    Occupation(id: 5, parentId: 5, name: "טכנאי סאונד", icon: UIImage(named: "ic_sound_tech")!, selected: false),
                    Occupation(id: 6, parentId: 5, name: "עורכ/ת מוזיקלי/ת", icon: UIImage(named: "ic_music_editor")!, selected: false),
                    Occupation(id: 7, parentId: 5, name: "מגיש/ה בטלויזיה", icon: UIImage(named: "ic_tv_host")!, selected: false),
                    Occupation(id: 8, parentId: 5, name: "תקשורת שיווקית", icon: UIImage(named: "ic_marketing")!, selected: false),
                    Occupation(id: 9, parentId: 5, name: "תחקירנ/ית", icon: UIImage(named: "ic_researcher")!, selected: false),
                    Occupation(id: 10, parentId: 5, name: "עורכ/ת לשון", icon: UIImage(named: "ic_language_editor")!, selected: false),
                    Occupation(id: 11, parentId: 5, name: "פרסום", icon: UIImage(named: "ic_advert")!, selected: false),
                    Occupation(id: 12, parentId: 5, name: "צילום ומדיה דיגיטלית", icon: UIImage(named: "ic_photography")!, selected: false)
            ]
        }
    }
  
    
    
    //GENERAL
    
    class func generalProfessions() -> [Occupation] {
        if(language == "en"){
            return [Occupation(id: 1, parentId: 12, name: "Postman", icon: UIImage(named: "cat_general_professions")!, selected: false),
                    Occupation(id: 2, parentId: 12, name: "Ritual bathhouse attendant", icon: UIImage(named: "cat_general_professions")!, selected: false),
                    Occupation(id: 3, parentId: 12, name: "Dealer", icon: UIImage(named: "cat_general_professions")!, selected: false),
                    Occupation(id: 4, parentId: 12, name: "Butcher", icon: UIImage(named: "cat_general_professions")!, selected: false),
                    Occupation(id: 5, parentId: 12, name: "Surveyor", icon: UIImage(named: "cat_general_professions")!, selected: false),
                    Occupation(id: 6, parentId: 12, name: "Critic", icon: UIImage(named: "cat_general_professions")!, selected: false),
                    Occupation(id: 7, parentId: 12, name: "Quality critic", icon: UIImage(named: "cat_general_professions")!, selected: false),
                    Occupation(id: 8, parentId: 12, name: "Factory worker", icon: UIImage(named: "cat_general_professions")!, selected: false),
                    Occupation(id: 9, parentId: 12, name: "Matchmaker", icon: UIImage(named: "cat_general_professions")!, selected: false),
                    Occupation(id: 10, parentId: 12, name: "Transcriber", icon: UIImage(named: "cat_general_professions")!, selected: false),
                    Occupation(id: 11, parentId: 12, name: "Laundry worker", icon: UIImage(named: "cat_general_professions")!, selected: false),
                    Occupation(id: 12, parentId: 12, name: "Archive worker", icon: UIImage(named: "cat_general_professions")!, selected: false),
                    Occupation(id: 13, parentId: 12, name: "Production line", icon: UIImage(named: "cat_general_professions")!, selected: false),
                    Occupation(id: 14, parentId: 12, name: "CNC", icon: UIImage(named: "cat_general_professions")!, selected: false),
                    Occupation(id: 15, parentId: 12, name: "Event worker", icon: UIImage(named: "cat_general_professions")!, selected: false),
                    Occupation(id: 16, parentId: 12, name: "Event Operator", icon: UIImage(named: "cat_general_professions")!, selected: false)
            ]
        }
        else {
            return [Occupation(id: 1, parentId: 12, name: "דוור/ית", icon: UIImage(named: "cat_general_professions")!, selected: false),
                    Occupation(id: 2, parentId: 12, name: "בלנית", icon: UIImage(named: "cat_general_professions")!, selected: false),
                    Occupation(id: 3, parentId: 12, name: "דילר/ית", icon: UIImage(named: "cat_general_professions")!, selected: false),
                    Occupation(id: 4, parentId: 12, name: "שוחט/ת", icon: UIImage(named: "cat_general_professions")!, selected: false),
                    Occupation(id: 5, parentId: 12, name: "מודד/ת", icon: UIImage(named: "cat_general_professions")!, selected: false),
                    Occupation(id: 6, parentId: 12, name: "מבקר/ת", icon: UIImage(named: "cat_general_professions")!, selected: false),
                    Occupation(id: 7, parentId: 12, name: "בקר/ית איכות", icon: UIImage(named: "cat_general_professions")!, selected: false),
                    Occupation(id: 8, parentId: 12, name: "עובד/ת מפעל", icon: UIImage(named: "cat_general_professions")!, selected: false),
                    Occupation(id: 9, parentId: 12, name: "שדכנ/ית", icon: UIImage(named: "cat_general_professions")!, selected: false),
                    Occupation(id: 10, parentId: 12, name: "מתמלל/ת", icon: UIImage(named: "cat_general_professions")!, selected: false),
                    Occupation(id: 11, parentId: 12, name: "עובד/ת מכבסה", icon: UIImage(named: "cat_general_professions")!, selected: false),
                    Occupation(id: 12, parentId: 12, name: "עובד/ת ארכיב", icon: UIImage(named: "cat_general_professions")!, selected: false),
                    Occupation(id: 13, parentId: 12, name: "קו ייצור", icon: UIImage(named: "cat_general_professions")!, selected: false),
                    Occupation(id: 14, parentId: 12, name: "כרסום (CNC)", icon: UIImage(named: "cat_general_professions")!, selected: false),
                    Occupation(id: 15, parentId: 12, name: "עובד/ת אירועים", icon: UIImage(named: "cat_general_professions")!, selected: false),
                    Occupation(id: 16, parentId: 12, name: "מפעיל/ת אירועים", icon: UIImage(named: "cat_general_professions")!, selected: false)
            ]
        }
    }
    
    class func aviationNames() -> [Occupation] {
        if(language == "en"){
            return [Occupation(id: 1, parentId: 13, name: "Aircraft pilot", icon: UIImage(named: "cat_aviation")!, selected: false),
                    Occupation(id: 2, parentId: 13, name: "Flight attendant", icon: UIImage(named: "cat_aviation")!, selected: false),
                    Occupation(id: 3, parentId: 13, name: "Ground attendant", icon: UIImage(named: "cat_aviation")!, selected: false),
                    Occupation(id: 4, parentId: 13, name: "Operation room", icon: UIImage(named: "cat_aviation")!, selected: false),
                    Occupation(id: 5, parentId: 13, name: "Aircraft mechanic", icon: UIImage(named: "cat_aviation")!, selected: false),
                    Occupation(id: 6, parentId: 13, name: "Operates aviation equipment", icon: UIImage(named: "cat_aviation")!, selected: false),
                    Occupation(id: 7, parentId: 13, name: "Operates operational equipment", icon: UIImage(named: "cat_aviation")!, selected: false),
                    Occupation(id: 8, parentId: 13, name: "Land Services Manager", icon: UIImage(named: "cat_aviation")!, selected: false),
                    Occupation(id: 9, parentId: 13, name: "Airport employee", icon: UIImage(named: "cat_aviation")!, selected: false),
                    Occupation(id: 10, parentId: 13, name: "Porter", icon: UIImage(named: "cat_aviation")!, selected: false),
                    Occupation(id: 11, parentId: 13, name: "Ground services", icon: UIImage(named: "cat_aviation")!, selected: false),
                    Occupation(id: 12, parentId: 13, name: "Attendant", icon: UIImage(named: "cat_aviation")!, selected: false)
            ]
        }
        else {
            return [Occupation(id: 1, parentId: 13, name: "טייס/ת", icon: UIImage(named: "cat_aviation")!, selected: false),
                    Occupation(id: 2, parentId: 13, name: "דייל/ת אוויר", icon: UIImage(named: "cat_aviation")!, selected: false),
                    Occupation(id: 3, parentId: 13, name: "דייל/ת קרקע", icon: UIImage(named: "cat_aviation")!, selected: false),
                    Occupation(id: 4, parentId: 13, name: "חדר מבצעים", icon: UIImage(named: "cat_aviation")!, selected: false),
                    Occupation(id: 5, parentId: 13, name: "מכונאי/ת מטוסים", icon: UIImage(named: "cat_aviation")!, selected: false),
                    Occupation(id: 6, parentId: 13, name: "מפעיל/ת ציוד תעופה", icon: UIImage(named: "cat_aviation")!, selected: false),
                    Occupation(id: 7, parentId: 13, name: "מפעיל/ת ציוד תפעולי", icon: UIImage(named: "cat_aviation")!, selected: false),
                    Occupation(id: 8, parentId: 13, name: "מנהל/ת שירותי קרקע", icon: UIImage(named: "cat_aviation")!, selected: false),
                    Occupation(id: 9, parentId: 13, name: "עובד/ת נמל התעופה", icon: UIImage(named: "cat_aviation")!, selected: false),
                    Occupation(id: 10, parentId: 13, name: "סבל/ית", icon: UIImage(named: "cat_aviation")!, selected: false),
                    Occupation(id: 11, parentId: 13, name: "שירותי קרקע", icon: UIImage(named: "cat_aviation")!, selected: false),
                    Occupation(id: 12, parentId: 13, name: "דייל/ת", icon: UIImage(named: "cat_aviation")!, selected: false)
            ]
        }
     }
    
    class func insuranceNames() -> [Occupation] {
        if(language == "en"){
            return [Occupation(id: 1, parentId: 14, name: "Insurance Investigator", icon: UIImage(named: "cat_insurance")!, selected: false),
                    Occupation(id: 2, parentId: 14, name: "Insurance agent", icon: UIImage(named: "cat_insurance")!, selected: false),
                    Occupation(id: 3, parentId: 14, name: "Car appraiser", icon: UIImage(named: "cat_insurance")!, selected: false),
                    Occupation(id: 4, parentId: 14, name: "Real estate appraise", icon: UIImage(named: "cat_insurance")!, selected: false),
                    Occupation(id: 5, parentId: 14, name: "Appraiser", icon: UIImage(named: "cat_insurance")!, selected: false),
                    Occupation(id: 6, parentId: 14, name: "Insurance Manager", icon: UIImage(named: "cat_insurance")!, selected: false)
            ]
        }
        else {
            return [Occupation(id: 1, parentId: 14, name: "חוקר ביטוח", icon: UIImage(named: "cat_insurance")!, selected: false),
                    Occupation(id: 2, parentId: 14, name: "סוכנ/ת ביטוח", icon: UIImage(named: "cat_insurance")!, selected: false),
                    Occupation(id: 3, parentId: 14, name: "שמאי/ת רכב", icon: UIImage(named: "cat_insurance")!, selected: false),
                    Occupation(id: 4, parentId: 14, name: "שמאי/ת מקרקעין", icon: UIImage(named: "cat_insurance")!, selected: false),
                    Occupation(id: 5, parentId: 14, name: "שמאי/ת", icon: UIImage(named: "cat_insurance")!, selected: false),
                    Occupation(id: 6, parentId: 14, name: "מנהל/ת תחום בביטוח", icon: UIImage(named: "cat_insurance")!, selected: false)
            ]
        }
      }
     
    class func forwardingNames() -> [Occupation] {
        if(language == "en"){
            return [Occupation(id: 1, parentId: 15, name: "Emissary", icon: UIImage(named: "cat_forwarding")!, selected: false),
                    Occupation(id: 2, parentId: 15, name: "International shipping", icon: UIImage(named: "cat_forwarding")!, selected: false),
                    Occupation(id: 3, parentId: 15, name: "Import and Export", icon: UIImage(named: "cat_forwarding")!, selected: false),
                    Occupation(id: 4, parentId: 15, name: "Port worker", icon: UIImage(named: "cat_forwarding")!, selected: false),
                    Occupation(id: 5, parentId: 15, name: "Freight services", icon: UIImage(named: "cat_forwarding")!, selected: false)
            ]
        }
        else {
            return [Occupation(id: 1, parentId: 15, name: "שליח/ה", icon: UIImage(named: "cat_forwarding")!, selected: false),
                    Occupation(id: 2, parentId: 15, name: "שילוח בינלאומי", icon: UIImage(named: "cat_forwarding")!, selected: false),
                    Occupation(id: 3, parentId: 15, name: "יבוא ויצוא", icon: UIImage(named: "cat_forwarding")!, selected: false),
                    Occupation(id: 4, parentId: 15, name: "עובד/ת נמל", icon: UIImage(named: "cat_forwarding")!, selected: false),
                    Occupation(id: 5, parentId: 15, name: "מוביל/ה", icon: UIImage(named: "cat_forwarding")!, selected: false)
            ]
        }
    }
    
    class func transportationNames() -> [Occupation] {
        if(language == "en"){
            return [Occupation(id: 1, parentId: 16, name: "Bus driver", icon: UIImage(named: "cat_transportation")!, selected: false),
                    Occupation(id: 2, parentId: 16, name: "Tractor driver", icon: UIImage(named: "cat_transportation")!, selected: false),
                    Occupation(id: 3, parentId: 16, name: "Taxi driver", icon: UIImage(named: "cat_transportation")!, selected: false),
                    Occupation(id: 4, parentId: 16, name: "Truck driver", icon: UIImage(named: "cat_transportation")!, selected: false),
                    Occupation(id: 5, parentId: 16, name: "Driver", icon: UIImage(named: "cat_transportation")!, selected: false),
                    Occupation(id: 6, parentId: 16, name: "Train worker", icon: UIImage(named: "cat_transportation")!, selected: false),
                    Occupation(id: 7, parentId: 16, name: "Gas station attendant", icon: UIImage(named: "cat_transportation")!, selected: false),
                    Occupation(id: 8, parentId: 16, name: "Driving instructor", icon: UIImage(named: "cat_transportation")!, selected: false)
            ]
        }
        else {
            return [Occupation(id: 1, parentId: 16, name: "נהג/ת אוטובוס", icon: UIImage(named: "cat_transportation")!, selected: false),
                    Occupation(id: 2, parentId: 16, name: "נהג/ת טרקטור", icon: UIImage(named: "cat_transportation")!, selected: false),
                    Occupation(id: 3, parentId: 16, name: "נהג/ת מונית", icon: UIImage(named: "cat_transportation")!, selected: false),
                    Occupation(id: 4, parentId: 16, name: "נהג/ת משאית", icon: UIImage(named: "cat_transportation")!, selected: false),
                    Occupation(id: 5, parentId: 16, name: "נהג/ת", icon: UIImage(named: "cat_transportation")!, selected: false),
                    Occupation(id: 6, parentId: 16, name: "עובד/ת רכבת", icon: UIImage(named: "cat_transportation")!, selected: false),
                    Occupation(id: 7, parentId: 16, name: "מתדלק/ת", icon: UIImage(named: "cat_transportation")!, selected: false),
                    Occupation(id: 8, parentId: 16, name: "מורה נהיגה", icon: UIImage(named: "cat_transportation")!, selected: false)
            ]
        }
    }
    
    class func buildingNames() -> [Occupation] {
        if(language == "en"){
            return [Occupation(id: 1, parentId: 17, name: "Construction Manager", icon: UIImage(named: "cat_building")!, selected: false),
                    Occupation(id: 2, parentId: 17, name: "Crane operator", icon: UIImage(named: "cat_building")!, selected: false),
                    Occupation(id: 3, parentId: 17, name: "Building worker", icon: UIImage(named: "cat_building")!, selected: false),
                    Occupation(id: 4, parentId: 17, name: "Construction site manager", icon: UIImage(named: "cat_building")!, selected: false),
                    Occupation(id: 5, parentId: 17, name: "Real estate broker", icon: UIImage(named: "cat_building")!, selected: false),
                    Occupation(id: 6, parentId: 17, name: "Height worker", icon: UIImage(named: "cat_building")!, selected: false),
                    Occupation(id: 7, parentId: 17, name: "Construction Supervisor", icon: UIImage(named: "cat_building")!, selected: false),
                    Occupation(id: 8, parentId: 17, name: "Contractor", icon: UIImage(named: "cat_building")!, selected: false),
                    Occupation(id: 9, parentId: 17, name: "Crane", icon: UIImage(named: "cat_building")!, selected: false),
                    Occupation(id: 10, parentId: 17, name: "Draftsman", icon: UIImage(named: "cat_building")!, selected: false)
            ]
        }
        else {
            return [Occupation(id: 1, parentId: 17, name: "מנהל/ת עבודה בבינוי", icon: UIImage(named: "cat_building")!, selected: false),
                       Occupation(id: 2, parentId: 17, name: "מנופאי/ת", icon: UIImage(named: "cat_building")!, selected: false),
                       Occupation(id: 3, parentId: 17, name: "בניין", icon: UIImage(named: "cat_building")!, selected: false),
                       Occupation(id: 4, parentId: 17, name: "מנהל/ת אתר בניה", icon: UIImage(named: "cat_building")!, selected: false),
                       Occupation(id: 5, parentId: 17, name: "מתווך נדל\"ן", icon: UIImage(named: "cat_building")!, selected: false),
                       Occupation(id: 6, parentId: 17, name: "עובד/ת גובה", icon: UIImage(named: "cat_building")!, selected: false),
                       Occupation(id: 7, parentId: 17, name: "פקח/ית בניה", icon: UIImage(named: "cat_building")!, selected: false),
                       Occupation(id: 8, parentId: 17, name: "קבלן", icon: UIImage(named: "cat_building")!, selected: false),
                       Occupation(id: 9, parentId: 17, name: "עגורן", icon: UIImage(named: "cat_building")!, selected: false),
                       Occupation(id: 10, parentId: 17, name: "שרטט/ת", icon: UIImage(named: "cat_building")!, selected: false)
            ]
        }
    }
    
    class func careNames() -> [Occupation] {
        if(language == "en"){
            return [Occupation(id: 1, parentId: 18, name: "Hair Removal", icon: UIImage(named: "cat_care_fashion")!, selected: false),
                    Occupation(id: 2, parentId: 18, name: "Make up artist", icon: UIImage(named: "cat_care_fashion")!, selected: false),
                    Occupation(id: 3, parentId: 18, name: "Manicure pedicure", icon: UIImage(named: "cat_care_fashion")!, selected: false),
                    Occupation(id: 4, parentId: 18, name: "Hairdresser", icon: UIImage(named: "cat_care_fashion")!, selected: false),   
                    Occupation(id: 5, parentId: 18, name: "Barber", icon: UIImage(named: "cat_care_fashion")!, selected: false),
                    Occupation(id: 6, parentId: 18, name: "Cosmetician", icon: UIImage(named: "cat_care_fashion")!, selected: false),
                    Occupation(id: 7, parentId: 18, name: "Seamstress", icon: UIImage(named: "cat_care_fashion")!, selected: false),
                    Occupation(id: 8, parentId: 18, name: "Jeweler", icon: UIImage(named: "cat_care_fashion")!, selected: false),
                    Occupation(id: 9, parentId: 18, name: "Model", icon: UIImage(named: "cat_care_fashion")!, selected: false),
                    Occupation(id: 10, parentId: 18, name: "Textile work manager", icon: UIImage(named: "cat_care_fashion")!, selected: false),
                    Occupation(id: 11, parentId: 18, name: "Fashion design", icon: UIImage(named: "cat_care_fashion")!, selected: false),
                    Occupation(id: 12, parentId: 18, name: "Celebrity branding", icon: UIImage(named: "cat_care_fashion")!, selected: false),
            ]
        }
        else {
            return [Occupation(id: 1, parentId: 18, name: "הסרת שיער", icon: UIImage(named: "cat_care_fashion")!, selected: false),
                    Occupation(id: 2, parentId: 18, name: "מאפר/ת", icon: UIImage(named: "cat_care_fashion")!, selected: false),
                    Occupation(id: 3, parentId: 18, name: "מניקור/ פדיקור", icon: UIImage(named: "cat_care_fashion")!, selected: false),
                    Occupation(id: 4, parentId: 18, name: "מעצב/ת שיער", icon: UIImage(named: "cat_care_fashion")!, selected: false),
                    Occupation(id: 5, parentId: 18, name: "ספר/ית", icon: UIImage(named: "cat_care_fashion")!, selected: false),
                    Occupation(id: 6, parentId: 18, name: "קוסמטיקאי/ת", icon: UIImage(named: "cat_care_fashion")!, selected: false),
                    Occupation(id: 7, parentId: 18, name: "תופר/ת", icon: UIImage(named: "cat_care_fashion")!, selected: false),
                    Occupation(id: 8, parentId: 18, name: "תכשיטנ/ית", icon: UIImage(named: "cat_care_fashion")!, selected: false),
                    Occupation(id: 9, parentId: 18, name: "דוגמנ/ית", icon: UIImage(named: "cat_care_fashion")!, selected: false),
                    Occupation(id: 10, parentId: 18, name: "מנהל/ת עבודה בטקסטיל", icon: UIImage(named: "cat_care_fashion")!, selected: false),
                    Occupation(id: 11, parentId: 18, name: "עיצוב אופנה", icon: UIImage(named: "cat_care_fashion")!, selected: false),
                    Occupation(id: 12, parentId: 18, name: "פרזנטור/ית", icon: UIImage(named: "cat_care_fashion")!, selected: false),
            ]
        }
       }
    
    class func warehouseNames() -> [Occupation] {
        if(language == "en"){
            return [Occupation(id: 1, parentId: 19, name: "Warehouse", icon: UIImage(named: "cat_warehouse")!, selected: false),
                    Occupation(id: 2, parentId: 19, name: "Logistics", icon: UIImage(named: "cat_warehouse")!, selected: false),
                    Occupation(id: 3, parentId: 19, name: "Forklift operator", icon: UIImage(named: "cat_warehouse")!, selected: false),
                    Occupation(id: 4, parentId: 19, name: "Warehouse Manager", icon: UIImage(named: "cat_warehouse")!, selected: false),
                    Occupation(id: 5, parentId: 19, name: "Supply Manager", icon: UIImage(named: "cat_warehouse")!, selected: false),
                    Occupation(id: 6, parentId: 19, name: "Purchasing Coordinator", icon: UIImage(named: "cat_warehouse")!, selected: false),
                    Occupation(id: 7, parentId: 19, name: "Inventory Manager", icon: UIImage(named: "cat_warehouse")!, selected: false),
                    Occupation(id: 8, parentId: 19, name: "Vice President of Procurement", icon: UIImage(named: "cat_warehouse")!, selected: false),
                    Occupation(id: 9, parentId: 19, name: "Commodity Sorts", icon: UIImage(named: "cat_warehouse")!, selected: false),
                    Occupation(id: 10, parentId: 19, name: "Proprietary", icon: UIImage(named: "cat_warehouse")!, selected: false)
            ]
        }
        else {
            return [Occupation(id: 1, parentId: 19, name: "מחסנאי/ת", icon: UIImage(named: "cat_warehouse")!, selected: false),
                    Occupation(id: 2, parentId: 19, name: "לוגיסטיקה", icon: UIImage(named: "cat_warehouse")!, selected: false),
                    Occupation(id: 3, parentId: 19, name: "מלגזנ/ית", icon: UIImage(named: "cat_warehouse")!, selected: false),
                    Occupation(id: 4, parentId: 19, name: "מנהל/ת מחסן", icon: UIImage(named: "cat_warehouse")!, selected: false),
                    Occupation(id: 5, parentId: 19, name: "מנהל/ת אספקה", icon: UIImage(named: "cat_warehouse")!, selected: false),
                    Occupation(id: 6, parentId: 19, name: "מתאמ/ת רכש", icon: UIImage(named: "cat_warehouse")!, selected: false),
                    Occupation(id: 7, parentId: 19, name: "מנהל/ת מלאי", icon: UIImage(named: "cat_warehouse")!, selected: false),
                    Occupation(id: 8, parentId: 19, name: "סמנכ\"ל רכש", icon: UIImage(named: "cat_warehouse")!, selected: false),
                    Occupation(id: 9, parentId: 19, name: "סדרנ/ית סחורה", icon: UIImage(named: "cat_warehouse")!, selected: false),
                    Occupation(id: 10, parentId: 19, name: "קניינ/ית", icon: UIImage(named: "cat_warehouse")!, selected: false)
            ]
        }
    }
       
    class func cleaningNames() -> [Occupation] {
        if(language == "en"){
        return [Occupation(id: 1, parentId: 20, name: "House keeper", icon: UIImage(named: "cat_cleaning")!, selected: false),
                      Occupation(id: 2, parentId: 20, name: "Maintenance Man", icon: UIImage(named: "cat_cleaning")!, selected: false),
                      Occupation(id: 3, parentId: 20, name: "Rappelling Windows Cleaner", icon: UIImage(named: "cat_cleaning")!, selected: false),
                      Occupation(id: 4, parentId: 20, name: "Cleaning", icon: UIImage(named: "cat_cleaning")!, selected: false),
                      Occupation(id: 5, parentId: 20, name: "Household administrator", icon: UIImage(named: "cat_cleaning")!, selected: false)
           ]
        }
        else {
            return [Occupation(id: 1, parentId: 20, name: "אב בית", icon: UIImage(named: "cat_cleaning")!, selected: false),
                    Occupation(id: 2, parentId: 20, name: "איש אחזקה", icon: UIImage(named: "cat_cleaning")!, selected: false),
                    Occupation(id: 3, parentId: 20, name: "מנקה חלונות סנפלינג", icon: UIImage(named: "cat_cleaning")!, selected: false),
                    Occupation(id: 4, parentId: 20, name: "ניקיון", icon: UIImage(named: "cat_cleaning")!, selected: false),
                    Occupation(id: 5, parentId: 20, name: "מנהל/ת משק בית", icon: UIImage(named: "cat_cleaning")!, selected: false)
            ]
        }
    }
    
    class func tourismNames() -> [Occupation] {
        if(language == "en"){
            return [Occupation(id: 1, parentId: 21, name: "Chambermaid", icon: UIImage(named: "cat_tourism")!, selected: false),
                    Occupation(id: 2, parentId: 21, name: "Hotel Manager", icon: UIImage(named: "cat_tourism")!, selected: false),
                    Occupation(id: 3, parentId: 21, name: "Hotel management", icon: UIImage(named: "cat_tourism")!, selected: false),
                    Occupation(id: 4, parentId: 21, name: "Hotelier", icon: UIImage(named: "cat_tourism")!, selected: false),
                    Occupation(id: 5, parentId: 21, name: "Hotel desk worker", icon: UIImage(named: "cat_tourism")!, selected: false),
                    Occupation(id: 6, parentId: 21, name: "Tourism Manager", icon: UIImage(named: "cat_tourism")!, selected: false),
                    Occupation(id: 7, parentId: 21, name: "VIP services", icon: UIImage(named: "cat_tourism")!, selected: false),
                    Occupation(id: 8, parentId: 21, name: "Spa worker", icon: UIImage(named: "cat_tourism")!, selected: false)
            ]
        }
        else {
            return [Occupation(id: 1, parentId: 21, name: "חדרנ/ית", icon: UIImage(named: "cat_tourism")!, selected: false),
                    Occupation(id: 2, parentId: 21, name: "מנהל/ת מלון", icon: UIImage(named: "cat_tourism")!, selected: false),
                    Occupation(id: 3, parentId: 21, name: "הנהלה בית מלון", icon: UIImage(named: "cat_tourism")!, selected: false),
                    Occupation(id: 4, parentId: 21, name: "מלונאי/ת", icon: UIImage(named: "cat_tourism")!, selected: false),
                    Occupation(id: 5, parentId: 21, name: "עובד/ת דלפק בבית מלון", icon: UIImage(named: "cat_tourism")!, selected: false),
                    Occupation(id: 6, parentId: 21, name: "מנהל/ת תיירות", icon: UIImage(named: "cat_tourism")!, selected: false),
                    Occupation(id: 7, parentId: 21, name: "שירותי VIP", icon: UIImage(named: "cat_tourism")!, selected: false),
                    Occupation(id: 8, parentId: 21, name: "עובד/ת ספא", icon: UIImage(named: "cat_tourism")!, selected: false)
            ]
        }
    }
    
    class func vehicleNames() -> [Occupation] {
        if(language == "en"){
            return [Occupation(id: 1, parentId: 22, name: "Car tests", icon: UIImage(named: "cat_vehicle")!, selected: false),
                    Occupation(id: 2, parentId: 22, name: "Car rental", icon: UIImage(named: "cat_vehicle")!, selected: false),
                    Occupation(id: 3, parentId: 22, name: "Car mechanic", icon: UIImage(named: "cat_vehicle")!, selected: false),
                    Occupation(id: 4, parentId: 22, name: "Car fleet manager", icon: UIImage(named: "cat_vehicle")!, selected: false),
                    Occupation(id: 5, parentId: 22, name: "Garage manager", icon: UIImage(named: "cat_vehicle")!, selected: false),
                    Occupation(id: 6, parentId: 22, name: "Car field manager", icon: UIImage(named: "cat_vehicle")!, selected: false),
                    Occupation(id: 7, parentId: 22, name: "Installs car systems", icon: UIImage(named: "cat_vehicle")!, selected: false),
                    Occupation(id: 8, parentId: 22, name: "Car officer", icon: UIImage(named: "cat_vehicle")!, selected: false)
            ]
        }
        else {
            return [Occupation(id: 1, parentId: 22, name: "בוחנ/ת רכב", icon: UIImage(named: "cat_vehicle")!, selected: false),
                    Occupation(id: 2, parentId: 22, name: "השכרת רכבים", icon: UIImage(named: "cat_vehicle")!, selected: false),
                    Occupation(id: 3, parentId: 22, name: "מוסכניק/ית", icon: UIImage(named: "cat_vehicle")!, selected: false),
                    Occupation(id: 4, parentId: 22, name: "מנהל/ת ציי רכב", icon: UIImage(named: "cat_vehicle")!, selected: false),
                    Occupation(id: 5, parentId: 22, name: "מנהל/ת מוסך", icon: UIImage(named: "cat_vehicle")!, selected: false),
                    Occupation(id: 6, parentId: 22, name: "מנהל/ת תחום רכב", icon: UIImage(named: "cat_vehicle")!, selected: false),
                    Occupation(id: 7, parentId: 22, name: "מתקינ/ה מערכות לרכב", icon: UIImage(named: "cat_vehicle")!, selected: false),
                    Occupation(id: 8, parentId: 22, name: "קצינ/ת רכב", icon: UIImage(named: "cat_vehicle")!, selected: false)
            ]
        }
    }
    
    class func natureNames() -> [Occupation] {
        if(language == "en"){
            return [Occupation(id: 1, parentId: 23, name: "Ecologist", icon: UIImage(named: "cat_nature")!, selected: false),
                    Occupation(id: 2, parentId: 23, name: "Geography", icon: UIImage(named: "cat_nature")!, selected: false),
                    Occupation(id: 3, parentId: 23, name: "Geology", icon: UIImage(named: "cat_nature")!, selected: false),
                    Occupation(id: 4, parentId: 23, name: "Animals", icon: UIImage(named: "cat_nature")!, selected: false),
                    Occupation(id: 5, parentId: 23, name: "Archaeologist", icon: UIImage(named: "cat_nature")!, selected: false),
                    Occupation(id: 6, parentId: 23, name: "Environmental Inspector", icon: UIImage(named: "cat_nature")!, selected: false),
                    Occupation(id: 7, parentId: 23, name: "Natural and Life Sciences", icon: UIImage(named: "cat_nature")!, selected: false),
                    Occupation(id: 8, parentId: 23, name: "Exterminator", icon: UIImage(named: "cat_nature")!, selected: false),
                    Occupation(id: 9, parentId: 23, name: "View", icon: UIImage(named: "cat_nature")!, selected: false),
                    Occupation(id: 10, parentId: 23, name: "Biotechnology", icon: UIImage(named: "cat_nature")!, selected: false),
                    Occupation(id: 11, parentId: 23, name: "Biology", icon: UIImage(named: "cat_nature")!, selected: false),
                    Occupation(id: 12, parentId: 23, name: "Animal handler", icon: UIImage(named: "cat_nature")!, selected: false),
                    Occupation(id: 13, parentId: 23, name: "Meteorology", icon: UIImage(named: "cat_nature")!, selected: false),
                    Occupation(id: 14, parentId: 23, name: "Veterinarian", icon: UIImage(named: "cat_nature")!, selected: false)
            ]
        }
        else {
            return [Occupation(id: 1, parentId: 23, name: "אקולוג/ית", icon: UIImage(named: "cat_nature")!, selected: false),
                    Occupation(id: 2, parentId: 23, name: "גיאוגרפיה", icon: UIImage(named: "cat_nature")!, selected: false),
                    Occupation(id: 3, parentId: 23, name: "גיאולוגיה", icon: UIImage(named: "cat_nature")!, selected: false),
                    Occupation(id: 4, parentId: 23, name: "בעלי חיים", icon: UIImage(named: "cat_nature")!, selected: false),
                    Occupation(id: 5, parentId: 23, name: "ארכיאולוג", icon: UIImage(named: "cat_nature")!, selected: false),
                    Occupation(id: 6, parentId: 23, name: "פקח/ית איכות הסביבה", icon: UIImage(named: "cat_nature")!, selected: false),
                    Occupation(id: 7, parentId: 23, name: "מדעי הטבע והחיים", icon: UIImage(named: "cat_nature")!, selected: false),
                    Occupation(id: 8, parentId: 23, name: "מדביר/ה", icon: UIImage(named: "cat_nature")!, selected: false),
                    Occupation(id: 9, parentId: 23, name: "נוף", icon: UIImage(named: "cat_nature")!, selected: false),
                    Occupation(id: 10, parentId: 23, name: "ביוטכנולוגיה", icon: UIImage(named: "cat_nature")!, selected: false),
                    Occupation(id: 11, parentId: 23, name: "ביולוגיה", icon: UIImage(named: "cat_nature")!, selected: false),
                    Occupation(id: 12, parentId: 23, name: "מטפל/ת בחיות", icon: UIImage(named: "cat_nature")!, selected: false),
                    Occupation(id: 13, parentId: 23, name: "מטאורולוגיה", icon: UIImage(named: "cat_nature")!, selected: false),
                    Occupation(id: 14, parentId: 23, name: "וטרינר/ית", icon: UIImage(named: "cat_nature")!, selected: false)
            ]
        }
    }
    
    class func electricityNames() -> [Occupation] {
        if(language == "en"){
            return [Occupation(id: 1, parentId: 24, name: "Electronics", icon: UIImage(named: "cat_electricity")!, selected: false),
                    Occupation(id: 2, parentId: 24, name: "Wiring", icon: UIImage(named: "cat_electricity")!, selected: false),
                    Occupation(id: 3, parentId: 24, name: "Electrical Power", icon: UIImage(named: "cat_electricity")!, selected: false),
                    Occupation(id: 4, parentId: 24, name: "Electrical Equipment Technician", icon: UIImage(named: "cat_electricity")!, selected: false)
            ]
        }
        else {
            return [Occupation(id: 1, parentId: 24, name: "אלקטרוניקה", icon: UIImage(named: "cat_electricity")!, selected: false),
                    Occupation(id: 2, parentId: 24, name: "חווט/ת", icon: UIImage(named: "cat_electricity")!, selected: false),
                    Occupation(id: 3, parentId: 24, name: "חשמל", icon: UIImage(named: "cat_electricity")!, selected: false),
                    Occupation(id: 4, parentId: 24, name: "טכנאי/ת מוצרי חשמל", icon: UIImage(named: "cat_electricity")!, selected: false)
            ]
        }
    }
    
    class func waterNames() -> [Occupation] {
        if(language == "en"){
            return [Occupation(id: 1, parentId: 25, name: "Water Treatment", icon: UIImage(named: "cat_water")!, selected: false),
                    Occupation(id: 2, parentId: 25, name: "Diving Guide", icon: UIImage(named: "cat_water")!, selected: false),
                    Occupation(id: 3, parentId: 25, name: "Rower", icon: UIImage(named: "cat_water")!, selected: false),
                    Occupation(id: 4, parentId: 25, name: "Pool operator", icon: UIImage(named: "cat_water")!, selected: false),
                    Occupation(id: 5, parentId: 25, name: "Diver", icon: UIImage(named: "cat_water")!, selected: false),
                    Occupation(id: 6, parentId: 25, name: "Skipper", icon: UIImage(named: "cat_water")!, selected: false),
                    Occupation(id: 7, parentId: 25, name: "Water and soil expert", icon: UIImage(named: "cat_water")!, selected: false),
                    Occupation(id: 8, parentId: 25, name: "Water Infrastructure Specialist", icon: UIImage(named: "cat_water")!, selected: false),
                    Occupation(id: 9, parentId: 25, name: "Lifeguard", icon: UIImage(named: "cat_water")!, selected: false)
            ]
        }
        else {
            return [Occupation(id: 1, parentId: 25, name: "מטפל/ת במים", icon: UIImage(named: "cat_water")!, selected: false),
                    Occupation(id: 2, parentId: 25, name: "מדריכ/ת צלילה", icon: UIImage(named: "cat_water")!, selected: false),
                    Occupation(id: 3, parentId: 25, name: "משיט/ה", icon: UIImage(named: "cat_water")!, selected: false),
                    Occupation(id: 4, parentId: 25, name: "מפעיל/ת בריכה", icon: UIImage(named: "cat_water")!, selected: false),
                    Occupation(id: 5, parentId: 25, name: "צוללנ/ית", icon: UIImage(named: "cat_water")!, selected: false),
                    Occupation(id: 6, parentId: 25, name: "רב חובל", icon: UIImage(named: "cat_water")!, selected: false),
                    Occupation(id: 7, parentId: 25, name: "מומחה מים וקרקע", icon: UIImage(named: "cat_water")!, selected: false),
                    Occupation(id: 8, parentId: 25, name: "מומחה תשתיות מים", icon: UIImage(named: "cat_water")!, selected: false),
                    Occupation(id: 9, parentId: 25, name: "מציל/ה", icon: UIImage(named: "cat_water")!, selected: false)
            ]
        }
    }
    
    class func agricultureNames() -> [Occupation] {
        if(language == "en"){
            return [Occupation(id: 1, parentId: 26, name: "Agronomist", icon: UIImage(named: "cat_agriculture")!, selected: false),
                    Occupation(id: 2, parentId: 26, name: "Botanist", icon: UIImage(named: "cat_agriculture")!, selected: false),
                    Occupation(id: 3, parentId: 26, name: "Director of Agriculture Work", icon: UIImage(named: "cat_agriculture")!, selected: false),
                    Occupation(id: 4, parentId: 26, name: "Gardener", icon: UIImage(named: "cat_agriculture")!, selected: false)
            ]
        }
        else {
            return [Occupation(id: 1, parentId: 26, name: "אגרונום", icon: UIImage(named: "cat_agriculture")!, selected: false),
                    Occupation(id: 2, parentId: 26, name: "בוטנאי/ת", icon: UIImage(named: "cat_agriculture")!, selected: false),
                    Occupation(id: 3, parentId: 26, name: "מנהל/ת עבודה בחקלאות", icon: UIImage(named: "cat_agriculture")!, selected: false),
                    Occupation(id: 4, parentId: 26, name: "גננ/ת (מעולם הצומח)", icon: UIImage(named: "cat_agriculture")!, selected: false)
            ]
        }
     }
    
    class func sportNames() -> [Occupation] {
        if(language == "en"){
            return [Occupation(id: 1, parentId: 27, name: "Sports reporter", icon: UIImage(named: "cat_sports")!, selected: false),
                    Occupation(id: 2, parentId: 27, name: "Personal trainer", icon: UIImage(named: "cat_sports")!, selected: false),
                    Occupation(id: 3, parentId: 27, name: "Gym Guide", icon: UIImage(named: "cat_sports")!, selected: false),
                    Occupation(id: 4, parentId: 27, name: "Sportswoman", icon: UIImage(named: "cat_sports")!, selected: false),
                    Occupation(id: 5, parentId: 27, name: "Sports commentator", icon: UIImage(named: "cat_sports")!, selected: false),
                    Occupation(id: 6, parentId: 27, name: "Professional player", icon: UIImage(named: "cat_sports")!, selected: false),
                    Occupation(id: 7, parentId: 27, name: "Referee", icon: UIImage(named: "cat_sports")!, selected: false),
                    Occupation(id: 8, parentId: 27, name: "Coach", icon: UIImage(named: "cat_sports")!, selected: false)
            ]
        }
        else {
            return [Occupation(id: 1, parentId: 27, name: "כתב ספורט", icon: UIImage(named: "cat_sports")!, selected: false),
                    Occupation(id: 2, parentId: 27, name: "מאמן אישי", icon: UIImage(named: "cat_sports")!, selected: false),
                    Occupation(id: 3, parentId: 27, name: "מדריך חדר כושר", icon: UIImage(named: "cat_sports")!, selected: false),
                    Occupation(id: 4, parentId: 27, name: "ספורטאי/ת", icon: UIImage(named: "cat_sports")!, selected: false),
                    Occupation(id: 5, parentId: 27, name: "שדרנ/ית ספורט", icon: UIImage(named: "cat_sports")!, selected: false),
                    Occupation(id: 6, parentId: 27, name: "שחקנ/ית מקצועי/ת", icon: UIImage(named: "cat_sports")!, selected: false),
                    Occupation(id: 7, parentId: 27, name: "שופט/ת ספורט", icon: UIImage(named: "cat_sports")!, selected: false),
                    Occupation(id: 8, parentId: 27, name: "מאמנ/ת", icon: UIImage(named: "cat_sports")!, selected: false)
            ]
        }
    }
    
    class func cultureAndEntertainmentNames() -> [Occupation] {
        if(language == "en"){
            return [Occupation(id: 1, parentId: 28, name: "Artist", icon: UIImage(named: "cat_culture_env")!, selected: false),
                    Occupation(id: 2, parentId: 28, name: "Curator", icon: UIImage(named: "cat_culture_env")!, selected: false),
                    Occupation(id: 3, parentId: 28, name: "Art Director", icon: UIImage(named: "cat_culture_env")!, selected: false),
                    Occupation(id: 4, parentId: 28, name: "Historian", icon: UIImage(named: "cat_culture_env")!, selected: false),
                    Occupation(id: 5, parentId: 28, name: "Singer", icon: UIImage(named: "cat_culture_env")!, selected: false),
                    Occupation(id: 6, parentId: 28, name: "Lightman", icon: UIImage(named: "cat_culture_env")!, selected: false),
                    Occupation(id: 7, parentId: 28, name: "DJ", icon: UIImage(named: "cat_culture_env")!, selected: false),
                    Occupation(id: 8, parentId: 28, name: "Scripter", icon: UIImage(named: "cat_culture_env")!, selected: false),
                    Occupation(id: 9, parentId: 28, name: "Musician", icon: UIImage(named: "cat_culture_env")!, selected: false),
                    Occupation(id: 10, parentId: 28, name: "Event Designer", icon: UIImage(named: "cat_culture_env")!, selected: false),
                    Occupation(id: 11, parentId: 28, name: "Producer", icon: UIImage(named: "cat_culture_env")!, selected: false),
                    Occupation(id: 12, parentId: 28, name: "Events producer", icon: UIImage(named: "cat_culture_env")!, selected: false),
                    Occupation(id: 13, parentId: 28, name: "Poet", icon: UIImage(named: "cat_culture_env")!, selected: false),
                    Occupation(id: 14, parentId: 28, name: "Player", icon: UIImage(named: "cat_culture_env")!, selected: false),
                    Occupation(id: 15, parentId: 28, name: "Author", icon: UIImage(named: "cat_culture_env")!, selected: false),
                    Occupation(id: 16, parentId: 28, name: "Literature", icon: UIImage(named: "cat_culture_env")!, selected: false),
                    Occupation(id: 17, parentId: 28, name: "Librarian", icon: UIImage(named: "cat_culture_env")!, selected: false),
                    Occupation(id: 18, parentId: 28, name: "Magician", icon: UIImage(named: "cat_culture_env")!, selected: false),
                    Occupation(id: 19, parentId: 28, name: "Theater director", icon: UIImage(named: "cat_culture_env")!, selected: false),
                    Occupation(id: 20, parentId: 28, name: "Entertainment Staff", icon: UIImage(named: "cat_culture_env")!, selected: false),
                    Occupation(id: 21, parentId: 28, name: "Painter", icon: UIImage(named: "cat_culture_env")!, selected: false),
                    Occupation(id: 22, parentId: 28, name: "Art critic", icon: UIImage(named: "cat_culture_env")!, selected: false),
                    Occupation(id: 23, parentId: 28, name: "Cinema and television", icon: UIImage(named: "cat_culture_env")!, selected: false),
                    Occupation(id: 24, parentId: 28, name: "Editor", icon: UIImage(named: "cat_culture_env")!, selected: false)
            ]
        }
        else {
            return [Occupation(id: 1, parentId: 28, name: "אומן", icon: UIImage(named: "cat_culture_env")!, selected: false),
                    Occupation(id: 2, parentId: 28, name: "אוצר", icon: UIImage(named: "cat_culture_env")!, selected: false),
                    Occupation(id: 3, parentId: 28, name: "ארט דירקטור/ית", icon: UIImage(named: "cat_culture_env")!, selected: false),
                    Occupation(id: 4, parentId: 28, name: "היסטוריון/ית", icon: UIImage(named: "cat_culture_env")!, selected: false),
                    Occupation(id: 5, parentId: 28, name: "זמר/ת", icon: UIImage(named: "cat_culture_env")!, selected: false),
                    Occupation(id: 6, parentId: 28, name: "תאורנ/ית", icon: UIImage(named: "cat_culture_env")!, selected: false),
                    Occupation(id: 7, parentId: 28, name: "תקליטנ/ית", icon: UIImage(named: "cat_culture_env")!, selected: false),
                    Occupation(id: 8, parentId: 28, name: "תסריטאי/ת", icon: UIImage(named: "cat_culture_env")!, selected: false),
                    Occupation(id: 9, parentId: 28, name: "מוסיקאי/ת", icon: UIImage(named: "cat_culture_env")!, selected: false),
                    Occupation(id: 10, parentId: 28, name: "מעצב/ת אירועים", icon: UIImage(named: "cat_culture_env")!, selected: false),
                    Occupation(id: 11, parentId: 28, name: "מפיק", icon: UIImage(named: "cat_culture_env")!, selected: false),
                    Occupation(id: 12, parentId: 28, name: "מפיק/ת אירועים", icon: UIImage(named: "cat_culture_env")!, selected: false),
                    Occupation(id: 13, parentId: 28, name: "משורר/ת", icon: UIImage(named: "cat_culture_env")!, selected: false),
                    Occupation(id: 14, parentId: 28, name: "נגנ/ית", icon: UIImage(named: "cat_culture_env")!, selected: false),
                    Occupation(id: 15, parentId: 28, name: "סופר/ת", icon: UIImage(named: "cat_culture_env")!, selected: false),
                    Occupation(id: 16, parentId: 28, name: "ספרות", icon: UIImage(named: "cat_culture_env")!, selected: false),
                    Occupation(id: 17, parentId: 28, name: "ספרנ/ית", icon: UIImage(named: "cat_culture_env")!, selected: false),
                    Occupation(id: 18, parentId: 28, name: "קוסם", icon: UIImage(named: "cat_culture_env")!, selected: false),
                    Occupation(id: 19, parentId: 28, name: "במאי תיאטרון", icon: UIImage(named: "cat_culture_env")!, selected: false),
                    Occupation(id: 20, parentId: 28, name: "צוות הווי ובידור", icon: UIImage(named: "cat_culture_env")!, selected: false),
                    Occupation(id: 21, parentId: 28, name: "צייר/ת", icon: UIImage(named: "cat_culture_env")!, selected: false),
                    Occupation(id: 22, parentId: 28, name: "מבקר/ת אומנות", icon: UIImage(named: "cat_culture_env")!, selected: false),
                    Occupation(id: 23, parentId: 28, name: "קולנוע וטלויזיה", icon: UIImage(named: "cat_culture_env")!, selected: false),
                    Occupation(id: 24, parentId: 28, name: "עורכ/ת", icon: UIImage(named: "cat_culture_env")!, selected: false)
            ]
        }
    }
    
    class func welfareNames() -> [Occupation] {
        if(language == "en"){
            return [Occupation(id: 1, parentId: 29, name: "Caregiver", icon: UIImage(named: "cat_welfare")!, selected: false),
                    Occupation(id: 2, parentId: 29, name: "Social Worker", icon: UIImage(named: "cat_welfare")!, selected: false),
                    Occupation(id: 3, parentId: 29, name: "Welfare worker", icon: UIImage(named: "cat_welfare")!, selected: false),
                    Occupation(id: 4, parentId: 29, name: "Occupational rehabilitation", icon: UIImage(named: "cat_welfare")!, selected: false)
            ]
        }
        else {
            return [Occupation(id: 1, parentId: 29, name: "מטפל/ת סיעודי/ת", icon: UIImage(named: "cat_welfare")!, selected: false),
                    Occupation(id: 2, parentId: 29, name: "עובד/ת סוציאלי/ת", icon: UIImage(named: "cat_welfare")!, selected: false),
                    Occupation(id: 3, parentId: 29, name: "עובד/ת רווחה וחברה", icon: UIImage(named: "cat_welfare")!, selected: false),
                    Occupation(id: 4, parentId: 29, name: "שיקום תעסוקתי", icon: UIImage(named: "cat_welfare")!, selected: false)
            ]
        }
    }
    
    class func generalManagementNames() -> [Occupation] {
        if(language == "en"){
            return [Occupation(id: 1, parentId: 30, name: "Shift Manager", icon: UIImage(named: "cat_general_management")!, selected: false),
                    Occupation(id: 2, parentId: 30, name: "Board Member", icon: UIImage(named: "cat_general_management")!, selected: false),
                    Occupation(id: 3, parentId: 30, name: "Farm Manager", icon: UIImage(named: "cat_general_management")!, selected: false),
                    Occupation(id: 4, parentId: 30, name: "Office Manager", icon: UIImage(named: "cat_general_management")!, selected: false),
                    Occupation(id: 5, parentId: 30, name: "Branch Manager", icon: UIImage(named: "cat_general_management")!, selected: false),
                    Occupation(id: 6, parentId: 30, name: "CEO", icon: UIImage(named: "cat_general_management")!, selected: false),
                    Occupation(id: 7, parentId: 30, name: "Associate Director", icon: UIImage(named: "cat_general_management")!, selected: false),
                    Occupation(id: 8, parentId: 30, name: "Team leader", icon: UIImage(named: "cat_general_management")!, selected: false),
                    Occupation(id: 9, parentId: 30, name: "Administrator", icon: UIImage(named: "cat_general_management")!, selected: false),
                    Occupation(id: 10, parentId: 30, name: "Customer portfolio manager", icon: UIImage(named: "cat_general_management")!, selected: false),
                    Occupation(id: 11, parentId: 30, name: "Customer manager", icon: UIImage(named: "cat_general_management")!, selected: false),
                    Occupation(id: 12, parentId: 30, name: "Factory manager", icon: UIImage(named: "cat_general_management")!, selected: false),
                    Occupation(id: 13, parentId: 30, name: "Human Resources Manager", icon: UIImage(named: "cat_general_management")!, selected: false),
                    Occupation(id: 14, parentId: 30, name: "Content Manager", icon: UIImage(named: "cat_general_management")!, selected: false),
                    Occupation(id: 15, parentId: 30, name: "Company Vice President", icon: UIImage(named: "cat_general_management")!, selected: false),
                    Occupation(id: 16, parentId: 30, name: "Product Manager", icon: UIImage(named: "cat_general_management")!, selected: false),
                    Occupation(id: 17, parentId: 30, name: "VP of Production", icon: UIImage(named: "cat_general_management")!, selected: false),
                    Occupation(id: 18, parentId: 30, name: "VP of Research and Development", icon: UIImage(named: "cat_general_management")!, selected: false),
                    Occupation(id: 19, parentId: 30, name: "VP of Research and Organization", icon: UIImage(named: "cat_general_management")!, selected: false),
                    Occupation(id: 20, parentId: 30, name: "VP of Development", icon: UIImage(named: "cat_general_management")!, selected: false),
                    Occupation(id: 21, parentId: 30, name: "VP of human resources", icon: UIImage(named: "cat_general_management")!, selected: false),
                    Occupation(id: 22, parentId: 30, name: "VP of Service", icon: UIImage(named: "cat_general_management")!, selected: false),
                    Occupation(id: 23, parentId: 30, name: "VP of Project Planning and Management", icon: UIImage(named: "cat_general_management")!, selected: false),
                    Occupation(id: 24, parentId: 30, name: "VP of Operating", icon: UIImage(named: "cat_general_management")!, selected: false),
                    Occupation(id: 25, parentId: 30, name: "Industry and Management", icon: UIImage(named: "cat_general_management")!, selected: false),
                    Occupation(id: 26, parentId: 30, name: "Industry Development Manager", icon: UIImage(named: "cat_general_management")!, selected: false),
                    Occupation(id: 27, parentId: 30, name: "Business Development Manager", icon: UIImage(named: "cat_general_management")!, selected: false)
            ]
        }
        else {
            return [Occupation(id: 1, parentId: 30, name: "אחראי משמרת", icon: UIImage(named: "cat_general_management")!, selected: false),
                    Occupation(id: 2, parentId: 30, name: "חבר דירקטוריון", icon: UIImage(named: "cat_general_management")!, selected: false),
                    Occupation(id: 3, parentId: 30, name: "מנהל/ת משק", icon: UIImage(named: "cat_general_management")!, selected: false),
                    Occupation(id: 4, parentId: 30, name: "מנהל/ת משרד", icon: UIImage(named: "cat_general_management")!, selected: false),
                    Occupation(id: 5, parentId: 30, name: "מנהל/ת סניף", icon: UIImage(named: "cat_general_management")!, selected: false),
                    Occupation(id: 6, parentId: 30, name: "מנכ\"ל/ית", icon: UIImage(named: "cat_general_management")!, selected: false),
                    Occupation(id: 7, parentId: 30, name: "מנהל/ת עמותה", icon: UIImage(named: "cat_general_management")!, selected: false),
                    Occupation(id: 8, parentId: 30, name: "מנהל צוות", icon: UIImage(named: "cat_general_management")!, selected: false),
                    Occupation(id: 9, parentId: 30, name: "מנהל רשת", icon: UIImage(named: "cat_general_management")!, selected: false),
                    Occupation(id: 10, parentId: 30, name: "מנהל תיקי לקוחות", icon: UIImage(named: "cat_general_management")!, selected: false),
                    Occupation(id: 11, parentId: 30, name: "מנהל/ת לקוחות", icon: UIImage(named: "cat_general_management")!, selected: false),
                    Occupation(id: 12, parentId: 30, name: "מנהל/ת מפעל", icon: UIImage(named: "cat_general_management")!, selected: false),
                    Occupation(id: 13, parentId: 30, name: "מנהל/ת משאבי אנוש", icon: UIImage(named: "cat_general_management")!, selected: false),
                    Occupation(id: 14, parentId: 30, name: "מנהל/ת תוכן", icon: UIImage(named: "cat_general_management")!, selected: false),
                    Occupation(id: 15, parentId: 30, name: "סמנכ\"ל חברה", icon: UIImage(named: "cat_general_management")!, selected: false),
                    Occupation(id: 16, parentId: 30, name: "מנהל/ת מוצר", icon: UIImage(named: "cat_general_management")!, selected: false),
                    Occupation(id: 17, parentId: 30, name: "סמנכ\"ל ייצור", icon: UIImage(named: "cat_general_management")!, selected: false),
                    Occupation(id: 18, parentId: 30, name: "סמנכ\"ל מחקר ופיתוח", icon: UIImage(named: "cat_general_management")!, selected: false),
                    Occupation(id: 19, parentId: 30, name: "סמנכ\"ל מנהל וארגון", icon: UIImage(named: "cat_general_management")!, selected: false),
                    Occupation(id: 20, parentId: 30, name: "סמנכ\"ל פיתוח", icon: UIImage(named: "cat_general_management")!, selected: false),
                    Occupation(id: 21, parentId: 30, name: "סמנכ\"ל משאבי אנוש", icon: UIImage(named: "cat_general_management")!, selected: false),
                    Occupation(id: 22, parentId: 30, name: "סמנכ\"ל שירות", icon: UIImage(named: "cat_general_management")!, selected: false),
                    Occupation(id: 23, parentId: 30, name: "סמנכ\"ל תכנון וניהול פרויקטים", icon: UIImage(named: "cat_general_management")!, selected: false),
                    Occupation(id: 24, parentId: 30, name: "סמנכ\"ל תפעול", icon: UIImage(named: "cat_general_management")!, selected: false),
                    Occupation(id: 25, parentId: 30, name: "תעשייה וניהול", icon: UIImage(named: "cat_general_management")!, selected: false),
                    Occupation(id: 26, parentId: 30, name: "מנהל/ת פיתוח בתעשיה", icon: UIImage(named: "cat_general_management")!, selected: false),
                    Occupation(id: 27, parentId: 30, name: "מנהל/ת פיתוח עסקי", icon: UIImage(named: "cat_general_management")!, selected: false)
            ]
        }
    }
    
    class func salesNames() -> [Occupation] {
        if(language == "en"){
            return [Occupation(id: 1, parentId: 31, name: "Online", icon: UIImage(named: "cat_sales_advert")!, selected: false),
                    Occupation(id: 2, parentId: 31, name: "Broker", icon: UIImage(named: "cat_sales_advert")!, selected: false),
                    Occupation(id: 3, parentId: 31, name: "Online sales", icon: UIImage(named: "cat_sales_advert")!, selected: false),
                    Occupation(id: 4, parentId: 31, name: "Telephone sales", icon: UIImage(named: "cat_sales_advert")!, selected: false),
                    Occupation(id: 5, parentId: 31, name: "Frontal sales", icon: UIImage(named: "cat_sales_advert")!, selected: false),
                    Occupation(id: 6, parentId: 31, name: "Brand", icon: UIImage(named: "cat_sales_advert")!, selected: false),
                    Occupation(id: 7, parentId: 31, name: "Sales Manager", icon: UIImage(named: "cat_sales_advert")!, selected: false),
                    Occupation(id: 8, parentId: 31, name: "Trade Manager", icon: UIImage(named: "cat_sales_advert")!, selected: false),
                    Occupation(id: 9, parentId: 31, name: "Sales promotion", icon: UIImage(named: "cat_sales_advert")!, selected: false),
                    Occupation(id: 10, parentId: 31, name: "Vice President of Sales", icon: UIImage(named: "cat_sales_advert")!, selected: false),
                    Occupation(id: 11, parentId: 31, name: "Sales agent", icon: UIImage(named: "cat_sales_advert")!, selected: false),
                    Occupation(id: 12, parentId: 31, name: "Sales Coordinator", icon: UIImage(named: "cat_sales_advert")!, selected: false),
                    Occupation(id: 13, parentId: 31, name: "Marketing", icon: UIImage(named: "cat_sales_advert")!, selected: false),
                    Occupation(id: 14, parentId: 31, name: "Creative", icon: UIImage(named: "cat_sales_advert")!, selected: false),
                    Occupation(id: 15, parentId: 31, name: "Copywriting", icon: UIImage(named: "cat_sales_advert")!, selected: false),
                    Occupation(id: 16, parentId: 31, name: "Vice President of Marketing", icon: UIImage(named: "cat_sales_advert")!, selected: false),
                    Occupation(id: 17, parentId: 31, name: "Advertising Manager", icon: UIImage(named: "cat_sales_advert")!, selected: false),
                    Occupation(id: 18, parentId: 31, name: "Marketing Manager", icon: UIImage(named: "cat_sales_advert")!, selected: false)
            ]
        }
        else {
            return [Occupation(id: 1, parentId: 31, name: "און ליין", icon: UIImage(named: "cat_sales_advert")!, selected: false),
                    Occupation(id: 2, parentId: 31, name: "ברוקר/ית", icon: UIImage(named: "cat_sales_advert")!, selected: false),
                    Occupation(id: 3, parentId: 31, name: "מכירות באינטרנט", icon: UIImage(named: "cat_sales_advert")!, selected: false),
                    Occupation(id: 4, parentId: 31, name: "מכירות טלפוני", icon: UIImage(named: "cat_sales_advert")!, selected: false),
                    Occupation(id: 5, parentId: 31, name: "מכירות פרונטלי", icon: UIImage(named: "cat_sales_advert")!, selected: false),
                    Occupation(id: 6, parentId: 31, name: "מיתוג", icon: UIImage(named: "cat_sales_advert")!, selected: false),
                    Occupation(id: 7, parentId: 31, name: "מנהל מכירות", icon: UIImage(named: "cat_sales_advert")!, selected: false),
                    Occupation(id: 8, parentId: 31, name: "מנהל/ת סחר", icon: UIImage(named: "cat_sales_advert")!, selected: false),
                    Occupation(id: 9, parentId: 31, name: "קידום מכירות", icon: UIImage(named: "cat_sales_advert")!, selected: false),
                    Occupation(id: 10, parentId: 31, name: "סמנכ\"ל מכירות", icon: UIImage(named: "cat_sales_advert")!, selected: false),
                    Occupation(id: 11, parentId: 31, name: "סוכנ/ת מכירות", icon: UIImage(named: "cat_sales_advert")!, selected: false),
                    Occupation(id: 12, parentId: 31, name: "מתאמ/ת מכירות", icon: UIImage(named: "cat_sales_advert")!, selected: false),
                    Occupation(id: 13, parentId: 31, name: "שיווק", icon: UIImage(named: "cat_sales_advert")!, selected: false),
                    Occupation(id: 14, parentId: 31, name: "קריאטיב", icon: UIImage(named: "cat_sales_advert")!, selected: false),
                    Occupation(id: 15, parentId: 31, name: "קופירייטינג", icon: UIImage(named: "cat_sales_advert")!, selected: false),
                    Occupation(id: 16, parentId: 31, name: "סמנכ\"ל שיווק", icon: UIImage(named: "cat_sales_advert")!, selected: false),
                    Occupation(id: 17, parentId: 31, name: "מנהל/ת פרסום", icon: UIImage(named: "cat_sales_advert")!, selected: false),
                    Occupation(id: 18, parentId: 31, name: "מנהל שיווק", icon: UIImage(named: "cat_sales_advert")!, selected: false)
            ]
        }
       }
    
    class func religionNames() -> [Occupation] {
        if(language == "en"){
            return [Occupation(id: 1, parentId: 32, name: "Cantorship", icon: UIImage(named: "cat_religion")!, selected: false),
                    Occupation(id: 2, parentId: 32, name: "Kosher overseer", icon: UIImage(named: "cat_religion")!, selected: false),
                    Occupation(id: 3, parentId: 32, name: "Religious worker", icon: UIImage(named: "cat_religion")!, selected: false)
            ]
        }
        else {
            return [Occupation(id: 1, parentId: 32, name: "חזנות", icon: UIImage(named: "cat_religion")!, selected: false),
                    Occupation(id: 2, parentId: 32, name: "משגיח/ת כשרות", icon: UIImage(named: "cat_religion")!, selected: false),
                    Occupation(id: 3, parentId: 32, name: "עובד/ת דת", icon: UIImage(named: "cat_religion")!, selected: false)
            ]
        }
    }
    
    class func exactScienceNames() -> [Occupation] {
        if(language == "en"){
            return [Occupation(id: 1, parentId: 33, name: "Control equipment", icon: UIImage(named: "cat_exact_sciences")!, selected: false),
                    Occupation(id: 2, parentId: 33, name: "Mathematician", icon: UIImage(named: "cat_exact_sciences")!, selected: false),
                    Occupation(id: 3, parentId: 33, name: "Statistician", icon: UIImage(named: "cat_exact_sciences")!, selected: false),
                    Occupation(id: 4, parentId: 33, name: "Physicist", icon: UIImage(named: "cat_exact_sciences")!, selected: false),
                    Occupation(id: 5, parentId: 33, name: "Organization and Methods", icon: UIImage(named: "cat_exact_sciences")!, selected: false)
            ]
        }
        else {
            return [Occupation(id: 1, parentId: 33, name: "מכשור בקרה", icon: UIImage(named: "cat_exact_sciences")!, selected: false),
                    Occupation(id: 2, parentId: 33, name: "מתמטיקאי/ת", icon: UIImage(named: "cat_exact_sciences")!, selected: false),
                    Occupation(id: 3, parentId: 33, name: "סטטיסטיקאי/ת", icon: UIImage(named: "cat_exact_sciences")!, selected: false),
                    Occupation(id: 4, parentId: 33, name: "פיזיקאי/ת", icon: UIImage(named: "cat_exact_sciences")!, selected: false),
                    Occupation(id: 5, parentId: 33, name: "ארגון ושיטות", icon: UIImage(named: "cat_exact_sciences")!, selected: false)
            ]
        }
    }
    
    class func governmentalNames() -> [Occupation] {
        if(language == "en"){
            return [Occupation(id: 1, parentId: 34, name: "Diplomat", icon: UIImage(named: "cat_governmental")!, selected: false),
                    Occupation(id: 2, parentId: 34, name: "Political Science / Government", icon: UIImage(named: "cat_governmental")!, selected: false),
                    Occupation(id: 3, parentId: 34, name: "Public Inquiries", icon: UIImage(named: "cat_governmental")!, selected: false),
                    Occupation(id: 4, parentId: 34, name: "Execution", icon: UIImage(named: "cat_governmental")!, selected: false),
                    Occupation(id: 5, parentId: 34, name: "Collector", icon: UIImage(named: "cat_governmental")!, selected: false)
            ]
        }
        else {
            return [Occupation(id: 1, parentId: 34, name: "דיפלומט/ית", icon: UIImage(named: "cat_governmental")!, selected: false),
                    Occupation(id: 2, parentId: 34, name: "מדעי המדינה/ ממשל", icon: UIImage(named: "cat_governmental")!, selected: false),
                    Occupation(id: 3, parentId: 34, name: "פניות הציבור", icon: UIImage(named: "cat_governmental")!, selected: false),
                    Occupation(id: 4, parentId: 34, name: "הוצאה לפועל", icon: UIImage(named: "cat_governmental")!, selected: false),
                    Occupation(id: 5, parentId: 34, name: "נציג/ת גביה", icon: UIImage(named: "cat_governmental")!, selected: false)
            ]
        }
    }
    
    class func shopNames() -> [Occupation] {
        if(language == "en"){
            return [Occupation(id: 1, parentId: 35, name: "Packer", icon: UIImage(named: "cat_shop")!, selected: false),
                    Occupation(id: 2, parentId: 35, name: "Cashier", icon: UIImage(named: "cat_shop")!, selected: false),
                    Occupation(id: 3, parentId: 35, name: "Store Manager", icon: UIImage(named: "cat_shop")!, selected: false),
                    Occupation(id: 4, parentId: 35, name: "Seller in a Store", icon: UIImage(named: "cat_shop")!, selected: false),
                    Occupation(id: 5, parentId: 35, name: "Greengrocer", icon: UIImage(named: "cat_shop")!, selected: false)
            ]
        }
        else {
            return [Occupation(id: 1, parentId: 35, name: "אורז", icon: UIImage(named: "cat_shop")!, selected: false),
                    Occupation(id: 2, parentId: 35, name: "קופאי/ת", icon: UIImage(named: "cat_shop")!, selected: false),
                    Occupation(id: 3, parentId: 35, name: "מנהל/ת חנות", icon: UIImage(named: "cat_shop")!, selected: false),
                    Occupation(id: 4, parentId: 35, name: "מוכר/ת בחנות", icon: UIImage(named: "cat_shop")!, selected: false),
                    Occupation(id: 5, parentId: 35, name: "ירקנ/ית", icon: UIImage(named: "cat_shop")!, selected: false)
            ]
        }
    }
    
    class func foodAndPharmaNames() -> [Occupation] {
        if(language == "en"){
            return [Occupation(id: 1, parentId: 36, name: "Gastronomy", icon: UIImage(named: "cat_food_pharmacy")!, selected: false),
                    Occupation(id: 2, parentId: 36, name: "Winemaker", icon: UIImage(named: "cat_food_pharmacy")!, selected: false),
                    Occupation(id: 3, parentId: 36, name: "Baking", icon: UIImage(named: "cat_food_pharmacy")!, selected: false),
                    Occupation(id: 4, parentId: 36, name: "Food", icon: UIImage(named: "cat_food_pharmacy")!, selected: false),
                    Occupation(id: 5, parentId: 36, name: "Catering", icon: UIImage(named: "cat_food_pharmacy")!, selected: false),
                    Occupation(id: 6, parentId: 36, name: "Confectionery", icon: UIImage(named: "cat_food_pharmacy")!, selected: false),
                    Occupation(id: 7, parentId: 36, name: "Nutritionist", icon: UIImage(named: "cat_food_pharmacy")!, selected: false),
                    Occupation(id: 8, parentId: 36, name: "Naturopath", icon: UIImage(named: "cat_food_pharmacy")!, selected: false)
            ]
        }
        else {
            return [Occupation(id: 1, parentId: 36, name: "גסטרונומיה", icon: UIImage(named: "cat_food_pharmacy")!, selected: false),
                    Occupation(id: 2, parentId: 36, name: "ייננ/ית", icon: UIImage(named: "cat_food_pharmacy")!, selected: false),
                    Occupation(id: 3, parentId: 36, name: "אפיה", icon: UIImage(named: "cat_food_pharmacy")!, selected: false),
                    Occupation(id: 4, parentId: 36, name: "מזון", icon: UIImage(named: "cat_food_pharmacy")!, selected: false),
                    Occupation(id: 5, parentId: 36, name: "קייטרינג", icon: UIImage(named: "cat_food_pharmacy")!, selected: false),
                    Occupation(id: 6, parentId: 36, name: "קונדיטוריה", icon: UIImage(named: "cat_food_pharmacy")!, selected: false),
                    Occupation(id: 7, parentId: 36, name: "תזונאי/ת", icon: UIImage(named: "cat_food_pharmacy")!, selected: false),
                    Occupation(id: 8, parentId: 36, name: "נטורופת/ית", icon: UIImage(named: "cat_food_pharmacy")!, selected: false)
            ]
        }
    }
    
    class func labNames() -> [Occupation] {
        if(language == "en"){
            return [Occupation(id: 1, parentId: 37, name: "Lab manager", icon: UIImage(named: "cat_lab_research")!, selected: false),
                    Occupation(id: 2, parentId: 37, name: "Lab worker", icon: UIImage(named: "cat_lab_research")!, selected: false),
                    Occupation(id: 3, parentId: 37, name: "Research assistant", icon: UIImage(named: "cat_lab_research")!, selected: false),
                    Occupation(id: 4, parentId: 37, name: "Medicines", icon: UIImage(named: "cat_lab_research")!, selected: false),
                    Occupation(id: 5, parentId: 37, name: "Chemistry", icon: UIImage(named: "cat_lab_research")!, selected: false),
                    Occupation(id: 6, parentId: 37, name: "Clinical researcher", icon: UIImage(named: "cat_lab_research")!, selected: false)
            ]
        }
        else {
            return [Occupation(id: 1, parentId: 37, name: "מנהל/ת מעבדה", icon: UIImage(named: "cat_lab_research")!, selected: false),
                    Occupation(id: 2, parentId: 37, name: "עובד/ת מעבדה", icon: UIImage(named: "cat_lab_research")!, selected: false),
                    Occupation(id: 3, parentId: 37, name: "עוזר/ת מחקר", icon: UIImage(named: "cat_lab_research")!, selected: false),
                    Occupation(id: 4, parentId: 37, name: "תרופות", icon: UIImage(named: "cat_lab_research")!, selected: false),
                    Occupation(id: 5, parentId: 37, name: "כימיה", icon: UIImage(named: "cat_lab_research")!, selected: false),
                    Occupation(id: 6, parentId: 37, name: "חוקר קליני", icon: UIImage(named: "cat_lab_research")!, selected: false)
            ]
        }
    }
    
    
      //MORE OCCUPATIONS
      
      class func moreRepairNames() -> [Occupation] {
        if(language == "en"){
            return [
                Occupation(id: 1, parentId: 38, name: "Smith", icon: UIImage(named: "cat_creation")!, selected: false),
                Occupation(id: 2, parentId: 38, name: "Bicycle technician", icon: UIImage(named: "cat_creation")!, selected: false),
                Occupation(id: 3, parentId: 38, name: "Printers / Copiers technician", icon: UIImage(named: "cat_creation")!, selected: false),
                Occupation(id: 4, parentId: 38, name: "Shoemaker", icon: UIImage(named: "cat_creation")!, selected: false),
                Occupation(id: 5, parentId: 38, name: "Watchmaker", icon: UIImage(named: "cat_creation")!, selected: false),
                Occupation(id: 6, parentId: 38, name: "Flower arragement", icon: UIImage(named: "cat_creation")!, selected: false),
                Occupation(id: 7, parentId: 38, name: "Upholsterer", icon: UIImage(named: "cat_creation")!, selected: false),
                Occupation(id: 8, parentId: 38, name: "Printer", icon: UIImage(named: "cat_creation")!, selected: false)]
        }
        else {
            return [
            Occupation(id: 1, parentId: 38, name: "נפח/ית", icon: UIImage(named: "cat_creation")!, selected: false),
            Occupation(id: 2, parentId: 38, name: "טכנאי/ת אופניים", icon: UIImage(named: "cat_creation")!, selected: false),
            Occupation(id: 3, parentId: 38, name: "טכנאי/ת מדפסות/ מכונות צילום", icon: UIImage(named: "cat_creation")!, selected: false),
            Occupation(id: 4, parentId: 38, name: "סנדלר/ית", icon: UIImage(named: "cat_creation")!, selected: false),
            Occupation(id: 5, parentId: 38, name: "שען", icon: UIImage(named: "cat_creation")!, selected: false),
            Occupation(id: 6, parentId: 38, name: "שזירת פרחים", icon: UIImage(named: "cat_creation")!, selected: false),
            Occupation(id: 7, parentId: 38, name: "ריפוד", icon: UIImage(named: "cat_creation")!, selected: false),
            Occupation(id: 8, parentId: 38, name: "דפס/ית", icon: UIImage(named: "cat_creation")!, selected: false)]
        }
      }
      
      class func moreComputerNames() -> [Occupation] {
        if(language == "en"){
            return [Occupation(id: 1, parentId: 39, name: "Patent Attorney", icon: UIImage(named: "cat_computer")!, selected: false),
                    Occupation(id: 2, parentId: 39, name: "Metalworking", icon: UIImage(named: "cat_computer")!, selected: false),
                    Occupation(id: 3, parentId: 39, name: "Vice President of information", icon: UIImage(named: "cat_computer")!, selected: false),
                    Occupation(id: 4, parentId: 39, name: "Vice President of Technology", icon: UIImage(named: "cat_computer")!, selected: false),
                    Occupation(id: 5, parentId: 39, name: "Integrator", icon: UIImage(named: "cat_computer")!, selected: false),
                    Occupation(id: 6, parentId: 39, name: "Infrastructure development", icon: UIImage(named: "cat_computer")!, selected: false),
                    Occupation(id: 7, parentId: 39, name: "Hardware Checker", icon: UIImage(named: "cat_computer")!, selected: false),
                    Occupation(id: 8, parentId: 39, name: "Project Manager in Computing", icon: UIImage(named: "cat_computer")!, selected: false),
                    Occupation(id: 9, parentId: 39, name: "Ecommerce", icon: UIImage(named: "cat_computer")!, selected: false),
                    Occupation(id: 10, parentId: 39, name: "Systems Analyst", icon: UIImage(named: "cat_computer")!, selected: false),
                    Occupation(id: 11, parentId: 39, name: "Director of software testing team", icon: UIImage(named: "cat_computer")!, selected: false)]
        }
        else {
            return [Occupation(id: 1, parentId: 39, name: "עורכ/ת פטנטים", icon: UIImage(named: "cat_computer")!, selected: false),
                    Occupation(id: 2, parentId: 39, name: "עיבוד שבבי", icon: UIImage(named: "cat_computer")!, selected: false),
                    Occupation(id: 3, parentId: 39, name: "סמנכ\"ל מערכות מידע", icon: UIImage(named: "cat_computer")!, selected: false),
                    Occupation(id: 4, parentId: 39, name: "סמנכ\"ל טכנולוגיה", icon: UIImage(named: "cat_computer")!, selected: false),
                    Occupation(id: 5, parentId: 39, name: "אינטגרטור", icon: UIImage(named: "cat_computer")!, selected: false),
                    Occupation(id: 6, parentId: 39, name: "פיתוח תשתיות", icon: UIImage(named: "cat_computer")!, selected: false),
                    Occupation(id: 7, parentId: 39, name: "בודק חומרה", icon: UIImage(named: "cat_computer")!, selected: false),
                    Occupation(id: 8, parentId: 39, name: "מנהל/ת פרויקטים במחשוב", icon: UIImage(named: "cat_computer")!, selected: false),
                    Occupation(id: 9, parentId: 39, name: "מסחר אלקטרוני", icon: UIImage(named: "cat_computer")!, selected: false),
                    Occupation(id: 10, parentId: 39, name: "מנתח מערכות", icon: UIImage(named: "cat_computer")!, selected: false),
                    Occupation(id: 11, parentId: 39, name: "מנהל/ת צוות בדיקת תכנה", icon: UIImage(named: "cat_computer")!, selected: false)]
        }
      }
      
      class func moreSecurityNames() -> [Occupation]{
        if(language == "en"){
            return [Occupation(id: 1, parentId: 40, name: "Security Checker", icon: UIImage(named: "cat_security")!, selected: false),
                    Occupation(id: 2, parentId: 40, name: "Health and Safety", icon: UIImage(named: "cat_security")!, selected: false),
                    Occupation(id: 3, parentId: 40, name: "Vice President of Data Security", icon: UIImage(named: "cat_security")!, selected: false),
                    Occupation(id: 4, parentId: 40, name: "Traffic Safety officer", icon: UIImage(named: "cat_security")!, selected: false),
                    Occupation(id: 5, parentId: 40, name: "Criminologist", icon: UIImage(named: "cat_security")!, selected: false)]
        }
        else {
            return [Occupation(id: 1, parentId: 40, name: "בודק ביטחוני", icon: UIImage(named: "cat_security")!, selected: false),
                    Occupation(id: 2, parentId: 40, name: "בטיחות וגיהות", icon: UIImage(named: "cat_security")!, selected: false),
                    Occupation(id: 3, parentId: 40, name: "סמנכ\"ל אבטחת מידע", icon: UIImage(named: "cat_security")!, selected: false),
                    Occupation(id: 4, parentId: 40, name: "קצינ/ת בטיחות בתעבורה", icon: UIImage(named: "cat_security")!, selected: false),
                    Occupation(id: 5, parentId: 40, name: "קרימינולוג/ית", icon: UIImage(named: "cat_security")!, selected: false)]
        }
      }
      
      class func moreTeachingNames() -> [Occupation]{
        if(language == "en"){
            return [
                Occupation(id: 1, parentId: 41, name: "Pedagogical consultant", icon: UIImage(named: "cat_teaching")!, selected: false),
                Occupation(id: 2, parentId: 41, name: "Residence Manager", icon: UIImage(named: "cat_teaching")!, selected: false),
                Occupation(id: 3, parentId: 41, name: "Oversees exams", icon: UIImage(named: "cat_teaching")!, selected: false),
                Occupation(id: 4, parentId: 41, name: "Community Manager", icon: UIImage(named: "cat_teaching")!, selected: false),
                Occupation(id: 5, parentId: 41, name: "Coacher", icon: UIImage(named: "cat_teaching")!, selected: false),
                Occupation(id: 6, parentId: 41, name: "Training Development", icon: UIImage(named: "cat_teaching")!, selected: false),
                Occupation(id: 7, parentId: 41, name: "Educational counseling", icon: UIImage(named: "cat_teaching")!, selected: false),
                Occupation(id: 8, parentId: 41, name: "Nanny", icon: UIImage(named: "cat_teaching")!, selected: false),
                Occupation(id: 9, parentId: 41, name: "Director of educational institution", icon: UIImage(named: "cat_teaching")!, selected: false)]
        }
        else {
            return [
                Occupation(id: 1, parentId: 41, name: "יועצ/ת פדגוגי/ת", icon: UIImage(named: "cat_teaching")!, selected: false),
                Occupation(id: 2, parentId: 41, name: "מנהל/ת מעון", icon: UIImage(named: "cat_teaching")!, selected: false),
                Occupation(id: 3, parentId: 41, name: "משגיח/ת בחינות", icon: UIImage(named: "cat_teaching")!, selected: false),
                Occupation(id: 4, parentId: 41, name: "מנהל/ת קהילה", icon: UIImage(named: "cat_teaching")!, selected: false),
                Occupation(id: 5, parentId: 41, name: "קואצ'ר", icon: UIImage(named: "cat_teaching")!, selected: false),
                Occupation(id: 6, parentId: 41, name: "פיתוח הדרכה", icon: UIImage(named: "cat_teaching")!, selected: false),
                Occupation(id: 7, parentId: 41, name: "יעוץ חינוכי", icon: UIImage(named: "cat_teaching")!, selected: false),
                Occupation(id: 8, parentId: 41, name: "מטפל/ת בילדים", icon: UIImage(named: "cat_teaching")!, selected: false),
                Occupation(id: 9, parentId: 41, name: "מנהל מוסד חינוכי", icon: UIImage(named: "cat_teaching")!, selected: false)]
        }
      }
      
      class func moreCommunicationNames() -> [Occupation]{
        if(language == "en"){
            return [
                Occupation(id: 1, parentId: 42, name: "Video photographer", icon: UIImage(named: "cat_marketing")!, selected: false),
                Occupation(id: 2, parentId: 42, name: "Stills photographer", icon: UIImage(named: "cat_marketing")!, selected: false),
                Occupation(id: 3, parentId: 42, name: "Sound", icon: UIImage(named: "cat_marketing")!, selected: false),
                Occupation(id: 4, parentId: 42, name: "Crane", icon: UIImage(named: "cat_marketing")!, selected: false),
                Occupation(id: 5, parentId: 42, name: "Interactive communication", icon: UIImage(named: "cat_marketing")!, selected: false),
                Occupation(id: 6, parentId: 42, name: "Marketing Manager", icon: UIImage(named: "cat_marketing")!, selected: false),
                Occupation(id: 7, parentId: 42, name: "Translating", icon: UIImage(named: "cat_marketing")!, selected: false),
                Occupation(id: 8, parentId: 42, name: "Publishing", icon: UIImage(named: "cat_marketing")!, selected: false),
                Occupation(id: 9, parentId: 42, name: "Advertising consultant", icon: UIImage(named: "cat_marketing")!, selected: false),
                Occupation(id: 10, parentId: 42, name: "TV host", icon: UIImage(named: "cat_marketing")!, selected: false),
                Occupation(id: 11, parentId: 42, name: "Interviewer", icon: UIImage(named: "cat_marketing")!, selected: false),
                Occupation(id: 12, parentId: 42, name: "Social Network Manager", icon: UIImage(named: "cat_marketing")!, selected: false),
                Occupation(id: 13, parentId: 42, name: "Extra", icon: UIImage(named: "cat_marketing")!, selected: false),
                Occupation(id: 14, parentId: 42, name: "Cellular", icon: UIImage(named: "cat_marketing")!, selected: false),
                Occupation(id: 15, parentId: 42, name: "Video Editor", icon: UIImage(named: "cat_marketing")!, selected: false)]
        }
        else {
            return [
                Occupation(id: 1, parentId: 42, name: "צלם וידאו", icon: UIImage(named: "cat_marketing")!, selected: false),
                Occupation(id: 2, parentId: 42, name: "צלם סטילס", icon: UIImage(named: "cat_marketing")!, selected: false),
                Occupation(id: 3, parentId: 42, name: "קול וסאונד", icon: UIImage(named: "cat_marketing")!, selected: false),
                Occupation(id: 4, parentId: 42, name: "קריינ/ית", icon: UIImage(named: "cat_marketing")!, selected: false),
                Occupation(id: 5, parentId: 42, name: "תקשורת אינטראקטיבית", icon: UIImage(named: "cat_marketing")!, selected: false),
                Occupation(id: 6, parentId: 42, name: "מנהל/ת תחום בשיווק", icon: UIImage(named: "cat_marketing")!, selected: false),
                Occupation(id: 7, parentId: 42, name: "מתרגמ/ת", icon: UIImage(named: "cat_marketing")!, selected: false),
                Occupation(id: 8, parentId: 42, name: "הוצאה לאור", icon: UIImage(named: "cat_marketing")!, selected: false),
                Occupation(id: 9, parentId: 42, name: "יועצ/ת פרסום", icon: UIImage(named: "cat_marketing")!, selected: false),
                Occupation(id: 10, parentId: 42, name: "מנחה טלוויזיה", icon: UIImage(named: "cat_marketing")!, selected: false),
                Occupation(id: 11, parentId: 42, name: "מראיינ/ת", icon: UIImage(named: "cat_marketing")!, selected: false),
                Occupation(id: 12, parentId: 42, name: "מנהל/ת רשתות חברתיות", icon: UIImage(named: "cat_marketing")!, selected: false),
                Occupation(id: 13, parentId: 42, name: "ניצב/ת", icon: UIImage(named: "cat_marketing")!, selected: false),
                Occupation(id: 14, parentId: 42, name: "סלולר", icon: UIImage(named: "cat_marketing")!, selected: false),
                Occupation(id: 15, parentId: 42, name: "עורכ/ת וידאו", icon: UIImage(named: "cat_marketing")!, selected: false)]
        }
      }
      
      class func moreMedicineNames() -> [Occupation]{
        if(language == "en"){
            return [
                Occupation(id: 1, parentId: 43, name: "Speech therapist", icon: UIImage(named: "cat_medicine")!, selected: false),
                Occupation(id: 2, parentId: 43, name: "Delivery", icon: UIImage(named: "cat_medicine")!, selected: false),
                Occupation(id: 3, parentId: 43, name: "Masseur", icon: UIImage(named: "cat_medicine")!, selected: false),
                Occupation(id: 4, parentId: 43, name: "Geneticist", icon: UIImage(named: "cat_medicine")!, selected: false),
                Occupation(id: 5, parentId: 43, name: "Dental technician", icon: UIImage(named: "cat_medicine")!, selected: false),
                Occupation(id: 6, parentId: 43, name: "X-ray technician", icon: UIImage(named: "cat_medicine")!, selected: false),
                Occupation(id: 7, parentId: 43, name: "Medical Clown", icon: UIImage(named: "cat_medicine")!, selected: false),
                Occupation(id: 8, parentId: 43, name: "Rehabilitation instructor", icon: UIImage(named: "cat_medicine")!, selected: false),
                Occupation(id: 9, parentId: 43, name: "Project Manager in Medicine", icon: UIImage(named: "cat_medicine")!, selected: false),
                Occupation(id: 10, parentId: 43, name: "Dental hygienist", icon: UIImage(named: "cat_medicine")!, selected: false),
                Occupation(id: 11, parentId: 43, name: "Dental assistant", icon: UIImage(named: "cat_medicine")!, selected: false),
                Occupation(id: 12, parentId: 43, name: "Acupuncture", icon: UIImage(named: "cat_medicine")!, selected: false)]
        }
        else {
            return [
                Occupation(id: 1, parentId: 43, name: "קלינאי/ת תקשורת", icon: UIImage(named: "cat_medicine")!, selected: false),
                Occupation(id: 2, parentId: 43, name: "דולה", icon: UIImage(named: "cat_medicine")!, selected: false),
                Occupation(id: 3, parentId: 43, name: "מעסה", icon: UIImage(named: "cat_medicine")!, selected: false),
                Occupation(id: 4, parentId: 43, name: "גנטיקאי/ת", icon: UIImage(named: "cat_medicine")!, selected: false),
                Occupation(id: 5, parentId: 43, name: "טכנאי שיניים", icon: UIImage(named: "cat_medicine")!, selected: false),
                Occupation(id: 6, parentId: 43, name: "טכנאי/ת רנטגן", icon: UIImage(named: "cat_medicine")!, selected: false),
                Occupation(id: 7, parentId: 43, name: "ליצנ/ית רפואי/ת", icon: UIImage(named: "cat_medicine")!, selected: false),
                Occupation(id: 8, parentId: 43, name: "מדריכ/ה שיקומי/ת", icon: UIImage(named: "cat_medicine")!, selected: false),
                Occupation(id: 9, parentId: 43, name: "מנהל/ת פרויקטים ברפואה", icon: UIImage(named: "cat_medicine")!, selected: false),
                Occupation(id: 10, parentId: 43, name: "שיננית", icon: UIImage(named: "cat_medicine")!, selected: false),
                Occupation(id: 11, parentId: 43, name: "סייעת רופא שיניים", icon: UIImage(named: "cat_medicine")!, selected: false),
                Occupation(id: 12, parentId: 43, name: "דיקור סיני", icon: UIImage(named: "cat_medicine")!, selected: false)]
        }
      }
      
      class func moreEngineerNames() -> [Occupation]{
        if(language == "en"){
            return [
                Occupation(id: 1, parentId: 44, name: "Nuclear Engineering", icon: UIImage(named: "cat_engineer")!, selected: false),
                Occupation(id: 2, parentId: 44, name: "Vice President of Engineering", icon: UIImage(named: "cat_engineer")!, selected: false)]
        }
        else {
            return [
                Occupation(id: 1, parentId: 44, name: "הנדסת גרעין", icon: UIImage(named: "cat_engineer")!, selected: false),
                Occupation(id: 2, parentId: 44, name: "סמנכ\"ל הנדסה", icon: UIImage(named: "cat_engineer")!, selected: false)]
        }
      }
      
      class func moreFinanceNames() -> [Occupation]{
        if(language == "en"){
            return [
                Occupation(id: 1, parentId: 45, name: "Analyst", icon: UIImage(named: "cat_finance")!, selected: false),
                Occupation(id: 2, parentId: 45, name: "Economic Advisor", icon: UIImage(named: "cat_finance")!, selected: false),
                Occupation(id: 3, parentId: 45, name: "Risk Manager", icon: UIImage(named: "cat_finance")!, selected: false),
                Occupation(id: 4, parentId: 45, name: "Budgetary", icon: UIImage(named: "cat_finance")!, selected: false),
                Occupation(id: 5, parentId: 45, name: "Chief Financial Officer", icon: UIImage(named: "cat_finance")!, selected: false),
                Occupation(id: 6, parentId: 45, name: "Specializing in Accounting", icon: UIImage(named: "cat_finance")!, selected: false),
                Occupation(id: 7, parentId: 45, name: "Bank teller", icon: UIImage(named: "cat_finance")!, selected: false)]
        }
        else {
            return [
                Occupation(id: 1, parentId: 45, name: "אנליסט", icon: UIImage(named: "cat_finance")!, selected: false),
                Occupation(id: 2, parentId: 45, name: "יועצ/ת כלכלי/ת", icon: UIImage(named: "cat_finance")!, selected: false),
                Occupation(id: 3, parentId: 45, name: "מנהל/ת סיכונים", icon: UIImage(named: "cat_finance")!, selected: false),
                Occupation(id: 4, parentId: 45, name: "תקציבאי/ת", icon: UIImage(named: "cat_finance")!, selected: false),
                Occupation(id: 5, parentId: 45, name: "סמנכ\"ל כספים", icon: UIImage(named: "cat_finance")!, selected: false),
                Occupation(id: 6, parentId: 45, name: "מתמחה בראיית חשבון", icon: UIImage(named: "cat_finance")!, selected: false),
                Occupation(id: 7, parentId: 45, name: "פקיד בנק", icon: UIImage(named: "cat_finance")!, selected: false)]
        }
      }
      
    
    
    class func allNames() -> [Occupation] {
        var array = labNames()
        array.append(contentsOf: repairNames())
        array.append(contentsOf: lawNames())
        array.append(contentsOf: restaurantNames())
        array.append(contentsOf: medicineNames())
        array.append(contentsOf: financeNames())
        array.append(contentsOf: teachingNames())
        array.append(contentsOf: securityNames())
        array.append(contentsOf: humanityNames())
        array.append(contentsOf: engineerNames())
        array.append(contentsOf: designNames())
        array.append(contentsOf: computerNames())
        array.append(contentsOf: communcationNames())


        array.append(contentsOf: moreComputerNames())
        array.append(contentsOf: moreSecurityNames())
        array.append(contentsOf: moreRepairNames())
        array.append(contentsOf: moreTeachingNames())
        array.append(contentsOf: moreCommunicationNames())
        array.append(contentsOf: moreMedicineNames())
        array.append(contentsOf: moreEngineerNames())
        array.append(contentsOf: moreFinanceNames())
        array.append(contentsOf: foodAndPharmaNames())
        array.append(contentsOf: shopNames())
        array.append(contentsOf: governmentalNames())
        array.append(contentsOf: exactScienceNames())
        array.append(contentsOf: religionNames())
        array.append(contentsOf: salesNames())
        array.append(contentsOf: generalManagementNames())
        array.append(contentsOf: welfareNames())
        array.append(contentsOf: cultureAndEntertainmentNames())
        array.append(contentsOf: sportNames())
        array.append(contentsOf: agricultureNames())
        array.append(contentsOf: waterNames())
        array.append(contentsOf: electricityNames())
        array.append(contentsOf: natureNames())
        array.append(contentsOf: vehicleNames())
        array.append(contentsOf: tourismNames())
        array.append(contentsOf: cleaningNames())
        array.append(contentsOf: warehouseNames())
        array.append(contentsOf: careNames())
        array.append(contentsOf: buildingNames())
        array.append(contentsOf: transportationNames())
        array.append(contentsOf: forwardingNames())
        array.append(contentsOf: insuranceNames())
        array.append(contentsOf: aviationNames())
        array.append(contentsOf: generalProfessions())
        
        return array
    }
    
}
