//
//  CodableView.swift
//  PokeAPI
//
//  Created by Marilise Morona on 08/02/23.
//

import Foundation
import UIKit

protocol CodableView {
    func configViews()
    func buildViews()
    func configConstraints()
}

extension CodableView {
    func setupViews() {
        configViews()
        buildViews()
        configConstraints()
    }

    func configViews() {}
}


class UICodableView: UIView, CodableView {
    init() {
        super.init(frame: .zero)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func buildViews() {
        fatalError("configConstraints has not been implemented")
    }

    func configConstraints() {
        fatalError("configConstraints has not been implemented")
    }

    func configViews() { }
}
