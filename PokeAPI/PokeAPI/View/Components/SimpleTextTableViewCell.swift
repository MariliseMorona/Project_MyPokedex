//
//  SimpleTextTableViewCell.swift
//  PokeAPI
//
//  Created by Marilise Morona on 08/02/23.
//

import UIKit
import SnapKit

class SimpleTextTableViewCell: UITableViewCell {

    lazy var containerView: UIView = {
        let view = UIView()
        return view
    }()

    lazy var labelDescription: UILabel = {
       let label = UILabel()
        label.font = UIFont.customFont(type: .rajSemiBold, size: 22)
        label.text = "Quem é esse Pokemon?"
        label.textColor = UIColor(named: ColorsHex.pokeRed)
        return label
    }()
    
    init() {
        super.init(style: .default, reuseIdentifier: nil)
        setupViews()
        selectionStyle = .none
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SimpleTextTableViewCell: CodableView {

    func configViews() {}

    func buildViews() {
        contentView.addSubview(containerView)
        containerView.addSubview(labelDescription)
    }

    func configConstraints() {
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(5)
        }
        labelDescription.snp.makeConstraints { make in
            make.top.equalTo(containerView.snp.top).inset(3)
            make.leading.equalTo(containerView.snp.leading).inset(3)
            make.bottom.equalTo(containerView.snp.bottom).inset(3)
            make.trailing.equalTo(containerView.snp.trailing).inset(3)
        }
    }
}

