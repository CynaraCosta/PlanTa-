//
//  SettingVC.swift
//  PlanTae
//
//  Created by Cynara Costa on 10/05/22.
//

import UIKit

class SettingVC: UIViewController {

    var time: Timer?
    
    public let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CustomTableViewCellSetting.self, forCellReuseIdentifier: CustomTableViewCellSetting.identifier)
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.allowsSelection = false
        tableView.isUserInteractionEnabled = true
        return tableView
    }()
    
    private let titleLabel: UILabel = {
        let titlelLabel = UILabel()
        titlelLabel.textColor = UIColor(named: "verde-escuro")
        titlelLabel.text = "Todas as suas plantas"
        titlelLabel.font = UIFont(name: "Nunito-ExtraBold", size: 25)
        return titlelLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .tertiarySystemBackground
        time = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(refresh), userInfo: nil, repeats: true)
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .clear
        
        self.view.addSubview(tableView)
        self.view.addSubview(titleLabel)
        
    // Autolayout
        
        titleLabel.frame = CGRect(x: 0, y: 0, width: 115, height: 25)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24),
            titleLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 56),
        ])
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24),
            tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 24),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -24),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -24),
            tableView.widthAnchor.constraint(equalToConstant: self.view.frame.width * 0.8),
        ])
        
}
    
    @objc func refresh(){
        tableView.reloadData()
    }

}
