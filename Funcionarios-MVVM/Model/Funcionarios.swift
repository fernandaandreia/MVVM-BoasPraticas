//
//  Funcionarios.swift
//  Funcionarios-MVVM
//
//  Created by Fernanda Andreia Nascimento on 15/01/21.
//

import Foundation

// MARK: - Funcionarios

struct Funcionarios: Decodable {
    let status: String
    let data: [FuncionariosData]
}

// MARK: - DadosFuncionarios
struct FuncionariosData: Decodable {
    let id, nomeDoEmpregado, salarioDoEmpregado, idadeDoEmpregado: String
    let fotoPerfil: String

    enum CodingKeys: String, CodingKey {
        case id
        case nomeDoEmpregado = "employee_name"
        case salarioDoEmpregado = "employee_salary"
        case idadeDoEmpregado = "employee_age"
        case fotoPerfil = "profile_image"
    }
}
