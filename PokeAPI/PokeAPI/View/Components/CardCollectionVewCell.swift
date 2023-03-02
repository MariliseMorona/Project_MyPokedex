//
//  CardCollectionVewCell.swift
//  PokeAPI
//
//  Created by Marilise Morona on 01/03/23.
//

import UIKit
import SnapKit

class CardCollectionVewCell: UICollectionViewCell {

    static let identifier = "CardCollectionVewCell"
    
    lazy var containerView: UIView = {
        let view = UIView()
        return view
    }()

    lazy var imgCard: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    lazy var labelDescription: UILabel = {
       let label = UILabel()
        label.font = UIFont.customFont(type: .rajSemiBold, size: 22)
        label.text = "Quem é esse Pokemon?"
        label.textColor = UIColor(named: ColorsHex.pokeRed)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
//    func bind(image: UIImage, ){
//        imgCard.image = UIImage(named: "pikachu")
//    }
}

extension CardCollectionVewCell: CodableView {

    func configViews() { }

    func buildViews() {
        contentView.addSubview(containerView)
        containerView.addSubview(imgCard)
        containerView.addSubview(labelDescription)
    }

    func configConstraints() {
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(5)
        }
        imgCard.snp.makeConstraints { make in
            make.top.equalTo(containerView.snp.top)
            make.centerX.equalTo(containerView.snp.centerX)
        }
        labelDescription.snp.makeConstraints { make in
            make.top.equalTo(imgCard.snp.bottom)
            make.leading.equalTo(imgCard.snp.leading)
            make.trailing.equalTo(imgCard.snp.trailing)
            make.bottom.equalTo(containerView.snp.bottom)
        }
    }
}

