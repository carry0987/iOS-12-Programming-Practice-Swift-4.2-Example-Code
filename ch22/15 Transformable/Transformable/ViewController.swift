//
//  ViewController.swift
//  Transformable
//
//  Created by ChuKoKang on 2016/8/2.
//  Copyright © 2016年 ChuKoKang. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    let app = UIApplication.shared.delegate as! AppDelegate

    @IBAction func saveButton(_ sender: AnyObject) {
        let viewContext = app.persistentContainer.viewContext
        // 宣告 photo 陣列
        let photo = [Photo()]
        photo[0].image = UIImage(named: "sample")
        photo[0].title = "美麗的風景"
        
        let entity = NSEntityDescription.insertNewObject(forEntityName: "Entity", into: viewContext) as! Entity

        entity.photoObject = photo as NSObject?
        
        app.saveContext()
    }
    
    @IBAction func loadButton(_ sender: AnyObject) {
        let viewContext = app.persistentContainer.viewContext
        do {
            let allData = try viewContext.fetch(Entity.fetchRequest())
            let entity = allData.first as! Entity
            for photo in entity.photoObject as! [Photo] {
                imageView.image = photo.image
                label.text = photo.title
            }
        } catch {
            print(error)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

