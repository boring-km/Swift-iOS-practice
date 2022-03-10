//
//  ViewController.swift
//  PageControl
//
//  Created by kangmin on 2022/03/09.
//

import UIKit

var images = ["Phone_GP-0029.jpg", "Phone_GP-0036.jpg", "Phone_GP-0065.jpg", "Phone_GP-0072.jpg", "Phone_GP-0095.jpg", "Phone_GP-0113.jpg", "Phone_GP-0176.jpg", "Phone_GP-0188.jpg"]
class ViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageControl.numberOfPages = images.count
        pageControl.currentPage = 0
        
        pageControl.pageIndicatorTintColor = UIColor.green
        pageControl.currentPageIndicatorTintColor = UIColor.red
        
        imageView.image = UIImage(named: images[0])
    }


    @IBAction func changePage(_ sender: UIPageControl) {
        imageView.image = UIImage(named: images[pageControl.currentPage])
    }
}

