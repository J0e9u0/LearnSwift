//
//  ViewController.swift
//  SimpleTable
//
//  Created by sicmatr1x on 2019/9/15.
//  Copyright © 2019 Joe Guo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var restaurantNames = ["wafflewolf", "traif", "upstate", "teakha",
                           "royaloak", "palominoespresso", "posatelier", "petiteoyster"];
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantNames.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier,
                                                 for: indexPath)
        // Configure the cell...
        let rowName = restaurantNames[indexPath.row]
        cell.textLabel?.text = rowName
        print("rowName=", rowName)
        cell.imageView?.image = UIImage(named: rowName);
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }

}

