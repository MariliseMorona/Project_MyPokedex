//
//  ViewController.swift
//  PokeAPI
//
//  Created by Marilise Morona on 08/02/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    private var tableScreen = SingleTableView()
    private var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableScreen.configureTableProtocols(delegate: self, dataSource: self)
    }
    
    override func loadView() {
        view = tableScreen
    }
    
    private func getDescriptionHeader() -> NSAttributedString {
        var text = ""
        text += "<span style=\"font-weight:bold;\"> Pokemons </span>"
        return text.htmlForFontWith(size: 22, color: ColorsHex.pokeRed, type: .rajSemiBold).html2AttributedString!
    }
    
    private func getDescriptionCard() -> NSAttributedString {
        var text = ""
        text += "<span style=\"font-weight:bold;\"> Pikachu </span>"
        return text.htmlForFontWith(size: 22, color: ColorsHex.pokeRed, type: .rajLight).html2AttributedString!
    }
    
    private func getDescriptionFooter() -> NSAttributedString {
        var text = ""
        text += "<span style=\"font-weight:bold;\"> Capture novos Pokemons </span>"
        return text.htmlForFontWith(size: 22, color: ColorsHex.pokeRed, type: .rajMedium).html2AttributedString!
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        switch section {
//        case 1:
//            return 1
//        default:
            return 1
//        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = SimpleTextTableViewCell()
            cell.labelDescription.attributedText = getDescriptionHeader()
            cell.containerView.layer.borderColor = UIColor(named: ColorsHex.pokeBlue)?.cgColor
            cell.containerView.layer.borderWidth = 1
            return cell
        case 1:
            let cell = CompostTableViewCell()
            cell.collectionView.delegate = self
            cell.collectionView.dataSource = self
            collectionView = cell.collectionView
            return cell
        case 2:
            let cell = SearchBarTableViewCell()
            cell.configureSearchBarProtocols(delegate: self)
            return cell
        case 3:
            let cell = CompostTableViewCell()
            cell.collectionView.delegate = self
            cell.collectionView.dataSource = self
            collectionView = cell.collectionView
            return cell
        case 4:
            let cell = CompostTableViewCell()
            cell.collectionView.delegate = self
            cell.collectionView.dataSource = self
            collectionView = cell.collectionView
            return cell
        case 5:
            let cell = SimpleTextTableViewCell()
            cell.labelDescription.attributedText = getDescriptionFooter()
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {  
        case 1, 3, 4:
            return 150
        default:
            return UITableView.automaticDimension
        }
    }
}

extension HomeViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCollectionVewCell.identifier, for: indexPath)
            as? CardCollectionVewCell else { return UICollectionViewCell() }
        cell.imgCard.image = UIImage(named: "pikachu")
        cell.labelDescription.attributedText = getDescriptionCard()
        cell.containerView.layer.borderColor = UIColor(named: ColorsHex.pokeBlue)?.cgColor
        cell.containerView.layer.borderWidth = 1
        cell.containerView.layer.cornerRadius = 20
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("printando")
    }
}

extension HomeViewController: UISearchBarDelegate {
    
}
