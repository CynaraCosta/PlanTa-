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
    
//    func whichCellsAnalyze() -> [[Int]]{
//        var arrayWhichCellsPerPlant: [[Int]] = []
//        for plant in myPlants{
//            var listOfPlant: [Int] = []
//            let waterOn: Bool = plant.Interval(startTime: plant.waterLastTime, duration: plant.waterInterval)
//            let scissorsOn: Bool = plant.Interval(startTime: plant.scissorLastTime, duration: plant.scissorInterval)
//            let sunOn: Bool = plant.Interval(startTime: plant.sunBathLastTime, duration: plant.sunBathInterval)
//            let fertilizerOn: Bool = plant.Interval(startTime: plant.fertilizerLastTime, duration: plant.fertilizerInterval)
//            let insecticideOn: Bool = plant.Interval(startTime: plant.insecticideLastTime, duration: plant.insecticideInterval)
//            
//            if waterOn{
//                listOfPlant.append(0)
//            }
//            
//            if scissorsOn{
//                listOfPlant.append(1)
//            }
//            
//            if sunOn{
//                listOfPlant.append(2)
//            }
//            
//            if fertilizerOn{
//                listOfPlant.append(3)
//            }
//            
//            if insecticideOn{
//                listOfPlant.append(4)
//            }
//            
//            arrayWhichCellsPerPlant.append(listOfPlant)
//            
//        }
//        
//        return arrayWhichCellsPerPlant
//        
//    }
    
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



