//
//  HomeVC.swift
//  PlanTae
//
//  Created by Cynara Costa on 10/05/22.
//

import UIKit

class HomeVC: UIViewController {
    
    var time: Timer?
    var timeHouse: Timer?
        
    public let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        tableView.register(CustomAddNewPlantTableViewCell.self, forCellReuseIdentifier: CustomAddNewPlantTableViewCell.identifier)
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.allowsSelection = true
        tableView.isUserInteractionEnabled = true
        return tableView
    }()
    
    private let imageHouse: UIImageView = {
        let imageHouse: UIImageView
        imageHouse = UIImageView(frame: CGRect(x: 100, y: 200, width: 282, height: 289))
        imageHouse.contentMode = .scaleAspectFit
        return imageHouse
    }()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        time = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(refresh), userInfo: nil, repeats: true)
        timeHouse = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(refreshImageHouse), userInfo: nil, repeats: true)
            
        view.backgroundColor = .tertiarySystemBackground
        
        let title_ = UILabel(frame: CGRect(x: 100, y: 100, width: 115, height: 25))
        title_.font = UIFont(name: "Nunito-ExtraBold", size: 25)
        title_.text = "Sua casa"
        title_.textColor = UIColor(named: "verde-escuro")
        
        self.view.addSubview(title_)
        
        let plants_title = UILabel(frame: CGRect(x: 100, y: 100, width: 115, height: 25))
        plants_title.font = UIFont(name: "Nunito-ExtraBold", size: 25)
        plants_title.text = "Suas plantinhas hoje"
        plants_title.textColor = UIColor(named: "verde-escuro")
        
        self.view.addSubview(plants_title)
        
        //let imageHouse: UIImageView
        //imageHouse = UIImageView(frame: CGRect(x: 100, y: 200, width: 282, height: 289))
        //imageHouse.image = UIImage(named: whichHouseImage)
        //imageHouse.contentMode = .scaleAspectFit
        
        self.view.addSubview(imageHouse)
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .clear
        
        self.view.addSubview(tableView)
        
        //self.view.addSubview(tableView)

        
        // Autolayout
        
        imageHouse.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageHouse.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            //imageHouse.widthAnchor.constraint(equalToConstant: self.view.frame.width * 0.8),
            //imageHouse.heightAnchor.constraint(equalToConstant: self.view.frame.height * 0.35),
            // ver a questao do autoresizing
            imageHouse.topAnchor.constraint(equalTo: title_.bottomAnchor, constant: 24),
        ])
        
        title_.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            title_.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 56),
            title_.leadingAnchor.constraint(equalTo: imageHouse.leadingAnchor),
        ])
        
        plants_title.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            plants_title.topAnchor.constraint(equalTo: imageHouse.bottomAnchor, constant: 24),
            plants_title.leadingAnchor.constraint(equalTo: imageHouse.leadingAnchor),
        ])
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24),
            tableView.topAnchor.constraint(equalTo: plants_title.bottomAnchor, constant: 24),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -24),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -24),
            tableView.widthAnchor.constraint(equalTo: imageHouse.widthAnchor),

        ])
    }
    
    @objc func refresh(){
        tableView.reloadData()
    }

    @objc func refreshImageHouse(){
        imageHouse.image = UIImage(named: whichHouseImage())
    }
    
    func didTapAddPlant(){
        let addVC = AddPlant()
        addVC.title = "Nova planta"
        let navVC = UINavigationController(rootViewController: addVC)
        self.present(navVC, animated: true)
        
        let cancelButtonNavigationItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(dismissView))
        cancelButtonNavigationItem.tintColor = .label
        
        addVC.navigationItem.setLeftBarButton(cancelButtonNavigationItem, animated: true)
    }
    
    func didTapAnalyzePlant(namePlant: String){
        let analyzeVC = AnalyzePlant()
        analyzeVC.title = namePlant
        let navVC = UINavigationController(rootViewController: analyzeVC)
        
        self.present(navVC, animated: true)
        let cancelButtonNavigationItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(dismissView))
        cancelButtonNavigationItem.tintColor = .label
        
        analyzeVC.navigationItem.setRightBarButton(cancelButtonNavigationItem, animated: true)
    }
    
    @objc func dismissView(){
        dismiss(animated: true)
    }
    
    @objc func whichHouseImage() -> String{
        var theImage: String
        
        let numberOfPlants = myPlants.count
        
        if numberOfPlants == 0{
            theImage = "casa0.svg"
        } else if numberOfPlants == 1 {
            theImage = "casa1.svg"
        } else if numberOfPlants == 2 {
            theImage = "casa2.svg"
        } else if numberOfPlants == 3 {
            theImage = "casa3.svg"
        } else if numberOfPlants == 4 {
            theImage = "casa4.svg"
        } else {
            theImage = "casa5.svg"
        }
        
        return theImage
    }
}
