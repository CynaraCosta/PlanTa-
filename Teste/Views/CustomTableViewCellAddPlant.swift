//
//  CustomTableViewCellAnalyze.swift
//  PlanTae
//
//  Created by Cynara Costa on 12/05/22.
//

import UIKit

class CustomTableViewCellAddPlant: UITableViewCell {
    
    static let identifier = "CustomTableViewCellAddPlant"
    
    let array: [String] = ["teste1", "teste2", "teste3"]
    
    private let pickerTextField: UITextField = {
        let pickerTextField = UITextField()
        pickerTextField.backgroundColor = .systemBackground
        pickerTextField.textColor = .label
        pickerTextField.layer.cornerRadius = 8
        return pickerTextField
    }()
    
    private let pickerView: UIPickerView = {
        let pickerView = UIPickerView()
        return pickerView
    }()
    
    private let intervalLabel: UILabel = {
        let intervalLabel = UILabel()
        intervalLabel.textColor = .label
        intervalLabel.text = "Intervalo desejado"
        intervalLabel.font = UIFont(name: "Nunito-Regular", size: 12)
        return intervalLabel
    }()
    
    private let lastTimeLabel: UILabel = {
        let lastTimeLabel = UILabel()
        lastTimeLabel.textColor = .label
        lastTimeLabel.text = "Última aplicação"
        lastTimeLabel.font = UIFont(name: "Nunito-Regular", size: 12)
        return lastTimeLabel
    }()
    
//    private let switchButton: UISwitch = {
//        let switchButton = UISwitch()
//        switchButton.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
//        switchButton.setOn(false, animated: true)
//        return switchButton
//    }()
    
    private let image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "sol.svg")
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        return image
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.text = "Banho de sol"
        label.font = UIFont(name: "Nunito-Bold", size: 14)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        contentView.backgroundColor = .secondarySystemBackground

        contentView.addSubview(image)
        contentView.addSubview(label)
        contentView.addSubview(intervalLabel)
        contentView.addSubview(pickerTextField)
        contentView.addSubview(pickerView)
        
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerTextField.inputView = pickerView        
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.contentView.layer.cornerRadius = 8
        self.contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3))
        
        image.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            image.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
        ])
        
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            label.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 12),
        ])
        
        
        intervalLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            intervalLabel.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 16),
            //intervalLabel.leadingAnchor.constraint(equalTo: image.leadingAnchor),
            intervalLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        ])
        
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pickerView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        ])
        
        pickerTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pickerTextField.topAnchor.constraint(equalTo: intervalLabel.bottomAnchor, constant: 16),
            pickerTextField.widthAnchor.constraint(equalTo: self.widthAnchor),
        ])
        
//        switchButton.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            switchButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
//            switchButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
//        ])
        
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    public func configure(text: String, imageName: String){
        label.text = text
        image.image = UIImage(named: imageName)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        label.text = nil
        image.image = nil
    }
    
}

extension CustomTableViewCellAddPlant: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return array.count
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let labelTitle: UILabel = UILabel()
        labelTitle.text = array[row]
        labelTitle.textColor = .label
        
        return labelTitle
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerTextField.text = array[row]
        pickerTextField.resignFirstResponder()
    }
    
}

