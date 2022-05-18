//
//  CellModel.swift
//  Teste
//
//  Created by Cynara Costa on 17/05/22.
//

import Foundation

class CellModel {
    
    var image: String
    var label: String
    var interval: Double
    var lastTime: Date
    
    init(image: String, label: String) {
        self.image = image
        self.label = label
        self.interval = 1.0
        self.lastTime = Date()
    }
}

var cells = [
    CellModel(image: "drop.fill.svg", label: "Água"),
    CellModel(image: "scissors.svg", label: "Corte"),
    CellModel(image: "sol.svg", label: "Banho de Sol"),
    CellModel(image: "fertilizante.svg", label: "Fertilizante"),
    CellModel(image: "inseticida.svg", label: "Inseticida"),
]

var arrayTesteInterval: [Double] = []
var arrayTesteLastTime: [Date] = []


