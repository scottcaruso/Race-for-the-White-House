//
//  ViewController.swift
//  Race for the White House
//
//  Created by Scott Caruso on 2/15/16.
//  Copyright © 2016 Scott Caruso. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
    let candidateOne = Candidate(thisName: "Hillary Clinton", thisExperience: 25, thisCharisma: 25, thisAttractiveness: 25, thisAuthenticity: 25, thisNoteriety: 25, thisIntelligence: 25, thisHealthcare: randomNegativeValue() , thisGayMarriage: randomNegativeValue() , thisHomelandSecurity: randomNegativeValue() , thisImmigration: randomNegativeValue() , thisTaxCode: randomNegativeValue(), thisBusinessTaxes: randomNegativeValue(), thisOutsourcing: randomNegativeValue() , thisCleanEnergy: randomNegativeValue() , thisLegalPot: randomNegativeValue() , thisCriminalJustice: randomNegativeValue() , thisChildrensEducation: randomNegativeValue(), thisPostSecondary: randomNegativeValue() , thisFracking: randomNegativeValue(), thisSocialSecurity: randomNegativeValue(), thisMedicareMedicaid: randomNegativeValue(), thisGovernmentSpending: randomNegativeValue(), thisGunControl: randomNegativeValue(), thisClimateChange: randomNegativeValue())
  
    let candidateTwo = Candidate(thisName: "Donald Trump", thisExperience: 0, thisCharisma: 50, thisAttractiveness: 15, thisAuthenticity: 30, thisNoteriety: 50, thisIntelligence: 30, thisHealthcare: randomNegativeValue() , thisGayMarriage: randomNegativeValue() , thisHomelandSecurity: randomNegativeValue() , thisImmigration: randomNegativeValue() , thisTaxCode: randomNegativeValue(), thisBusinessTaxes: randomNegativeValue(), thisOutsourcing: randomNegativeValue() , thisCleanEnergy: randomNegativeValue() , thisLegalPot: randomNegativeValue() , thisCriminalJustice: randomNegativeValue() , thisChildrensEducation: randomNegativeValue(), thisPostSecondary: randomNegativeValue() , thisFracking: randomNegativeValue(), thisSocialSecurity: randomNegativeValue(), thisMedicareMedicaid: randomNegativeValue(), thisGovernmentSpending: randomNegativeValue(), thisGunControl: randomNegativeValue(), thisClimateChange: randomNegativeValue())
    
    let ohio = State(thisState: "Ohio", thisPopulation: 10000000, thisPercent: 0.42, thisElectoralVotes: 18, thisExperience: 25, thisCharisma: 25, thisAttractiveness: 25, thisAuthenticity: 25, thisNoteriety: 25, thisIntelligence: 25, thisHealthcare: randomNegativeValue() , thisGayMarriage: randomNegativeValue() , thisHomelandSecurity: randomNegativeValue() , thisImmigration: randomNegativeValue() , thisTaxCode: randomNegativeValue(), thisBusinessTaxes: randomNegativeValue(), thisOutsourcing: randomNegativeValue() , thisCleanEnergy: randomNegativeValue() , thisLegalPot: randomNegativeValue() , thisCriminalJustice: randomNegativeValue() , thisChildrensEducation: randomNegativeValue(), thisPostSecondary: randomNegativeValue() , thisFracking: randomNegativeValue(), thisSocialSecurity: randomNegativeValue(), thisMedicareMedicaid: randomNegativeValue(), thisGovernmentSpending: randomNegativeValue(), thisGunControl: randomNegativeValue(), thisClimateChange: randomNegativeValue())
    
    let simulationEngine = Simulation()
    
    let winnerString = simulationEngine.calculateWinner(simulationEngine.getCandidatePerformance([candidateOne,candidateTwo], state: ohio), state: ohio)

    print(winnerString)
}
  
  

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func randomNegativeValue() -> Int {
    var value = Int(arc4random_uniform(51))
    let negativeRandomizer = Int(arc4random_uniform(2))
    if negativeRandomizer == 0 {
      value = 0 - value
    }
    return value
  }


}

