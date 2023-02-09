//
//  SimpleTextTableViewCell.swift
//  PokeAPI
//
//  Created by Marilise Morona on 08/02/23.
//

import UIKit
import SnapKit

class SimpleTextTableViewCell: UITableViewCell {

    lazy var containerView : UIView = {
        let view = UIView()
        return view
    }()

    lazy var lblDescription : UILabel = {
       let label = UILabel()
        label.font = UIFont(name: "Rajdhani-Bold", size: 16)
        return label
    }()

    lazy var uiImage : UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.isHidden = true
        return img
    }()

    private func initialConf() {
        setupViews()
        selectionStyle = .none
        clipsToBounds = true
    }

    init(header:String, size:Int = 26) {
        super.init(style: .default, reuseIdentifier: nil)
        lblDescription.attributedText = "<b>\(header)</b>"
            .htmlForFontWith(size: size, color: ColorsHex.pokeBlue, align: .left).html2AttributedString
        initialConf()
    }

    init(_ icon: String? = nil) {
        super.init(style: .default, reuseIdentifier: nil)
        if let icon = icon {
            uiImage.image = UIImage(named: icon)
            uiImage.isHidden = false
        }
        initialConf()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SimpleTextTableViewCell: CodableView {

    func configViews() {}

    func buildViews() {
        contentView.addSubview(containerView)
        containerView.addSubview(lblDescription)
        containerView.addSubview(uiImage)
    }

    func configConstraints() {
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(10)
        }

        lblDescription.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(uiImage.isHidden ? 16 : 50)
            make.top.equalToSuperview().offset(12)
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview().inset(12)
        }

        uiImage.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().offset(16)
            make.width.equalTo(25)
            make.centerY.equalTo(lblDescription.snp.centerY)
        }
    }
}

