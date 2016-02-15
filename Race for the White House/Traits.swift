//
//  Traits.swift
//  Race for the White House
//
//  Created by Scott Caruso on 2/15/16.
//  Copyright © 2016 Scott Caruso. All rights reserved.
//
//  This class will specifically describe the base traits that all politician and state objects will be able to contain. Both politicians and states should inherit from this traits class.

import Foundation

class Traits {
  
  //Personal traits
  //These are the traits that are inherit to each politician and not reflective of political positions. These MIN at 0 and MAX at 50, and each state has various personal traits that it likes to see from politicians.
  
  var experience = 20
  var charisma = 20
  var attractiveness = 20
  var authenticity = 20
  var notoriety = 20
  var intelligence = 20
  
  
  //Political traits
  //These are the traits that relate to a politician or state's POLITICAL leanings - as in, how they feel about a particular issue. These range from -50 to 50, with 0 being "true neutral." Negative numbers mean MORE liberal approaching -50, while positive numbers mean MORE conservative approaching 50.
  
  // Universal Healthcare
  //    -50 is a full socialist, single-payer program subsidized heavily by taxes
  //      0 is maintenance of the current Obamacare plan
  //     50 is full repeal of Obamacare, no replacement, complete free-market, insurance-based and unregulated system
  
  var universalHeathcare = 0
  
  // Gay rights
  //    -50 is pushing for a constitutional amendment that guarantees the rights of same-sex couples to marry
  //      0 is allowing the current rule of law to stay in place, and leaving the decision up to the states
  //     50 is pushing for a constitutional amendment that disallows same-sex marriages, dissolves any existing same-sex marriages, and nullifies any existing state laws guaranteeing these rights
  
  var gayMarriage = 0
  
  // Homeland security
  //    -50 is the abolishment of the Department of Homeland Security
  //      0 is no change to the current DHS system
  //     50 is full militarized homeland security, including madatory regular background checks on anyone with Middle-Eastern decent, a moritorium on immigration from the Middle East, and regular pre-emptive attacks on nations where terrorists may be hiding
  
  var homelandSecurity = 0
  
  // Immigration
  // Need to author description for Immigration
  // 
  //
  
  var immigration = 0
  
  // Tax Code
  // Need to author description
  //
  //
  
  var taxCode = 0
  
  // Business taxes
  // Need to author description
  //
  //
  
  var businessTaxes = 0
  
  // Outsourcing
  // Need to author description
  //
  //
  
  var outsourcing = 0
  
  // Clean energy
  // Need to author description
  //
  //
  
  var cleanEnergy = 0
  
  // Legalization of marijuana
  // Need to author description
  //
  //
  
  var legalPot = 0
  
  // Criminal justice reform
  // Need to author description
  //
  //
  
  var criminalJustice = 0
  
  // Education - Primary/Secondary
  // Need to author description
  //
  //
  
  var childrensEducation = 0
  
  // Education - Post-secondary
  // Need to author description
  //
  //
  
  var postSecondaryEducation = 0
  
  // Fracking
  // Need to author description
  //
  //
  
  var fracking = 0
  
  // Social Security
  // Need to author description
  //
  //
  
  var socialSecurity = 0
  
  // Medicare/Medicaid
  // Need to author description
  //
  //
  
  var medicareMedicaid = 0
  
  // National Debt / Government Spending
  // Need to author description
  //
  //
  
  var governmentSpending = 0
  
  // Gun control
  // Need to author description
  //
  //
  
  var gunControl = 0
  
  // Climate change
  // Need to author description
  //
  //
  
  var climateChange = 0
  
  
  init() {
    //Traits should never be used with this default initializer, except for testing purposes.
  }
  
  init(thisExperience: Int, thisCharisma:Int, thisAttractiveness: Int, thisAuthenticity: Int, thisNoteriety: Int, thisIntelligence: Int, thisHealthcare: Int, thisGayMarriage: Int, thisHomelandSecurity: Int, thisImmigration: Int, thisTaxCode: Int, thisBusinessTaxes: Int, thisOutsourcing: Int, thisCleanEnergy: Int, thisLegalPot: Int, thisCriminalJustice: Int, thisChildrensEducation: Int, thisPostSecondary: Int, thisFracking: Int, thisSocialSecurity: Int, thisMedicareMedicaid: Int, thisGovernmentSpending: Int, thisGunControl: Int, thisClimateChange: Int) {
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
