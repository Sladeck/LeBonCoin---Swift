//
//  Cell.swift
//  LeBonCoin
//
//  Created by SUP'Internet 05 on 07/03/2018.
//  Copyright © 2018 GM. All rights reserved.
//

import Foundation
import UIKit //for UITableViewCell

class Cell : UITableViewCell {
    
    
    func showContent(obj: Dictionary<String, String>){
        
        //repeat for array obj
        let name = UILabel()
        name.text = obj["name"]
        name.textColor = .blue
        
        let image = UIImage(named: obj["picture"]!)
        let showImage = UIImageView(image: image)
        
        let price = UILabel()
        price.text = obj["price"]
        price.textColor = .red
        
        let adress = UILabel()
        adress.text = obj["adress"]
        
        let date = UILabel()
        date.text = obj["date"]
        
        
        //repeat for each and position
        self.contentView.addSubviewGrid(view: showImage, grid: ["x": 0, "y": 5, "width": 50, "height": 100])
        self.contentView.addSubviewGrid(view: name, grid: ["x": 52, "y": 4, "width": 50, "height": 20])
        self.contentView.addSubviewGrid(view: price, grid: ["x": 52, "y": 4, "width": 30, "height": 60])
        self.contentView.addSubviewGrid(view: adress, grid: ["x": 52, "y": 35, "width": 90, "height": 60])
        self.contentView.addSubviewGrid(view: date, grid: ["x": 52, "y": 60, "width": 30, "height": 60])
        
    }
    
}
