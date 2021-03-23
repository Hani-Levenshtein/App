//
//  SettingViewCell.swift
//  haniProject
//
//  Created by Hani on 2021/03/24.
//

import UIKit

class SettingViewCell: UITableViewCell {
    
    static let identifier = "SettingViewCell"
    
    private let _switch: UISwitch = {
        let _switch = UISwitch()
        _switch.onTintColor = .blue
        _switch.isOn = true
        return _switch
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.textColor = .black

        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        contentView.addSubview(label)
        contentView.addSubview(_switch)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(text: String){
        label.text = text
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        label.text = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let switchSize = _switch.sizeThatFits(contentView.frame.size)
        label.frame = CGRect(x: 5,
                                 y: 0,
                                 width: 30,
                                 height: contentView.frame.size.height - 10)
        
        _switch.frame = CGRect(x: contentView.frame.size.width-100,
                               y: (contentView.frame.size.height-switchSize.height)/2,
                               width: switchSize.width,
                               height: switchSize.height)
    }
}
