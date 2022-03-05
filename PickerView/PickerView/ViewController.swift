//
//  ViewController.swift
//  PickerView
//
//  Created by kangmin on 2022/03/05.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let MAX_ARRAY_NUM = 10
    let PICKER_VIEW_COLUMN = 1
    var imageFileName = ["Phone_GP-0029.jpg", "Phone_GP-0036.jpg", "Phone_GP-0065.jpg", "Phone_GP-0072.jpg", "Phone_GP-0095.jpg", "Phone_GP-0113.jpg", "Phone_GP-0176.jpg", "Phone_GP-0188.jpg"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COLUMN
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imageFileName.count
    }
    
    // titleForRow 인수를 가지는 Delegate 메서드
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return imageFileName[row]
    }
    
    @IBOutlet weak var pickerImage: UIPickerView!
    @IBOutlet weak var lblImageFileName: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    // PickerView를 ViewController에 Delegate 설정한다.
    // - 특정 객체와 상호 작용할 때 메시지를 넘기면 그 메시지에 대한 책임은 델리게이트로 위임된다.
    // - 사용자가 객체를 터치했을 때 해야 할 일을 delegate 메서드에 구현하고 해당 객체가 터치되었을 때 delegate가 호출되어 위임받은 일을 하게 된다.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

