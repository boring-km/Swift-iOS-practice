//
//  DetailViewController.swift
//  Table
//
//  Created by kangmin on 2022/03/21.
//

import UIKit

class DetailViewController: UIViewController {

    var receiveItem = ""
    
    @IBOutlet var lblItem: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblItem.text = receiveItem
    }
    
    func receiveItem(_ item: String) {
        receiveItem = item
    }
    
}
