//
//  EmpregadosTableViewDataSource.swift
//  Funcionarios-MVVM
//
//  Created by Fernanda Andreia Nascimento on 18/01/21.
//

import UIKit
import Foundation

class EmpregadosTableViewDataSource <CELULA: UITableViewCell, T>:
    NSObject, UITableViewDataSource {
    
    private var identificaCelula: String!
    private var items: [T]!
    private var configuraCelula: (CELULA, T) -> () = {_,_ in }
    
    init(identificaCelula: String, items: [T], configuraCelula : @escaping (CELULA, T) -> ()){
        self.identificaCelula = identificaCelula
        self.items = items
        self.configuraCelula = configuraCelula
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let celula = tableView.dequeueReusableCell(withIdentifier: identificaCelula, for: indexPath) as! CELULA
            
            let item = self.items[indexPath.row]
            self.configuraCelula(celula, item)
            
            return celula
    
    }
    
    


}
