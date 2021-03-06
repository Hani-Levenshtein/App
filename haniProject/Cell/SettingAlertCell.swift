//
//  SettingAlertCell.swift
//  haniProject
//
//  Created by Hani on 2021/03/24.
//

import UIKit

class SettingAlertCell: UITableViewCell {
    
    static let cellIdentifier = "SettingAlertCell"
    
    private let _switch: UISwitch = {
        let _switch = UISwitch()
        _switch.onTintColor = .blue
        _switch.isOn = true
        return _switch
    }()
    
    private let contentLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black

        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        contentView.addSubview(contentLabel)
        contentView.addSubview(_switch)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(text: String){
        contentLabel.text = text
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        contentLabel.text = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let switchSize = _switch.sizeThatFits(contentView.frame.size)
        contentLabel.frame = CGRect(x: 5,
                                 y: 0,
                                 width: 130,
                                 height: contentView.frame.size.height - 10)
        
        _switch.frame = CGRect(x: contentView.frame.size.width-100,
                               y: (contentView.frame.size.height-switchSize.height)/2,
                               width: switchSize.width,
                               height: switchSize.height)
    }
}
