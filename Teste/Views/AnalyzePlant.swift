//
//  AnalyzePlant.swift
//  PlanTae
//
//  Created by Cynara Costa on 12/05/22.
//

import UIKit

class AnalyzePlant: UIViewController {
    
    var timeDateLabel: Timer?
    
    private let dateString: UILabel = {
        let dateString = UILabel()
        dateString.frame = CGRect(x: 0, y: 0, width: 115, height: 25)
        dateString.font = UIFont(name: "Nunito-ExtraBold", size: 25)
        dateString.text = "Place hold"
        dateString.textColor = UIColor(named: "verde-escuro")
        return dateString
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timeDateLabel = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(changeLabelText), userInfo: nil, repeats: true)
        
        view.backgroundColor = .tertiarySystemBackground
        
        let tableView = UITableView()
        tableView.register(CustomTableViewCellAnalyze.self, forCellReuseIdentifier: CustomTableViewCellAnalyze.identifier)
        
        tableView.backgroundColor = .clear
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.allowsSelection = false
        tableView.isUserInteractionEnabled = true
        
        let plantImage = UIImageView()
        plantImage.image = UIImage(named: whichPlant())
        plantImage.contentMode = .scaleAspectFit
        plantImage.clipsToBounds = true
        
        view.addSubview(plantImage)
        
        plantImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            plantImage.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 60),
            plantImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
        ])
        
        view.addSubview(dateString)
        dateString.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dateString.topAnchor.constraint(equalTo: plantImage.bottomAnchor, constant: 24),
            dateString.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24),
        ])
        
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.widthAnchor.constraint(equalToConstant: self.view.frame.width * 0.8),
            tableView.topAnchor.constraint(equalTo: dateString.bottomAnchor, constant: 24),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 24),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -24),
        ])
        
    }
    
    @objc func whichPlant() -> String{
        let namePlant: String = self.title!
        let plantNumber = myPlants.firstIndex(where: {$0.name == namePlant})! + 1
        let number = String(plantNumber)
        let imageName = "planta" + number + ".svg"
        return imageName
        }
    
    @objc func changeLabelText(){
        dateString.text = changeDate()
    }
    
    func changeDate() -> String{
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "dd MMMM, yyyy"
        let now = dateFormater.string(from: Date())
        return now
    }
        
}
