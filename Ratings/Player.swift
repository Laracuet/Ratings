//
//  Player.swift
//  Ratings
//
//  Created by Tyler Laracuente on 1/5/15.
//  Copyright (c) 2015 Tyler Laracuente. All rights reserved.
//

import Foundation
import UIKit

class Player: NSObject {
    var name: String
    var game: String
    var rating: Int
    
    init(name: String, game: String, rating: Int) {
        self.name = name
        self.game = game
        self.rating = rating
        super.init()
    }
}
