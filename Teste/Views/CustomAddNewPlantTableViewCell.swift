//
//  CustomAddNewPlantTableViewCell.swift
//  PlanTae
//
//  Created by Cynara Costa on 12/05/22.
//

import UIKit

class CustomAddNewPlantTableViewCell: UITableViewCell {
    
    static let identifier = "CustomAddNewPlantTableViewCell"

    private let label: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Adicionar nova planta!"
        label.font = UIFont(name: "Nunito-ExtraBold", size: 16)
        return label
    }()
    
    let image: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "addNewPlant.svg")
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        contentView.backgroundColor = UIColor(named: "verde-escuro")
        contentView.addSubview(label)
        contentView.addSubview(image)
    }
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        self.contentView.layer.cornerRadius = 8
        self.contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3))

        image.frame = CGRect(x: 0, y: 0, width: 29, height: 25)
        image.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            image.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            image.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 48),
        ])
        
        label.frame = CGRect(x: 0, y: 0, width: 187, height: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: image.leadingAnchor, constant: 48),

        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
