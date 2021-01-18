//
//  ViewController.swift
//  Funcionarios-MVVM
//
//  Created by Fernanda Andreia Nascimento on 15/01/21.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: IBOutlets
    @IBOutlet weak var emp: UITableView!
    
    //MARK: Atributos
    private var empregadosViewModel : EmpregadosViewModel!
    private var dataSource : EmpregadosTableViewDataSource<GridFuncionariosTableViewCell, FuncionariosData>!

    //MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModelAtualiza()
    }

    
    //MARK: Métodos
    func viewModelAtualiza() {
        self.empregadosViewModel = EmpregadosViewModel()
        self.empregadosViewModel.bindFuncionarioViewModelToController = {
            self.dataSourceAtualiza()
        }
    }
    
    func dataSourceAtualiza(){
        self.dataSource = EmpregadosTableViewDataSource(identificaCelula: "cell", items: self.empregadosViewModel.empData.data, configuraCelula: { (cel, evm) in
            cel.idFuncionario.text = evm.id
            cel.nomeFuncionario.text = evm.nomeDoEmpregado
        })
        
        DispatchQueue.main.async {
            self.emp.dataSource = self.dataSource
            self.emp.reloadData()
        }
    }

}

