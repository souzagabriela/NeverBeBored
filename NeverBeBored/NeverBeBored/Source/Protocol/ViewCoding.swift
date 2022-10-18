//
//  ViewCoding.swift
//  NeverBeBored
//
//  Created by Gabriela Souza Batista on 12/10/22.
//

import Foundation

protocol ViewCoding: AnyObject {
    func setupView()
    func setupHierarchy()
    func setupConstraints()
}

extension ViewCoding {
    func buildLayout() {
        setupView()
        setupHierarchy()
        setupConstraints()
    }
}
