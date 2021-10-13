//
//  MessageCollectionViewCell.swift
//  Messenger
//
//  Created by Eduardo Peregrino on 12/10/21.
//

import UIKit

class MessageCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Views -
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(14)
        
        return label
    }()
    let messageLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(12)
        
        return label
    }()
    
    // MARK: - Init -
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func prepare(name: String, message: String) {
        nameLabel.text = name
        messageLabel.text = message
        setupViews()
    }
}

// MARK: - ViewCode -
extension MessageCollectionViewCell: ViewCode {
    func setupSubviews() {
        addSubview(nameLabel)
        addSubview(messageLabel)
    }
    
    func setupConstraints() {
        nameLabel.layout {
            $0.top == top
            $0.leading == leading + 20
        }
        
        messageLabel.layout {
            $0.top == nameLabel.bottom + 10
            $0.leading == leading + 20
        }
    }
}
