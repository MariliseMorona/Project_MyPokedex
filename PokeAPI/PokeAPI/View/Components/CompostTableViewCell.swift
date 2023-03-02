//
//  CompostTableViewCell.swift
//  PokeAPI
//
//  Created by Marilise Morona on 01/03/23.
//

import UIKit
import SnapKit

class CompostTableViewCell: UITableViewCell {

    lazy var containerView: UIView = {
        let view = UIView()
        return view
    }()

    lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
        layout.itemSize = CGSize(width: 140, height: 140)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isScrollEnabled = true
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.clipsToBounds = true
        collectionView.register(CardCollectionVewCell.self, forCellWithReuseIdentifier: CardCollectionVewCell.identifier)
        return collectionView
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

extension CompostTableViewCell: CodableView {

    func configViews() {}

    func buildViews() {
        contentView.addSubview(containerView)
        containerView.addSubview(collectionView)
    }

    func configConstraints() {
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        collectionView.snp.makeConstraints { make in
            make.top.equalTo(containerView.snp.top).inset(3)
            make.leading.equalTo(containerView.snp.leading).inset(3)
            make.bottom.equalTo(containerView.snp.bottom).inset(3)
            make.trailing.equalTo(containerView.snp.trailing).inset(3)
        }

    }
}

