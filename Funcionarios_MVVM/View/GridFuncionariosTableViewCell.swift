//
//  GridFuncionariosTableViewCell.swift
//  Funcionarios-MVVM
//
//  Created by Fernanda Andreia Nascimento on 15/01/21.
//

import UIKit
import Foundation

class GridFuncionariosTableViewCell: UITableViewCell {

    
    @IBOutlet weak var nomeFuncionario: UILabel!
    @IBOutlet weak var idFuncionario: UILabel!
    
    var funcionario : FuncionariosData? {
        didSet {
            guard let id = funcionario?.id else {
                print("Não foi possivel converter para String")
                return
            }
            
            idFuncionario.text = String(id)
            nomeFuncionario.text = funcionario?.nomeDoEmpregado
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
