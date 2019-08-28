//
//  CategoriaViewController.swift
//  Proyecto-G83
//
//  Created by Academia on 8/27/19.
//  Copyright © 2019 AcademiaMoviles. All rights reserved.
//

import UIKit

class CategoriaViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var arrayCategorias = [[String:String]]()
    
    @IBOutlet weak var categoriaTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //adoptando los metodos delegados
        categoriaTableView.delegate = self
        
        //Se obtiene una instancia unica de la libreria, singleton
        arrayCategorias = DataBase.shared()?.ejecutarSelect("select * from categoria_platos") as! [[String:String]]
        
        print(arrayCategorias)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "goToPlatos"){
            if let indexPathSelected = categoriaTableView.indexPathForSelectedRow {
                let objSelected = arrayCategorias[indexPathSelected.row]
                let objDestino =  segue.destination as! PlatosTableViewController
                objDestino.paramIdc = objSelected
            }
        }
    }

    
}

extension CategoriaViewController{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayCategorias.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celdaCategoria", for: indexPath)
        
        //Obteniendo el nombre de la categoria
        let nombreCategoria = arrayCategorias[indexPath.row]["nombre_categoria"]
        
        celda.textLabel?.text = nombreCategoria
        return celda
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Seleccionó: \(indexPath.row)")
    }
    
}
