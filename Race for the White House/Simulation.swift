//
//  Simulation.swift
//  Race for the White House
//
//  Created by Scott Caruso on 2/15/16.
//  Copyright © 2016 Scott Caruso. All rights reserved.
//

import Foundation


let turnoutLimits: (turnoutMin:Double,turnoutMax:Double) = (turnoutMin: 45.0, turnoutMax: 65.0)

/* The below function takes an array of the candidates and a single state, then calculates what percentage of the state's independent voters will turn out during the election.

Right now, it averages the candidates' notorieties. If the average is greater than the state's desired notoriety, the maximum turnout is achieved. If not, the average notoriety is used to calculate the turnout. For instance, if the state is looking for 15 notoriety from a candidate, and the average of the two candidates is 17, then turnoutLimits.turnoutMax will be the turnout. However, if the state is looking for 18 notoriety, the two candidates would return a 62% turnout.
*/


func calculateIndependentTurnout(candidates:[Candidate], state:State) -> Double {
    var totalPopularity: Int = 0
    let candidateCount = candidates.count
    var turnoutPercentage: Double = 0.0
    for candidate in candidates {
        totalPopularity += candidate.notoriety
    }
    let averageNotoriety = totalPopularity/candidateCount
    if state.notoriety <= averageNotoriety {
        turnoutPercentage = turnoutLimits.turnoutMax
    } else {
        let electorateFinickiness = randomness()
        turnoutPercentage = (Double(averageNotoriety) + turnoutLimits.turnoutMin)+electorateFinickiness
    }
    return turnoutPercentage
}

/* The below function takes an array of the candidates and a single state, then calculates each candidate's performance relative to that state's traits.

Right now, it is using very basic calculations for the party support - candidates always receive 90% of support of members of their own party. The other 10% remain in the independent column.
*/

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

/* The below function takes in a dictionary with the candidate names as the Keys and tuple of their party support (a Double called .lockedpercentage) and a Double that represents how far they differ from the ideal candidate for the state (.stateDiff)

A candidate is assumed to have "locked in" their party support, and it then uses the remaining independent voters to compare which of the two candidates is closes to what the state desires. Once it does that, it returns a tuple with a string to print to the console and the name of the winner.
*/

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

//The below function is what ties the above two functions together; it runs through each state in a states array, calculates the winner of each, and then calls the election when one candidate reaches 270 or more electoral votes.

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
        //sleep(2)
    }
}

//This function below merely generates a random double between -5.0 and 5.0 that is applied to every candidate to simulate "randomness" or unpredictability in the electorate.

func randomness() -> Double {
    var value = (Double(arc4random())/Double(UINT32_MAX))*5
    let negativeRandomizer = Int(arc4random_uniform(2))
    if negativeRandomizer == 0 {
        value = 0 - value
    }
    return value
}