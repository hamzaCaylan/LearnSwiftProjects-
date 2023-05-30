//
//  ViewController.swift
//  LearnCoreData
//
//  Created by Hamza Caylan on 28.05.2023.
//

import UIKit
import CoreData

class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    var isimDizisi = [String]()
    var idDizisi = [UUID]()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationController?.navigationBar.topItem?.rightBarButtonItem =
        UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(eklemeButtonTiklandi))
        
        tableView.dataSource = self
        tableView.delegate = self
        verileriAl()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(verileriAl), name: NSNotification.Name(rawValue: "kayıt alındı"), object: nil)
    }
    
    @objc func verileriAl (){
        
        isimDizisi.removeAll(keepingCapacity: false)
        idDizisi.removeAll(keepingCapacity: false)
        
        let appDeleget = UIApplication.shared.delegate as! AppDelegate
        let context = appDeleget.persistentContainer.viewContext
         
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Kitaplar")
        fetchRequest.returnsObjectsAsFaults = false
        
        do{
             let sonuclar = try context.fetch(fetchRequest)
            for sonuc in sonuclar as! [NSManagedObject]{
                if let isim = sonuc.value(forKey: "adi") as? String{
                    isimDizisi.append(isim)
                }
                
                if let id = sonuc.value(forKey: "uuId") as? UUID {
                    idDizisi.append(id)
                }
            }
            tableView.reloadData()
            
        }
        catch{}
    }
    
   
    
   @objc func eklemeButtonTiklandi(){
       performSegue(withIdentifier: "toDetailsVC", sender: nil)
            
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isimDizisi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel!.text = isimDizisi[indexPath.row]
        return cell
    }
}

