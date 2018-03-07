//
//  ViewController.swift
//  LeBonCoin
//
//  Created by SUP'Internet 05 on 07/03/2018.
//  Copyright © 2018 GM. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var products = [
        ["picture": "baguette.jpg", "description": "Deux paires de baguettes japonaise", "price": "30€", "name": "Baguettes Japonaise", "adress": "12 rue du chemin de fer", "date": "10/04/18", "category": "objets"],
        ["picture": "masque.jpg", "description": "Un masque Shogun d'une qualité incroyable", "price": "300€", "name": "Masque Shogun", "adress": "Minato-Ku", "date": "28/12/17", "category": "objets"],
        ["picture": "ombrelle.jpg", "description": "Une belle ombrelle japonaise noir et beige, parfait pour l'été", "price": "80€", "name": "Ombrelle", "adress": "10bis Avenue Bosch", "date": "05/02/18", "category": "objets"],
        ["picture": "kitkat.jpg", "description": "Des Kit-kat Japonais goût fraise !", "price": "2€", "name": "Kit-kat goût fraise", "adress": "7 rue Michel Grenier", "date": "11/08/17", "category": "nourriture"]
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.products.count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("Coucou")
        let cell = tableView.dequeueReusableCell(withIdentifier: "tagCell", for: indexPath) as? Cell
        
        cell?.showContent(obj: self.products[indexPath.row])
        return cell!
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! DetailsProductsController
        let index = self.tableView.indexPathForSelectedRow?.row
        controller.product = self.products[index!]
    }
    


}

class Grid {
    var height: CGFloat
    var width: CGFloat
    
    init (width: CGFloat, height: CGFloat) {
        self.height = height
        self.width = width
    }
}

extension UIView {
    private struct Keys {
        static var key : Int = 0
    }
    
    var grid: Grid? {
        get {
            if(objc_getAssociatedObject(self, &UIView.Keys.key) != nil) {
                return objc_getAssociatedObject(self, &UIView.Keys.key) as? Grid
            }
            return Grid(width: 100, height: 100)
        }
        set {
            objc_setAssociatedObject(self, &UIView.Keys.key, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    func addSubviewGrid(view: UIView, grid: Dictionary<String, CGFloat>) {
        let width = (self.frame.width / (self.grid?.width)!) * grid["width"]!
        let height = (self.frame.height / (self.grid?.height)!) * grid["height"]!
        let startX = (self.frame.width / (self.grid?.width)!) * grid["x"]!
        let startY = (self.frame.height / (self.grid?.height)!) * grid["y"]!
        view.frame = CGRect(x: startX, y: startY, width: width, height: height)
        self.addSubview(view)
    }
}


