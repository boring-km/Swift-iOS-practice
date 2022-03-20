//
//  TableViewController.swift
//  Table
//
//  Created by kangmin on 2022/03/21.
//

import UIKit

var items = ["온라인 쇼핑", "미라클 모닝", "매일 커밋하기"]
var itemsImageFile = ["ic_shopping_cart.png", "ic_access_alarm.png", "ic_edit.png"]

class TableViewController: UITableViewController {

    @IBOutlet var tvListView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)

        cell.textLabel?.text = items[(indexPath as NSIndexPath).row]
        cell.imageView?.image = UIImage(named: itemsImageFile[(indexPath as NSIndexPath).row])

        return cell
    }

}
