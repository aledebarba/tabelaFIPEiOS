//
//  MarcasViewController.swift
//  alexandre
//
//  Created by user144700 on 10/23/18.
//  Copyright © 2018 fiap. All rights reserved.
//

import UIKit

class MarcasViewController: UIViewController {

    @IBOutlet weak var tabelaFipe: UITableView!
    final let url = URL(string: "http://fipeapi.appspot.com/api/1/carros/marcas.json")
    private var jsonData:[FipeMarca] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadJson()
       
    }
    
    func downloadJson() {
        
        guard let jsonDataURL = url else { return }
        
        URLSession.shared.dataTask(with: jsonDataURL){ (data, response, err) in
            guard let data = data, err == nil, response != nil else {
                print ("algo deu errado")
                return
            }
            do {
                let downloadedData = try JSONDecoder().decode([FipeMarca].self, from: data)
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

extension MarcasViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jsonData.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "fipeDataCell") as? fipeCell else { return UITableViewCell() }
            cell.dataCellLabel.text = jsonData[indexPath.row].fipe_name
            return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "veiculosVC") as? VeiculosViewController
        let id = String(jsonData[indexPath.row].id)
        vc?.codigoDaMarca = id
        vc?.title = jsonData[indexPath.row].fipe_name
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}
