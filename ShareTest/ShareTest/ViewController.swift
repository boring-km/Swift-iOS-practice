//
//  ViewController.swift
//  ShareTest
//
//  Created by kangmin on 2022/06/30.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var shareImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func share(_ sender: Any) {
        guard let image = shareImageView.transfromToImage() else {
            return
        }
        let vc = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        vc.excludedActivityTypes = [.saveToCameraRoll] //
        present(vc, animated: true)
    }
    
    var documentsUrl: URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
    
    private func load(fileName: String) -> UIImage? {
        let fileURL = "flutter Image File URL"
        do {
            let imageData = try Data(contentsOf: URL(fileURLWithPath: fileURL))
            return UIImage(data: imageData)
        } catch {
            print("Error loading image : \(error)")
        }
        return nil
    }
}

extension UIView {
    func transfromToImage() -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(bounds.size, isOpaque, 0.0)
        defer {
            UIGraphicsEndImageContext()
        }
        if let context = UIGraphicsGetCurrentContext() {
            layer.render(in: context)
            return UIGraphicsGetImageFromCurrentImageContext()
        }
        return nil
    }
}

