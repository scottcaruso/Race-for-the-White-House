//
//  State.swift
//  Race for the White House
//
//  Created by Scott Caruso on 2/15/16.
//  Copyright © 2016 Scott Caruso. All rights reserved.
//

import Foundation

class State: Traits {
  
  var stateName: String
  var statePopulation: Int
  var stateVoterPercent: Double
  var stateElectoralVotes: Int
  //Need to create a class to handle political parties
  
  init(thisState: String, thisPopulation: Int, thisPercent: Double, thisElectoralVotes: Int, thisExperience: Int, thisCharisma:Int, thisAttractiveness: Int, thisAuthenticity: Int, thisNoteriety: Int, thisIntelligence: Int, thisHealthcare: Double, thisGayMarriage: Double, thisHomelandSecurity: Double, thisImmigration: Double, thisTaxCode: Double, thisBusinessTaxes: Double, thisOutsourcing: Double, thisCleanEnergy: Double, thisLegalPot: Double, thisCriminalJustice: Double, thisChildrensEducation: Double, thisPostSecondary: Double, thisFracking: Double, thisSocialSecurity: Double, thisMedicareMedicaid: Double, thisGovernmentSpending: Double, thisGunControl: Double, thisClimateChange: Double)
  {
    stateName = thisState
    statePopulation = thisPopulation
    stateVoterPercent = thisPercent
    stateElectoralVotes = thisElectoralVotes
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
