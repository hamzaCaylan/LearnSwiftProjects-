//
//  ViewController.swift
//  LearnCoreData
//
//  Created by Hamza Caylan on 28.05.2023.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationController?.navigationBar.topItem?.rightBarButtonItem =
        UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(eklemeButtonTiklandi))
    }
   @objc func eklemeButtonTiklandi(){
       performSegue(withIdentifier: "toDetailsVC", sender: nil)
            
        }
}

