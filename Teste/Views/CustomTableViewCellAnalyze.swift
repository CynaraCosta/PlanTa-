//
//  CustomTableViewCellAnalyze.swift
//  PlanTae
//
//  Created by Cynara Costa on 12/05/22.
//

import UIKit

class CustomTableViewCellAnalyze: UITableViewCell {
    
    static let identifier = "CustomTableViewCellAnalyze"
    
    private let button: UIButton = {
        let checkImage = UIImage(named: "check.out.svg")
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 19, height: 19)
        button.tintColor = .label
        button.setImage(checkImage, for: .normal)
        button.addTarget(self, action: #selector(didTapCheck), for: .touchUpInside)
        return button
    }()
    
    private let buttonFill: UIButton = {
        let checkImageFill = UIImage(named: "check.fill.svg")
        let buttonFill = UIButton()
        buttonFill.frame = CGRect(x: 0, y: 0, width: 19, height: 19)
        buttonFill.setImage(checkImageFill, for: .normal)
//        buttonFill.addTarget(self, action: #selector(didTapCheckFill), for: .touchUpInside)
        return buttonFill
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
        label.font = UIFont(name: "Nunito-Bold", size: 12)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        contentView.backgroundColor = .secondarySystemBackground
        
        contentView.addSubview(button)
        contentView.addSubview(buttonFill)
        contentView.addSubview(image)
        contentView.addSubview(label)
        
        buttonFill.isHidden = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.contentView.layer.cornerRadius = 8
        self.contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3))
        
        image.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            image.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            image.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
        ])
        
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 12),
        ])
        
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
        ])
        
        buttonFill.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonFill.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            buttonFill.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
        ])
        
    }
    
    @objc func didTapCheck(){
        button.isHidden = true
        buttonFill.isHidden = false
        
        if label.text == "Água" {
            
        } else if label.text == "Corte" {
            
        } else if label.text == "Banho de Sol" {
            
        } else if label.text == "Fertilizante" {
            
        } else {
            
        }
        
    }
    
    @objc func didTapCheckFill(){
        buttonFill.isHidden = true
        button.isHidden = false
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
