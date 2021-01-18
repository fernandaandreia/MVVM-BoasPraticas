//
//  EmpregadosViewModel.swift
//  Funcionarios-MVVM
//
//  Created by Fernanda Andreia Nascimento on 15/01/21.
//

import UIKit

class EmpregadosViewModel: NSObject {
    
    private var apiService : API!
       private(set) var empData : Funcionarios! {
           didSet {
               self.bindFuncionarioViewModelToController()
           }
       }
       
       var bindFuncionarioViewModelToController : (() -> ()) = {}
       
       override init() {
           super.init()
           self.apiService =  API()
        chamadaFuncRecuperaFuncionario()
       }
       
       func chamadaFuncRecuperaFuncionario() {
           self.apiService.requisicaoAPIFuncionarios { (empData) in
               self.empData = empData
           }
       }

}
