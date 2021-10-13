//
//  ViewCode.swift
//  Messenger
//
//  Created by Eduardo Peregrino on 12/10/21.
//

import Foundation

protocol ViewCode {
    func setupViews()
    func setupSubviews()
    func setupConstraints()
}

extension ViewCode {
    func setupViews() {
        setupSubviews()
        setupConstraints()
    }
}
