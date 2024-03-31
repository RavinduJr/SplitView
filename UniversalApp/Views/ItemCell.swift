//
//  ItemCell.swift
//  UniversalApp
//
//  Created by ravindu jayasekara on 2024-03-30.
//

import UIKit

class ItemCell: UITableViewCell {
    
    static let identifier: String = "ItemCell"
    
    let uiView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    let label: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        uiView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        
        uiView.addSubview(label)
        contentView.addSubview(uiView)
        
        let labelConstriants = [
            label.topAnchor.constraint(equalTo: uiView.topAnchor),
            label.leftAnchor.constraint(equalTo: uiView.leftAnchor)
        ]
        NSLayoutConstraint.activate(labelConstriants)
        let uiViewConstraints = [
            uiView.topAnchor.constraint(equalTo: contentView.topAnchor),
            uiView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            uiView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            uiView.leftAnchor.constraint(equalTo: contentView.leftAnchor)
        ]
    }
    
    required init?(coder: NSCoder) {
        fatalError("Error occured")
    }
    
}
