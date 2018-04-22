//
//  Concentration.swift
//  Concentration
//
//  Created by Felipe Ortiz on 4/17/18.
//  Copyright © 2018 Felipe Ortiz. All rights reserved.
//

import Foundation

class Concentration
{
   var cards = [Card]()
   
   var indexOfOneAndOnlyFaceUpCard: Int?
   
   func chooseCard(at index: Int) {
      if !cards[index].isMatched {
         if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
            // check if cards match
            if cards[matchIndex].identifier == cards[index].identifier {
               cards[matchIndex].isMatched = true
               cards[index].isMatched = true
            }
            cards[index].isFaceUp = true
            indexOfOneAndOnlyFaceUpCard = nil
         } else {
            // either no cards or 2 cards are face up
            for flipDownIndex in cards.indices {
               cards[flipDownIndex].isFaceUp = false
            }
            cards[index].isFaceUp = true
            indexOfOneAndOnlyFaceUpCard = index
         }
      }
   }
   
   init(numberOfPairOfCards: Int) {
      for _ in 1...numberOfPairOfCards {
         let card = Card()
         cards += [card, card]
      }
      
      shuffleCards()
   }
   // Implements the Fisher-Yates Algorithm
   private func shuffleCards() {
      for index in 0..<cards.count-1 {
         let randomCardIndex = Int(arc4random_uniform(UInt32(cards.count-index)))
         let tempCard = cards[randomCardIndex]
         cards[randomCardIndex] = cards[index]
         cards[index] = tempCard
      }
   }
}
