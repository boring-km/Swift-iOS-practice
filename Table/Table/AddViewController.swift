//
//  AddViewController.swift
//  Table
//
//  Created by kangmin on 2022/03/21.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet var tfAddItem: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func btnAddItem(_ sender: UIButton) {
        items.append(tfAddItem.text!)
        itemsImageFile.append("ic_access_alarm.png")
        tfAddItem.text = ""
        _ = navigationController?.popViewController(animated: true)
    }

}
