//
//  AnalyzePlant.swift
//  PlanTae
//
//  Created by Cynara Costa on 12/05/22.
//

import Foundation
import UIKit

class AddPlant: UIViewController {

    var water: Bool = false
    var scissor: Bool = false
    var fertilizer: Bool = false
    var sunBath: Bool = false
    var insecticide: Bool = false
    
    func whichTask(row: Int){
        if row == 0 {
            water = true
        } else if row == 1 {
            scissor = true
        } else if row == 2 {
            sunBath = true
        } else if row == 3 {
            fertilizer = true
        } else {
            insecticide = true
        }
    }
    
    @objc func buttonAction(){
        let namePlant: String = returnText(nameTextField)
        let newPlant = Plant(name: namePlant, water: water, scissor: scissor, fertilizer: fertilizer, sunBath: sunBath, insecticide: insecticide)
        myPlants.append(newPlant)
        dismiss(animated: true)
    }
    
    private let tableViewAddPlant: UITableView = {
        let tableViewAddPlant = UITableView()
        tableViewAddPlant.register(CustomTableViewCellAddPlant.self, forCellReuseIdentifier: CustomTableViewCellAddPlant.identifier)
        tableViewAddPlant.backgroundColor = .clear
        tableViewAddPlant.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableViewAddPlant.allowsSelection = false
        tableViewAddPlant.isUserInteractionEnabled = true
        return tableViewAddPlant
    }()
    
    private let nameTextField:  UITextField = {
        let nameTextField = UITextField()
        nameTextField.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        nameTextField.placeholder = "Insira o nome da sua plantinha"
        nameTextField.returnKeyType = .done
        nameTextField.keyboardType = UIKeyboardType.default
        nameTextField.layer.cornerRadius = 8
        nameTextField.backgroundColor = .secondarySystemBackground
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 15
                                                       , height: 20))
        nameTextField.leftView = paddingView
        nameTextField.leftViewMode = .always
        return nameTextField
    }()
    
    private let tarefasLabel: UILabel = {
        let tarefasLabel = UILabel()
        tarefasLabel.font = UIFont(name: "Nunito-ExtraBold", size: 16)
        tarefasLabel.frame = CGRect(x: 0, y: 0, width: 40, height: 25)
        tarefasLabel.text = "Tarefas"
        tarefasLabel.textColor = UIColor(named: "verde-escuro")
        return tarefasLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .tertiarySystemBackground
        
        let nameLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 40, height: 25))
        nameLabel.font = UIFont(name: "Nunito-ExtraBold", size: 16)
        nameLabel.text = "Nome"
        nameLabel.textColor = UIColor(named: "verde-escuro")
        
        self.view.addSubview(nameLabel)
        
        self.view.addSubview(tableViewAddPlant)
        tableViewAddPlant.dataSource = self
        tableViewAddPlant.delegate = self
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 56),
            nameLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 32),
        ])
        
        nameTextField.delegate = self
        self.view.addSubview(nameTextField)
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        button.backgroundColor = UIColor(named: "verde-escuro")
        button.layer.cornerRadius = 8
        button.setTitle("Adicionar planta!", for: .normal)
        button.titleLabel?.font = UIFont(name: "Nunito-ExtraBold", size: 16)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)

        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameTextField.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 16),
            nameTextField.widthAnchor.constraint(equalToConstant: self.view.frame.width * 0.8),
            nameTextField.heightAnchor.constraint(equalToConstant: 52),
        ])
        
        self.view.addSubview(tarefasLabel)
        tarefasLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tarefasLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 24),
            tarefasLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 32),
        ])
        
        
        tableViewAddPlant.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableViewAddPlant.topAnchor.constraint(equalTo: tarefasLabel.bottomAnchor, constant: 24),
            tableViewAddPlant.widthAnchor.constraint(equalToConstant: self.view.frame.width * 0.8),
            tableViewAddPlant.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24),
            tableViewAddPlant.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -24),
            tableViewAddPlant.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -100),
            // o bottom ta meio bugado
        ])
        
        self.view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            button.topAnchor.constraint(equalTo: tableViewAddPlant.bottomAnchor, constant: 24),
            button.widthAnchor.constraint(equalTo: nameTextField.widthAnchor),
            button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            button.heightAnchor.constraint(equalToConstant: 56),
        ])
    }
}

extension AddPlant: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func returnText(_ textField: UITextField) -> String {
        let text = textField.text
        return text!
    }
}
