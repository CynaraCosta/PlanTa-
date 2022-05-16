//
//  CustomTableViewCellSetting.swift
//  PlanTae
//
//  Created by Cynara Costa on 15/05/22.
//

import UIKit

class CustomTableViewCellSetting: UITableViewCell {
    
    static let identifier = "CustomTableViewCellSetting"
    
    @objc func removePlant(){
        let plantName = label.text
        let plantNumber = myPlants.firstIndex(where: {$0.name == plantName})!
        myPlants.remove(at: plantNumber)
    }
    
    private let button_: UIButton = {
        let button_ = UIButton()
        let button_Image = UIImage(named: "remove.plant.svg")
        button_.frame = CGRect(x: 0, y: 0, width: 11, height: 11)
        button_.setImage(button_Image, for: .normal)
        button_.addTarget(self, action: #selector(removePlant), for: .touchUpInside)
        return button_
    }()
    
    private let image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "leaf.circle.svg")
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        return image
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = UIFont(name: "Nunito-Bold", size: 12)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        contentView.backgroundColor = .secondarySystemBackground
        
        contentView.addSubview(label)
        contentView.addSubview(image)
        //contentView.addSubview(button)
        contentView.addSubview(button_)
        
    }
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        self.contentView.layer.cornerRadius = 8
        self.contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3))
        
        button_.frame = CGRect(x: 0, y: 10, width: 12, height: 12)
        button_.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button_.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            button_.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
        
        image.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        image.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            image.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            image.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
        
        label.frame = CGRect(x: 0, y: 0, width: 70, height: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: image.leadingAnchor, constant: 48),

        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(text: String){
        label.text = text
    }
    
}
