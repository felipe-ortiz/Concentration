//
//  Concentration.swift
//  Concentration
//
//  Created by Felipe Ortiz on 4/17/18.
//  Copyright © 2018 Felipe Ortiz. All rights reserved.
//

import Foundation

struct Concentration
{
   private(set) var cards = [Card]()
   
   private var indexOfOneAndOnlyFaceUpCard: Int? {
      get {
         return cards.indices.filter { cards[$0].isFaceUp}.oneAndOnly
      }
      
      set {
         for index in cards.indices {
            cards[index].isFaceUp = (index == newValue)
         }
      }
   }
   
   mutating func chooseCard(at index: Int) {
      assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index)): chosen index not in the cards")
      if !cards[index].isMatched {
         if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
            // check if cards match
            if cards[matchIndex] == cards[index] {
               cards[matchIndex].isMatched = true
               cards[index].isMatched = true
            }
            cards[index].isFaceUp = true
         } else {
            // either no cards or 2 cards are face up
            indexOfOneAndOnlyFaceUpCard = index
         }
      }
   }
   
   init(numberOfPairOfCards: Int) {
      assert(numberOfPairOfCards > 0, "Concentration.init(at: \(index)): you at least must have one pair of cards")

      for _ in 1...numberOfPairOfCards {
         let card = Card()
         cards += [card, card]
      }
   }
}

extension Collection {
   var oneAndOnly: Element? {
      return count == 1 ? first : nil
   }
}
