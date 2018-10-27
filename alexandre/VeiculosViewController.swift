//
//  VeiculosViewController.swift
//  alexandre
//
//  Created by user144700 on 10/26/18.
//  Copyright © 2018 fiap. All rights reserved.
//

import UIKit

class VeiculosViewController: UIViewController {

    @IBOutlet weak var tabelaFipe: UITableView!
    var codigoDaMarca = ""
  
    private var jsonData:[FipeVeiculo] = []
   
    override func viewDidLoad() {
        super.viewDidLoad()
       
        downloadJson()
        
    }
    
    func downloadJson() {
        
        let url = "http://fipeapi.appspot.com/api/1/carros/veiculos/"+codigoDaMarca+".json"
        guard let jsonDataURL = URL (string: url) else { return }
        
        URLSession.shared.dataTask(with: jsonDataURL){ (data, response, err) in
            guard let data = data, err == nil, response != nil else {
                print ("algo deu errado")
                return
            }
            print ("Tela 2 Leu o Json em: ",url)
            
            do {
                let downloadedData = try JSONDecoder().decode([FipeVeiculo].self, from: data)
                self.jsonData = downloadedData
                DispatchQueue.main.async {
                    self.tabelaFipe.reloadData()
                }
                
                
            } catch let jsonErr {
                print("Erro depois de ler o json:", jsonErr)
            }
            }.resume()
        
        return
    }
    

}

extension VeiculosViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jsonData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "veiculosCell") as? veiculosCellTableViewCell else { return UITableViewCell() }
        cell.cellLabel.text = jsonData[indexPath.row].fipe_name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "modelosVC") as? ModelosViewController
        
        vc?.codigoDaMarca = codigoDaMarca
        vc?.idDoVeiculo = jsonData[indexPath.row].id
        vc?.title = jsonData[indexPath.row].fipe_name        
        
        self.navigationController?.pushViewController(vc!, animated: true)
       
    }
}
