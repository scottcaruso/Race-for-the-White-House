//
//  Candidate.swift
//  Race for the White House
//
//  Created by Scott Caruso on 2/15/16.
//  Copyright © 2016 Scott Caruso. All rights reserved.
//

import Foundation

class Candidate: Traits {
  
  var candidateName: String = "John Doe"
  //Need to create a class to handle political parties
  
  init(thisName: String, thisExperience: Int, thisCharisma:Int, thisAttractiveness: Int, thisAuthenticity: Int, thisNoteriety: Int, thisIntelligence: Int, thisHealthcare: Double, thisGayMarriage: Double, thisHomelandSecurity: Double, thisImmigration: Double, thisTaxCode: Double, thisBusinessTaxes: Double, thisOutsourcing: Double, thisCleanEnergy: Double, thisLegalPot: Double, thisCriminalJustice: Double, thisChildrensEducation: Double, thisPostSecondary: Double, thisFracking: Double, thisSocialSecurity: Double, thisMedicareMedicaid: Double, thisGovernmentSpending: Double, thisGunControl: Double, thisClimateChange: Double)
  {
    candidateName = thisName
    super.init()
    experience = thisExperience
    charisma = thisCharisma
    attractiveness = thisAttractiveness
    authenticity = thisAuthenticity
    notoriety = thisNoteriety
    intelligence = thisIntelligence
    universalHeathcare = thisHealthcare
    gayMarriage = thisGayMarriage
    homelandSecurity = thisHomelandSecurity
    immigration = thisImmigration
    taxCode = thisTaxCode
    businessTaxes = thisBusinessTaxes
    outsourcing = thisOutsourcing
    cleanEnergy = thisCleanEnergy
    legalPot = thisLegalPot
    criminalJustice = thisCriminalJustice
    childrensEducation = thisChildrensEducation
    postSecondaryEducation = thisPostSecondary
    fracking = thisFracking
    socialSecurity = thisSocialSecurity
    medicareMedicaid = thisMedicareMedicaid
    governmentSpending = thisGovernmentSpending
    gunControl = thisGunControl
    climateChange = thisClimateChange
  }
  
}

