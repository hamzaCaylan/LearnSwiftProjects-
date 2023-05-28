//
//  DetailsViewController.swift
//  LearnCoreData
//
//  Created by Hamza Caylan on 28.05.2023.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var isimTextfielt: UITextField!
    @IBOutlet weak var yazarTextField: UITextField!
    @IBOutlet weak var fiyatTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let gestureRecognaizer = UITapGestureRecognizer(target: self, action: #selector(klavyiKapat))
        view.addGestureRecognizer(gestureRecognaizer)
        
    }
     
    @objc func klavyiKapat() {
        view.endEditing(true)
    }
    

    
    @IBAction func kaydetButtonTiklandi(_ sender: Any) {
    }
    
}
