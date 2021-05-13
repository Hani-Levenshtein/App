//
//  menuCell.swift
//  haniProject
//
//  Created by Hani on 2021/03/24.
//

import UIKit

class SettingAccountCell: UITableViewCell {
    
    static let cellIdentifier = "SettingAccountCell"
    
    private let contentLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        contentView.addSubview(contentLabel)
   
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(text: String){
        contentLabel.text = text
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentLabel.frame = CGRect(x: 5,
                                 y: 0,
                                 width: 130,
                                 height: contentView.frame.size.height - 10)
        
       
    }
}
