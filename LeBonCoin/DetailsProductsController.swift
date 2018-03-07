//
//  DetailsProductsController.swift
//  LeBonCoin
//
//  Created by SUP'Internet 05 on 07/03/2018.
//  Copyright © 2018 GM. All rights reserved.
//

import Foundation
import UIKit


class DetailsProductsController : UIViewController{
    
    var product: [String: String] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //repeat for array obj
        let name = UILabel()
        name.text = product["name"]
        name.textColor = .blue
        
        let image = UIImage(named: product["picture"]!)
        let showImage = UIImageView(image: image)
        
        let description = UILabel()
        description.text = "Description : \(product["description"]!)"
        description.lineBreakMode = .byWordWrapping
        description.numberOfLines = 0
        
        let price = UILabel()
        price.text = "Prix : \(product["price"]!)"
        price.textColor = .red
        
        let adress = UILabel()
        adress.text = "Adresse : \(product["adress"]!)"
        
        let date = UILabel()
        date.text = "Mis en ligne le : \(product["date"]!)"
        
        let category = UILabel()
        category.text = "Catégorie : \(product["category"]!)"
        
        //repeat for each and position
        self.view.addSubviewGrid(view: showImage, grid: ["x": 0, "y": 0, "width": 100, "height": 50])
        self.view.addSubviewGrid(view: name, grid: ["x": 2, "y": 42, "width": 70, "height": 20])
        self.view.addSubviewGrid(view: price, grid: ["x": 2, "y": 35, "width": 30, "height": 40])
        self.view.addSubviewGrid(view: category, grid: ["x": 2, "y": 40, "width": 40, "height": 40])
        self.view.addSubviewGrid(view: adress, grid: ["x": 2, "y": 45, "width": 90, "height": 40])
        self.view.addSubviewGrid(view: date, grid: ["x": 2, "y": 48, "width": 100, "height": 40])
        self.view.addSubviewGrid(view: description, grid: ["x": 2, "y": 25, "width": 96, "height": 100])

        
    }
    
}
