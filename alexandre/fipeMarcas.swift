//
//  fipeMarcas.swift
//  alexandre
//
//  Created by user144700 on 10/23/18.
//  Copyright © 2018 fiap. All rights reserved.
//

import Foundation

class FipeMarcas: Codable {
    let marcas: [FipeMarca]
    init (marcas: [FipeMarca]) { self.marcas = marcas }
}

class FipeMarca: Codable {
    var name: String
    var fipe_name: String
    var order: Int
    var key: String
    var id: Int
    
    init(name: String, fipe_name: String, order: Int, key: String, id: Int) {
        self.name = name
        self.fipe_name = fipe_name
        self.order = order
        self.key = key
        self.id = id
    }
}

class FipeVeiculo: Codable {
    let fipe_marca, name, marca, key: String
    let id, fipe_name: String
   
    init(fipe_marca: String, name: String, marca: String, key: String, id: String, fipe_name: String) {
        self.fipe_marca = fipe_marca
        self.name = name
        self.marca = marca
        self.key = key
        self.id = id
        self.fipe_name = fipe_name
    }
}

class FipeModelo: Codable {
    let fipe_codigo, name, key, veiculo: String
    let id: String
    
    init(fipe_codigo: String, name: String, key: String, veiculo: String, id: String) {
        self.fipe_codigo = fipe_codigo
        self.name = name
        self.key = key
        self.veiculo = veiculo
        self.id = id
    }
}

class FipeDetalhe: Codable {
    let id, ano_modelo, marca, name: String
    let veiculo, preco, combustivel, referencia: String
    let fipe_codigo, key: String
    
    init(id: String, ano_modelo: String, marca: String, name: String, veiculo: String, preco: String, combustivel: String, referencia: String, fipe_codigo: String, key: String) {
        self.id = id
        self.ano_modelo = ano_modelo
        self.marca = marca
        self.name = name
        self.veiculo = veiculo
        self.preco = preco
        self.combustivel = combustivel
        self.referencia = referencia
        self.fipe_codigo = fipe_codigo
        self.key = key
    }
}
