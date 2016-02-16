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
      candidateAverages[candidate.candidateName] = candidate.averagePoliticalTraitValue+randomness()
    }
    for candidate in candidateAverages {
      let stateDiff = candidate.1 - stateAverage
      var stateDelta = 0-stateDiff
      if stateDelta < 0 {
        stateDelta = stateDelta * -1.0
      }
      candidateDiffFromState[candidate.0] = stateDelta
    }
    return candidateDiffFromState
  }
  
  func calculateWinner(candidateData: [String:Double], state:State) -> (winnerString:String,winnerName:String) {
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