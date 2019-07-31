//
//  ViewController.swift
//  Teachers
//
//  Created by Alexandr Artemov on 30/07/2019.
//  Copyright © 2019 Alexandr Artemov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var semester = ["1 семестр", "2 семестр", "3 семестр", "4 семестр", "5 семестр", "6 семестр", "7 семестр", "8 семестр"]
    
    @IBOutlet weak var teachersTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        teachersTableView.delegate = self
        teachersTableView.dataSource = self
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return semester.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = teachersTableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = semester[indexPath.row]
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            guard let indexPath = teachersTableView.indexPathForSelectedRow else { return }
            let row = semester[indexPath.row]
            let semestrVC = segue.destination as! TeachersViewController
            semestrVC.currentRows = row
        }
    }
    
}

