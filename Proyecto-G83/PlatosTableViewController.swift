//
//  PlatosTableViewController.swift
//  Proyecto-G83
//
//  Created by Academia on 8/27/19.
//  Copyright © 2019 AcademiaMoviles. All rights reserved.
//

import UIKit

class PlatosTableViewController: UITableViewController {

    var arrayPlatos = [[String:String]]()
    var paramIdc = [String:String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("param: ", paramIdc)
        
        let idc = paramIdc["id_categoria"] ?? "1"
        arrayPlatos = DataBase.shared()?.ejecutarSelect("select * from platos_comidas where id_categoria = '\(idc)'") as! [[String:String]]
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return arrayPlatos.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celdaPlato", for: indexPath)
    
        //recuperando el nombre del plato
        let nombrePlato = arrayPlatos[indexPath.row]["nombre_plato"]
        let precioPlato = arrayPlatos[indexPath.row]["precio_plato"]
        let descripcionPlato = arrayPlatos[indexPath.row]["descripcion_plato"]
        let archivoPlato = arrayPlatos[indexPath.row]["archivo_plato"] ?? "avatar"
        
        celda.textLabel?.text = nombrePlato
        celda.detailTextLabel?.text = descripcionPlato
        celda.imageView?.image = UIImage(named: archivoPlato)
        
        return celda
    }
    
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
