//
//  SearchBarTableViewCell.swift
//  PokeAPI
//
//  Created by Marilise Morona on 01/03/23.
//

import UIKit
import SnapKit

class SearchBarTableViewCell: UITableViewCell {

    lazy var containerView: UIView = {
        let view = UIView()
        return view
    }()

    lazy var searchBar: UISearchBar = {
       let search = UISearchBar()
        return search
    }()
    
    init() {
        super.init(style: .default, reuseIdentifier: nil)
        setupViews()
        selectionStyle = .none
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureSearchBarProtocols(delegate: UISearchBarDelegate) {
        self.searchBar.delegate = delegate
    }
}

extension SearchBarTableViewCell: CodableView {

    func configViews() {}

    func buildViews() {
        contentView.addSubview(containerView)
        containerView.addSubview(searchBar)
    }

    func configConstraints() {
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(5)
        }
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(containerView.snp.top).inset(3)
            make.leading.equalTo(containerView.snp.leading).inset(3)
            make.bottom.equalTo(containerView.snp.bottom).inset(3)
            make.trailing.equalTo(containerView.snp.trailing).inset(3)
        }
    }
}
