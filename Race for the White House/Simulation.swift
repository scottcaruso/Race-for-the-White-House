//
//  Simulation.swift
//  Race for the White House
//
//  Created by Scott Caruso on 2/15/16.
//  Copyright © 2016 Scott Caruso. All rights reserved.
//

import Foundation

class Simulation {
  
  func getCandidatePerformance(candidates:[Candidate], state:State) -> [String:Double] {
    let stateAverage = state.averagePoliticalTraitValue
    var candidateAverages = [String:Double]()
    var candidateDiffFromState = [String:Double]()
    for candidate in candidates {
      candidateAverages[candidate.candidateName] = candidate.averagePoliticalTraitValue
    }
    for candidate in candidateAverages {
      let stateDiff = candidate.1 - stateAverage
      var stateDelta = 0-stateDiff
      if stateDelta < 0 {
        stateDelta = stateDelta * -1
      }
      candidateDiffFromState[candidate.0] = stateDelta
    }
    return candidateDiffFromState
  }
  
  func calculateWinner(candidateData: [String:Double], state:State) -> String {
    let candidateCount = candidateData.count
    let defaultPercentage = Double(100)/Double(candidateCount)
    if candidateCount == 2 {
      let secondaryDictionary = candidateData.dropFirst()
      if let candidateOne = candidateData.first, candidateTwo = secondaryDictionary.first {
        let candidateOneShare = candidateOne.1
        let candidateTwoShare = candidateTwo.1
        let candidateOnePercentage = defaultPercentage - candidateOneShare + candidateTwoShare
        var winnerName: String
        var winnerPercentage: Double
        if candidateOnePercentage > 50.0 {
          winnerName = candidateOne.0
          winnerPercentage = candidateOnePercentage
        } else {
          winnerName = candidateTwo.0
          winnerPercentage = 100 - candidateOnePercentage
        }
        return("\(winnerName) has won the state of \(state.stateName)'s \(state.stateElectoralVotes) electoral votes, claiming \(winnerPercentage)% of the overall vote.")
      } else {
        return("Sorry, there was an error when calculating the tcandidates.")
      }
    } else {
      return("Sorry, we can only currently calculate 2 candidate races.")
    }
  }
}