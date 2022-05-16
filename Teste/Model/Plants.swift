//
//  Plants.swift
//  PlanTae
//
//  Created by Cynara Costa on 12/05/22.
//

import Foundation

class Plant {
    
    var name: String
    var water: Bool
    var scissor: Bool
    var fertilizer: Bool
    var sunBath: Bool
    var insecticide: Bool
    
    init(name: String, water: Bool, scissor: Bool, fertilizer: Bool, sunBath: Bool, insecticide: Bool){
        self.name = name
        self.water = water
        self.scissor = scissor
        self.fertilizer = fertilizer
        self.sunBath = sunBath
        self.insecticide = insecticide
    }
    
    func addPlant(whichPlant: Plant){
        myPlants.append(whichPlant)
    }
}


var myPlants: [Plant] = []







