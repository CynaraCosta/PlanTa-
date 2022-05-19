//
//  AnalyzePlant+UITableView.swift
//  PlanTae
//
//  Created by Cynara Costa on 12/05/22.
//

import UIKit

extension AnalyzePlant: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellsToShow.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier: String = CustomTableViewCellAnalyze.identifier
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? CustomTableViewCellAnalyze else{
            return UITableViewCell()
        }
        
        //cell.configure(text: cells[indexPath.row].label, imageName: cells[indexPath.row].image)
        cell.configure(text: cellsToShow[indexPath.row].label, imageName: cellsToShow[indexPath.row].image)
        cell.receivePlant(plant: self.planta)
        
        let bgColor = UIView()
        bgColor.backgroundColor = .secondarySystemBackground
        cell.selectedBackgroundView = bgColor
        
        
        return cell
    }
}

extension AnalyzePlant: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 56
    }
    
}
