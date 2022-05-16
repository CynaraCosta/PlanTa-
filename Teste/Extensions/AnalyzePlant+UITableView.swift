//
//  AnalyzePlant+UITableView.swift
//  PlanTae
//
//  Created by Cynara Costa on 12/05/22.
//

import UIKit

extension AnalyzePlant: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier: String = CustomTableViewCellAnalyze.identifier
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? CustomTableViewCellAnalyze else{
            return UITableViewCell()
        }
        
        func whichLabel() -> String{
            var label: String
            
            if indexPath.row == 0 {
                label = "Água"
            } else if indexPath.row == 1 {
                label = "Corte"
            } else if indexPath.row == 2 {
                label = "Banho de sol"
            } else if indexPath.row == 3 {
                label = "Fertilizante"
            } else {
                label = "Inseticida"
            }
            
            return label
        }
        
        func whichImage() -> String {
            var label: String
            
            if indexPath.row == 0 {
                label = "drop.fill.svg"
            } else if indexPath.row == 1 {
                label = "scissors.svg"
            } else if indexPath.row == 2 {
                label = "sol.svg"
            } else if indexPath.row == 3 {
                label = "fertilizante.svg"
            } else {
                label = "inseticida.svg"
            }
            
            return label
        }
        
        cell.configure(text: whichLabel(), imageName: whichImage())
        
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
