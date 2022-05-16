//
//  AnalyzePlant.swift
//  PlanTae
//
//  Created by Cynara Costa on 12/05/22.
//

import Foundation
import UIKit

class AddPlant: UIViewController {
        
    @objc func buttonAction(){
        let namePlant: String = returnText(nameTextField)
        let newPlant = Plant(name: namePlant, water: true, scissor: true, fertilizer: true, sunBath: true, insecticide: true)
        myPlants.append(newPlant)
        dismiss(animated: true)
    }
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .tertiarySystemBackground
        
        let nameLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 40, height: 25))
        nameLabel.font = UIFont(name: "Nunito-Bold", size: 15)
        nameLabel.text = "Nome"
        nameLabel.textColor = UIColor(named: "verde-escuro")
        
        self.view.addSubview(nameLabel)
        
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

        self.view.addSubview(button)
        
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameTextField.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 16),
            nameTextField.widthAnchor.constraint(equalToConstant: self.view.frame.width * 0.8),
            nameTextField.heightAnchor.constraint(equalToConstant: 52),
        ])
        
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            button.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 24),
            button.widthAnchor.constraint(equalTo: nameTextField.widthAnchor),
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
