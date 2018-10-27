//
//  DetalhesViewController.swift
//  alexandre
//
//  Created by user144700 on 10/26/18.
//  Copyright © 2018 fiap. All rights reserved.
//

import UIKit

class DetalhesViewController: UIViewController {

    var codigoDaMarca = ""
    var idDoVeiculo = ""
    var modeloDoVeiculo =  ""
    
    @IBOutlet weak var anoLabel: UILabel!
    @IBOutlet weak var combustivelLabel: UILabel!
    @IBOutlet weak var precoLabel: UILabel!
    @IBOutlet weak var nomeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadJson()
    }
    
    func downloadJson() {
        
        // define url da api -> eu devia fazer isso em outro lugar...
        let url = "http://fipeapi.appspot.com/api/1/carros/veiculo/"+codigoDaMarca+"/"+idDoVeiculo+"/"+modeloDoVeiculo+".json"
        guard let jsonDataURL = URL (string: url) else { return }
        
        URLSession.shared.dataTask(with: jsonDataURL){ (data, response, err) in
            guard let data = data, err == nil, response != nil else {
                print ("algo deu errado")
                return
            }
            print ("Tela 4 Leu o Json em: ",url)
            
            do {
                let jsonData = try JSONDecoder().decode(FipeDetalhe.self, from: data)
                
                DispatchQueue.main.async {
                    self.anoLabel.text = jsonData.ano_modelo
                    self.combustivelLabel.text = jsonData.combustivel
                    self.precoLabel.text = jsonData.preco
                    self.nomeLabel.text = jsonData.name
                }
                
                
                
            } catch let jsonErr {
                print("Erro depois de ler o json:", jsonErr)
            }
            }.resume()
        
        return
    }
}
