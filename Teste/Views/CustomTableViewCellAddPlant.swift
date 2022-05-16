//
//  CustomTableViewCellAnalyze.swift
//  PlanTae
//
//  Created by Cynara Costa on 12/05/22.
//

import UIKit

class CustomTableViewCellAddPlant: UITableViewCell {
    
    static let identifier = "CustomTableViewCellAddPlant"
    
    var array: [String] = []

    func makeArray(){
        var counter = 1

        while counter <= 365 {
            if counter == 1 {
                array.append("Todo dia")
            } else {
                let stringNumber = String(counter)
                array.append("A cada \(stringNumber) dias")
            }
            counter += 1
        }
    }
    
    private let pickerTextFieldInterval: UITextField = {
        let pickerTextFieldInterval = UITextField()
        pickerTextFieldInterval.backgroundColor = .systemBackground
        pickerTextFieldInterval.textColor = .label
        pickerTextFieldInterval.font = UIFont(name: "Nunito-Regular", size: 12)
        pickerTextFieldInterval.layer.cornerRadius = 8
        pickerTextFieldInterval.frame = CGRect(x: 0, y: 0, width: 0, height: 48)
        pickerTextFieldInterval.placeholder = "Escolher intervalo"
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 15
                                                       , height: 20))
        pickerTextFieldInterval.leftView = paddingView
        pickerTextFieldInterval.leftViewMode = .always
        return pickerTextFieldInterval
    }()
    
    private let pickerTextFieldLastTime: UITextField = {
        let pickerTextFieldLastTime = UITextField()
        pickerTextFieldLastTime.backgroundColor = .systemBackground
        pickerTextFieldLastTime.textColor = .label
        pickerTextFieldLastTime.font = UIFont(name: "Nunito-Regular", size: 12)
        pickerTextFieldLastTime.layer.cornerRadius = 8
        pickerTextFieldLastTime.frame = CGRect(x: 0, y: 0, width: 0, height: 48)
        pickerTextFieldLastTime.placeholder = "Escolher intervalo"
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 15
                                                       , height: 20))
        pickerTextFieldLastTime.leftView = paddingView
        pickerTextFieldLastTime.leftViewMode = .always
        return pickerTextFieldLastTime
    }()
    
    private let datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        return datePicker
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
        makeArray()
        contentView.backgroundColor = .secondarySystemBackground

        contentView.addSubview(image)
        contentView.addSubview(label)
        contentView.addSubview(intervalLabel)
        contentView.addSubview(pickerTextFieldInterval)
        contentView.addSubview(lastTimeLabel)
        contentView.addSubview(pickerTextFieldLastTime)
        
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerTextFieldInterval.inputView = pickerView
        pickerTextFieldInterval.inputAccessoryView = createToolBarInterval()
        
        pickerTextFieldLastTime.inputView = datePicker
        pickerTextFieldLastTime.inputAccessoryView = createToolBarLastTime()
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.contentView.layer.cornerRadius = 8
        self.contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4))
        
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
            intervalLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        ])
        
        
        pickerTextFieldInterval.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pickerTextFieldInterval.topAnchor.constraint(equalTo: intervalLabel.bottomAnchor, constant: 16),
            pickerTextFieldInterval.widthAnchor.constraint(equalTo: self.widthAnchor),
        ])
        
        lastTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lastTimeLabel.topAnchor.constraint(equalTo: pickerTextFieldInterval.bottomAnchor, constant: 24),
            lastTimeLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        ])
        
        pickerTextFieldLastTime.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pickerTextFieldLastTime.topAnchor.constraint(equalTo: lastTimeLabel.bottomAnchor, constant: 24),
            pickerTextFieldLastTime.widthAnchor.constraint(equalTo: self.widthAnchor),
        ])
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
    
    func createToolBarLastTime() -> UIToolbar {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressedLastTime))
        toolbar.setItems([doneBtn], animated: true)
        
        return toolbar
    }
    
    func createToolBarInterval() -> UIToolbar {
        let toolbar = UIToolbar()
        toolbar.layer.masksToBounds = true
        toolbar.layer.cornerRadius = 8
        toolbar.sizeToFit()
        
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressedInterval))
        toolbar.setItems([doneBtn], animated: true)
        
        return toolbar
    }
    
    @objc func donePressedLastTime(){
        
        let dateFormarter = DateFormatter()
        dateFormarter.dateStyle = .medium
        dateFormarter.timeStyle = .none
        
        pickerTextFieldLastTime.endEditing(true)
        pickerTextFieldLastTime.text = dateFormarter.string(from: datePicker.date)

        pickerTextFieldLastTime.resignFirstResponder()
    }
    
    @objc func donePressedInterval(){
        
        let string = pickerView.selectedRow(inComponent: 0)
        
        if string == 0 {
            pickerTextFieldInterval.text = "Todo dia"
        } else {
            pickerTextFieldInterval.text = "A cada " + String(string + 1) + " dias"
        }
        
        
        
        pickerTextFieldInterval.endEditing(true)
        pickerTextFieldInterval.resignFirstResponder()
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
    
}

