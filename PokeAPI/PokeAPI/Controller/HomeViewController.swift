//
//  ViewController.swift
//  PokeAPI
//
//  Created by Marilise Morona on 08/02/23.
//

import UIKit

class HomeViewController: UIViewController {

    private var viewHome = Home()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewHome.tableScreen.configureTableProtocols(delegate: self, dataSource: self)
        // Do any additional setup after loading the view.
    }
    
    private func getDescriptionHeader() -> NSAttributedString {
        var text = ""
        text += "<br><b> Lista de Pokemons </b><br>"
        return text.htmlForFontWith(size: 22, color: ColorsHex.pokeRed).html2AttributedString!
    }
    private func getDescriptionList() -> NSAttributedString {
        var text = ""
        text += "<br><b> Pokemon 1 </b><br>"
        return text.htmlForFontWith(size: 22, color: ColorsHex.pokeRed).html2AttributedString!
    }
    private func getDescriptionFooter() -> NSAttributedString {
        var text = ""
        text += "<br><b> Acabaram os Pokemons </b><br>"
        return text.htmlForFontWith(size: 22, color: ColorsHex.pokeRed).html2AttributedString!
    }
}
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 1:
            return 3
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
            case 0:
            let cell = SimpleTextTableViewCell()
            cell.lblDescription.attributedText = getDescriptionHeader()
            return cell
            case 1:
            let cell = SimpleTextTableViewCell()
            cell.lblDescription.attributedText = getDescriptionList()
            return cell
            case 2:
            let cell = SimpleTextTableViewCell()
            cell.lblDescription.attributedText = getDescriptionFooter()
            return cell
        default:
            return UITableViewCell()
        }
    }
}

