//
//  MessageCollectionViewCell.swift
//  Messenger
//
//  Created by Eduardo Peregrino on 12/10/21.
//

import UIKit

class MessageCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Views -
    lazy var leftImageBackground: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray5
        view.layer.cornerRadius = view.frame.width/2
        
        return view
    }()
    
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
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4
        
        return view
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
        addSubview(leftImageBackground)
        addSubview(nameLabel)
        addSubview(messageLabel)
        addSubview(separatorView)
    }
    
    func setupConstraints() {
        leftImageBackground.layout {
            $0.leading == leading + 20
            $0.centerY == centerY
            $0.width == 40
            $0.height == 40
        }
        
        nameLabel.layout {
            $0.top == leftImageBackground.top + 2
            $0.leading == leftImageBackground.trailing + 5
        }
        
        messageLabel.layout {
            $0.top == leftImageBackground.centerY
            $0.leading == leftImageBackground.trailing + 5
        }
        
        separatorView.layout {
            $0.leading == leading + 10
            $0.bottom == bottom
            $0.trailing == trailing - 10
            $0.height == 1
        }
    }
}
