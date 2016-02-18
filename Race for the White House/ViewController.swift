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
    
    print("\(candidateOne.candidateName): \(candidateOne.averagePoliticalTraitValue)")
    print("\(candidateTwo.candidateName): \(candidateTwo.averagePoliticalTraitValue)")
    for state in states {
      print("\(state.stateName): \(state.averagePoliticalTraitValue)")
    }
    
    electionNight([candidateOne,candidateTwo], states: states)
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
    
    @IBAction func rerunSimulation() {
        
    electionNight([candidateOne,candidateTwo], states: states)
    }


}

