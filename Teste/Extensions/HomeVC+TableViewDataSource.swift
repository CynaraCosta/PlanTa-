//
//  HomeVC+TableViewDataSource.swift
//  PlanTae
//
//  Created by Cynara Costa on 11/05/22.
//

import UIKit

extension HomeVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myPlants.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var identifier: String
        
        if indexPath.row == myPlants.count {
            identifier = CustomAddNewPlantTableViewCell.identifier
        } else {
            identifier = CustomTableViewCell.identifier
        }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? CustomTableViewCell else {return CustomAddNewPlantTableViewCell()}
        
        if identifier == "CustomTableViewCell" {
            cell.configure(text: myPlants[indexPath.row].name)
        }
        
        let bgColor = UIView()
        bgColor.backgroundColor = .secondarySystemBackground
        cell.selectedBackgroundView = bgColor
        
        return cell
    }
    
    
}

extension HomeVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 56
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == myPlants.count{
            
            if myPlants.count <= 4 {
                didTapAddPlant()
            }
            
        } else {
            let number = indexPath.row
            didTapAnalyzePlant(namePlant: myPlants[number].name)
        }
    }
    
}
