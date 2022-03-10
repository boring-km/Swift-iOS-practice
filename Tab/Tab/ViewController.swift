//
//  ViewController.swift
//  Tab
//
//  Created by kangmin on 2022/03/10.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func moveWebView(_ sender: UIButton) {
        tabBarController?.selectedIndex = 1
    }
    
    @IBAction func movePickerView(_ sender: UIButton) {
        tabBarController?.selectedIndex = 2
    }
}

