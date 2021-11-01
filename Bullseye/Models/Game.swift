//
//  Game.swift
//  Bullseye
//
//  Created by Yevhen Lohosha on 01/11/2021.
//

import Foundation

struct Game {
    var target = Int.random(in: 1...100)
    var score = 0
    var round = 1
    
    func points(sliderValue: Int) -> Int {
        return 100 - abs(self.target - sliderValue)
    }
}
