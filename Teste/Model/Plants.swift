//
//  Plants.swift
//  PlanTae
//
//  Created by Cynara Costa on 12/05/22.
//

import Foundation

class Plant {
    
    var name: String
    var waterInterval: Double
    var waterLastTime: Date
    var scissorInterval: Double
    var scissorLastTime: Date
    var fertilizerInterval: Double
    var fertilizerLastTime: Date
    var sunBathInterval: Double
    var sunBathLastTime: Date
    var insecticideInterval: Double
    var insecticideLastTime: Date
        
    init(name: String, waterInterval: Double, waterLastTime: Date, scissorInterval: Double, scissorLastTime: Date, fertilizerInterval: Double, fertilizerLastTime: Date, sunBathInterval: Double,sunBathLastTime: Date, insecticideInterval: Double, insecticideLastTime: Date) {
        self.name = name
        self.waterInterval = waterInterval
        self.waterLastTime = waterLastTime
        self.scissorInterval = scissorInterval
        self.scissorLastTime = scissorLastTime
        self.fertilizerInterval = fertilizerInterval
        self.fertilizerLastTime = fertilizerLastTime
        self.sunBathInterval = sunBathInterval
        self.sunBathLastTime = sunBathLastTime
        self.insecticideInterval = insecticideInterval
        self.insecticideLastTime = insecticideLastTime
    }
    
    func addPlant(whichPlant: Plant){
        myPlants.append(whichPlant)
    }
    
    func Interval(startTime: Date, duration: Double) -> Bool{
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let now = Date()
        let dateInterval = DateInterval(start: startTime, duration: duration * 24.0 * 3600.0)
        let dateEnd = dateInterval.end
        
        let nowString = dateFormatter.string(from: now)
        let dateEndString = dateFormatter.string(from: dateEnd)
        
        print(dateEndString)
        
        if duration == 1.0 {
            return true
        } else if dateEndString == nowString || dateEndString < nowString {
            return true
        } else {
            return false
        }
    }
    
}

var myPlants: [Plant] = []







