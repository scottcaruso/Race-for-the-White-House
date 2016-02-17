//
//  Simulation.swift
//  Race for the White House
//
//  Created by Scott Caruso on 2/15/16.
//  Copyright © 2016 Scott Caruso. All rights reserved.
//

import Foundation

class Simulation {
  
    func getCandidatePerformance(candidates:[Candidate], state:State) -> [String:(lockedpercentage:Double,stateDiff:Double)] {
    var candidateDictionary = [String:(lockedpercentage:Double,stateDiff:Double)]()
    
    for candidate in candidates {
      candidateDictionary[candidate.candidateName] = (0.0,0.0)
    }
    
    if let parties = state.politicalParties {
      for party in parties {
        let thisParty = party.party
        for candidate in candidates {
          if thisParty.partyName == candidate.candidateParty.partyName {
            let candidatePartySupport = party.percentage*0.9
            candidateDictionary[candidate.candidateName] = (candidatePartySupport,0.0)
          }
        }
      }
    }
    
    let stateAverage = state.averagePoliticalTraitValue
    var candidateAverages = [String:Double]()
    for candidate in candidates {
      candidateAverages[candidate.candidateName] = candidate.averagePoliticalTraitValue+randomness()
    }
    for candidate in candidateAverages {
      let stateDiff = candidate.1 - stateAverage
      var stateDelta = 0-stateDiff
      if stateDelta < 0 {
        stateDelta = stateDelta * -1.0
      }
      if var candidateTuple = candidateDictionary[candidate.0] {
        candidateTuple.stateDiff = stateDelta
        candidateDictionary[candidate.0] = candidateTuple
      }
    }
    return candidateDictionary
  }
  
  func calculateWinner(candidateData: [String:(lockedpercentage:Double,stateDiff:Double)], state:State) -> (winnerString:String,winnerName:String) {
    let candidateCount = candidateData.count
    var defaultPercentage = 100.0
    if candidateCount == 2 {
        for candidate in candidateData {
            let thisCandidateLocked = candidate.1.lockedpercentage
            defaultPercentage -= thisCandidateLocked
        }
        let secondaryDictionary = candidateData.dropFirst()
        if let candidateOne = candidateData.first, candidateTwo = secondaryDictionary.first {
            let candidateOneShare = candidateOne.1.stateDiff
            let candidateTwoShare = candidateTwo.1.stateDiff
            let candidateOneIndependentPercentage = defaultPercentage/Double(candidateCount) - candidateOneShare + candidateTwoShare
            let candidateOneTotalPercentage = candidateOneIndependentPercentage + candidateOne.1.lockedpercentage
            var winnerName: String
            var winnerPercentage: Double
        if candidateOneTotalPercentage > 50.0 {
          winnerName = candidateOne.0
          winnerPercentage = candidateOneTotalPercentage
        } else {
          winnerName = candidateTwo.0
          winnerPercentage = 100 - candidateOneTotalPercentage
        }
        winnerPercentage = Double(round(10*winnerPercentage)/10)
        return("\(winnerName) has won the state of \(state.stateName)'s \(state.stateElectoralVotes) electoral votes, claiming \(winnerPercentage)% of the overall vote.\n\n",winnerName)
      } else {
        return("Sorry, there was an error when calculating the tcandidates.","N/A")
      }
    } else {
      return("Sorry, we can only currently calculate 2 candidate races.","N/A")
    }
  }
  
  func electionNight(candidates:[Candidate], states:[State]) {
    var totalElectoralVotes = 0
    let candidateOne = candidates[0].candidateName
    let candidateTwo = candidates[1].candidateName
    var candidateOneVotes = 0
    var candidateTwoVotes = 0
    for state in states {
      totalElectoralVotes += state.stateElectoralVotes
    }
    let neededToWin = (totalElectoralVotes/2)
    for state in states {
      let candidatePerformanceInState = getCandidatePerformance(candidates, state: state)
      let stateWinner = calculateWinner(candidatePerformanceInState, state: state)
      print(stateWinner.winnerString)
      if stateWinner.winnerName == candidateOne {
        candidateOneVotes += state.stateElectoralVotes
      } else {
        candidateTwoVotes += state.stateElectoralVotes
      }
      print("Updated totals\n\n\(candidateOne): \(candidateOneVotes) electoral votes.\n\(candidateTwo): \(candidateTwoVotes) electoral votes.\n-------\n")
      if candidateOneVotes > neededToWin {
        print("We are ready to make a call. With that last state win, \(candidateOne) has secured the necessary electoral votes to become President-Elect of the United States!")
        break
      } else if candidateTwoVotes > neededToWin {
        print("We are ready to make a call. With that last state win, \(candidateTwo) has secured the necessary electoral votes to become President-Elect of the United States!")
        break
      } else if candidateOneVotes == neededToWin && candidateTwoVotes == neededToWin {
        print("I don't believe it! We have a tie!")
      }
    sleep(2)
    }
  }
  
  func randomness() -> Double {
    var value = (Double(arc4random())/Double(UINT32_MAX))*5
    let negativeRandomizer = Int(arc4random_uniform(2))
    if negativeRandomizer == 0 {
      value = 0 - value
    }
    return value
  }
}