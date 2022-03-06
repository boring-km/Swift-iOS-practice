//
//  ViewController.swift
//  Alert
//
//  Created by kangmin on 2022/03/06.
//

import UIKit

class ViewController: UIViewController {
    
    let onImage = UIImage(named: "lamp-on.png")
    let offImage = UIImage(named: "lamp-off.png")
    let nilImage = UIImage(named: "lamp-remove.png")
    var isLampOn = true
    
    @IBOutlet var lampImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lampImage.image = onImage
    }
    
    fileprivate func showOnAlert() {
        
        let title = "경고"
        let message = "현재 On 상태입니다"
        
        let lampAlert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: UIAlertController.Style.alert)
        let action = UIAlertAction(
            title: "네",
            style: UIAlertAction.Style.default,
            handler: nil)
        
        addAlertActions(lampAlert, action)
        
        present(lampAlert, animated: true, completion: nil)
    }
    
    fileprivate func showOffAlert() {
        
        let title = "램프 끄기"
        let message = "램프를 끄시겠습니까?"
        
        let lampAlert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let offAction = UIAlertAction(
            title: "네",
            style: UIAlertAction.Style.default,
            handler: {
                ACTION in self.lampImage.image = self.offImage
                self.isLampOn = false
            })
        let cancelAction = UIAlertAction(
            title: "아니오",
            style: UIAlertAction.Style.default,
            handler: nil)
        
        addAlertActions(lampAlert, offAction, cancelAction)
        
        present(lampAlert, animated: true, completion: nil)
    }
    
    @IBAction func turnOn(_ sender: UIButton) {
        if isLampOn {
            showOnAlert()
        } else {
            lampImage.image = onImage
            isLampOn = true
        }
    }
    
    @IBAction func turnOff(_ sender: Any) {
        if isLampOn {
            showOffAlert()
        }
    }
    
    @IBAction func removeImage(_ sender: Any) {
        let removeAlert = UIAlertController(
            title: "램프 제거",
            message: "램프를 제거하시겠습니까?",
            preferredStyle: UIAlertController.Style.alert)
        let offAction = UIAlertAction(
            title: "아니오, 끕니다.",
            style: UIAlertAction.Style.default,
            handler: {
                ACTION in self.lampImage.image = self.offImage
                self.isLampOn = false
            })
        let onAction = UIAlertAction(
            title: "아니오, 켭니다.",
            style: UIAlertAction.Style.default,
            handler: {
                ACTION in self.lampImage.image = self.onImage
                self.isLampOn = true
            })
        let removeAction = UIAlertAction(
            title: "네, 제거합니다.",
            style: UIAlertAction.Style.destructive,
            handler: {
                ACTION in self.lampImage.image = self.nilImage
                self.isLampOn = false
            })
        addAlertActions(removeAlert, offAction, onAction, removeAction)
        
        present(removeAlert, animated: true, completion: nil)
    }
    
    // 내가 추가한 커스텀 코드
    fileprivate func addAlertActions(_ controller: UIAlertController, _ actions: UIAlertAction...) {
        
        for action in actions {
            controller.addAction(action)
        }
    }
}

