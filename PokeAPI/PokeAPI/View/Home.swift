//
//  Home.swift
//  PokeAPI
//
//  Created by Marilise Morona on 08/02/23.
//

import Foundation
import UIKit
import SnapKit

class Home: UIView {
    
    var tableScreen = SingleTableView()
    
    init() {
        super.init(frame: .zero)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension Home: CodableView {

    func configViews() {}

    func buildViews() {
        addSubview(tableScreen)
    }

    func configConstraints() {
        tableScreen.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

