//
//  DetailsViewController.swift
//  LearnCoreData
//
//  Created by Hamza Caylan on 28.05.2023.
//

import UIKit
import CoreData

class DetailsViewController: UIViewController,UIPickerViewDelegate,UINavigationControllerDelegate, UIImagePickerControllerDelegate  {

    @IBOutlet weak var isimTextfielt: UITextField!
    @IBOutlet weak var yazarTextField: UITextField!
    @IBOutlet weak var fiyatTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let gestureRecognaizer = UITapGestureRecognizer(target: self, action: #selector(klavyiKapat))
        view.addGestureRecognizer(gestureRecognaizer)
        
        imageView.isUserInteractionEnabled = true
        let imageGestureReconizer = UITapGestureRecognizer(target: self, action: #selector(imageTiklandi))
        imageView.addGestureRecognizer(imageGestureReconizer)
    }
    
    @objc func imageTiklandi(){
       let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        present(picker, animated: true)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true,completion: nil)
        
    }
     
    @objc func klavyiKapat() {
        view.endEditing(true)
    }
    
    @IBAction func kaydetButtonTiklandi(_ sender: Any) {
        
        let appDeleget = UIApplication.shared.delegate as! AppDelegate
        let context = appDeleget.persistentContainer.viewContext
        let liste = NSEntityDescription.insertNewObject(forEntityName: "Kitaplar", into: context)
        
        liste.setValue(isimTextfielt.text, forKey: "adi")
        liste.setValue(yazarTextField.text, forKey: "yazar")
        
        if let fiyat = Int(fiyatTextField.text!){
            liste.setValue(fiyat, forKey: "fiyat")
        }
        liste.setValue(UUID(), forKey: "uuId")
        
        let data = imageView.image?.jpegData(compressionQuality: 0.5)
        liste.setValue(data, forKey: "image")
        
        do{
            try context.save()
            print("kaydettim")

        }
        catch{
            print("sdadas")
        }

    }
    
}
