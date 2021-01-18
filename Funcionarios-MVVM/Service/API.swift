//
//  API.swift
//  Funcionarios-MVVM
//
//  Created by Fernanda Andreia Nascimento on 15/01/21.
//

import Foundation

class API :  NSObject {
    
    private let urlAPI = URL(string: "https://dummy.restapiexample.com/api/v1/employees")!
    
    func requisicaoAPIFuncionarios(completion: @escaping (Funcionarios) -> ()){
        URLSession.shared.dataTask(with: urlAPI) { (data, URLResponse, error) in
            
            guard let retorno = data, error == nil else {
                print("Erro ao recuperar dados")
                return
            }
            
            do {
                 let dadosFuncionarios = try JSONDecoder().decode(Funcionarios.self, from: retorno)
                 completion(dadosFuncionarios)
                
            } catch let parseError {
                print("Erro -> \(parseError)")
            }
        }.resume()
    }
}
