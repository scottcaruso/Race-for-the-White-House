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
    
    let candidateOne = Candidate(thisName: "Hillary Clinton", thisExperience: 25, thisCharisma: 25, thisAttractiveness: 25, thisAuthenticity: 25, thisNoteriety: 25, thisIntelligence: 25, thisHealthcare: randomNegativeValue() , thisGayMarriage: randomNegativeValue() , thisHomelandSecurity: randomNegativeValue() , thisImmigration: randomNegativeValue() , thisTaxCode: randomNegativeValue(), thisBusinessTaxes: randomNegativeValue(), thisOutsourcing: randomNegativeValue() , thisCleanEnergy: randomNegativeValue() , thisLegalPot: randomNegativeValue() , thisCriminalJustice: randomNegativeValue() , thisChildrensEducation: randomNegativeValue(), thisPostSecondary: randomNegativeValue() , thisFracking: randomNegativeValue(), thisSocialSecurity: randomNegativeValue(), thisMedicareMedicaid: randomNegativeValue(), thisGovernmentSpending: randomNegativeValue(), thisGunControl: randomNegativeValue(), thisClimateChange: randomNegativeValue(), thisParty: democrats)
  
    let candidateTwo = Candidate(thisName: "Donald Trump", thisExperience: 0, thisCharisma: 50, thisAttractiveness: 15, thisAuthenticity: 30, thisNoteriety: 50, thisIntelligence: 30, thisHealthcare: randomNegativeValue() , thisGayMarriage: randomNegativeValue() , thisHomelandSecurity: randomNegativeValue() , thisImmigration: randomNegativeValue() , thisTaxCode: randomNegativeValue(), thisBusinessTaxes: randomNegativeValue(), thisOutsourcing: randomNegativeValue() , thisCleanEnergy: randomNegativeValue() , thisLegalPot: randomNegativeValue() , thisCriminalJustice: randomNegativeValue() , thisChildrensEducation: randomNegativeValue(), thisPostSecondary: randomNegativeValue() , thisFracking: randomNegativeValue(), thisSocialSecurity: randomNegativeValue(), thisMedicareMedicaid: randomNegativeValue(), thisGovernmentSpending: randomNegativeValue(), thisGunControl: randomNegativeValue(), thisClimateChange: randomNegativeValue(), thisParty: republicans)
    
    let simulationEngine = Simulation()
    
    let states = [alabama,alaska,arizona,arkansas,california,colorado,connecticut,delaware,florida,georgia,hawaii,idaho,illinois,indiana,iowa,kansas,kentucky,louisiana,maine,maryland,massachusetts,michigan,minnesota,mississippi,missouri,montana,nebraska,nevada,newHampshire,newJersey,newMexico,newYork,northCarolina,northDakota,ohio,oklahoma,oregon,pennsylvania,rhodeIsland,southCarolina,southDakota,tennessee,texas,utah,vermont,virginia,washington,westVirginia,wisconsin,wyoming,dc]
    print("\(candidateOne.candidateName): \(candidateOne.averagePoliticalTraitValue)")
    print("\(candidateTwo.candidateName): \(candidateTwo.averagePoliticalTraitValue)")
    for state in states {
      print("\(state.stateName): \(state.averagePoliticalTraitValue)")
    }
    
    simulationEngine.electionNight([candidateOne,candidateTwo], states: states)
}
  
  

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func randomNegativeValue() -> Double {
    var value = (Double(arc4random())/Double(UINT32_MAX))*50
    let negativeRandomizer = Int(arc4random_uniform(2))
    if negativeRandomizer == 0 {
      value = 0 - value
    }
    return value
  }


}

