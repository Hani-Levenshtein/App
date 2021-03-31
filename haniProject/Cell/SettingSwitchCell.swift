//
//  menuCell.swift
//  haniProject
//
//  Created by Hani on 2021/03/24.
//

import UIKit

class SettingSwitchCell: UITableViewCell {
    
    static let identifier = "SettingSwitchCell"
    
    private let rightSwitch: UISwitch = {
        let _switch = UISwitch()
        _switch.onTintColor = .blue
        _switch.isOn = true
        return _switch
    }()
    
    private let leftLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        contentView.addSubview(leftLabel)
        contentView.addSubview(rightSwitch)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(text: String){
        leftLabel.text = text
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        leftLabel.text = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let switchSize = rightSwitch.sizeThatFits(contentView.frame.size)
        leftLabel.frame = CGRect(x: 5,
                                 y: 0,
                                 width: 30,
                                 height: contentView.frame.size.height - 10)
        
        rightSwitch.frame = CGRect(x: contentView.frame.size.width-100,
                               y: (contentView.frame.size.height-switchSize.height)/2,
                               width: switchSize.width,
                               height: switchSize.height)
    }
}
