//
//  ModelosViewController.swift
//  alexandre
//
//  Created by user144700 on 10/26/18.
//  Copyright © 2018 fiap. All rights reserved.
//

import UIKit

class ModelosViewController: UIViewController {

    
    @IBOutlet weak var tabelaFipe: UITableView!
    
    var codigoDaMarca = ""
    var idDoVeiculo = ""
    
    private var jsonData:[FipeModelo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        downloadJson()
        
    }
    
    func downloadJson() {
        // define url da api -> eu devia fazer isso em outro lugar...
        let url = "http://fipeapi.appspot.com/api/1/carros/veiculo/"+codigoDaMarca+"/"+idDoVeiculo+".json"
        
        guard let jsonDataURL = URL (string: url) else { return }
        
        URLSession.shared.dataTask(with: jsonDataURL){ (data, response, err) in
            guard let data = data, err == nil, response != nil else {
                print ("algo deu errado")
                return
            }
            print ("Tela 3 Leu o Json em: ",url)
            
            do {
                let downloadedData = try JSONDecoder().decode([FipeModelo].self, from: data)
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

extension ModelosViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jsonData.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "modelosCell") as? modelosCellTableViewCell else { return UITableViewCell() }
        cell.cellLabel.text = jsonData[indexPath.row].name;
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "detalhesVC") as? DetalhesViewController
        
        vc?.codigoDaMarca = codigoDaMarca
        vc?.idDoVeiculo = idDoVeiculo
        vc?.modeloDoVeiculo = jsonData[indexPath.row].id
        
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
}
