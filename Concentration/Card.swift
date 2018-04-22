//
//  Card.swift
//  Concentration
//
//  Created by Felipe Ortiz on 4/17/18.
//  Copyright © 2018 Felipe Ortiz. All rights reserved.
//

import Foundation

struct Card
{
   var isFaceUp = false
   var isMatched = false
   var identifier: Int
   
   static var identifierFactory = 0
   
   static func getUniqueIdentifier() -> Int {
      identifierFactory += 1
      return identifierFactory
   }
   
   init() {
      self.identifier = Card.getUniqueIdentifier()
   }
}
