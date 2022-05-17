//
//  AnalyzePlant+UITableView.swift
//  PlanTae
//
//  Created by Cynara Costa on 12/05/22.
//

import UIKit

extension AddPlant: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier: String = CustomTableViewCellAddPlant.identifier
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? CustomTableViewCellAddPlant else{
            return UITableViewCell()
        }

        cell.configure(text: cells[indexPath.row].label, imageName: cells[indexPath.row].image)
        
        let bgColor = UIView()
        bgColor.backgroundColor = .secondarySystemBackground
        cell.selectedBackgroundView = bgColor
        
        return cell
    }
}

extension AddPlant: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        whichTask(row: indexPath.row, Interval: 1.0, LastTime: Date())
        whichRow(row: indexPath.row)
    }
    
}


