//
//  ViewController.swift
//  NotificationBanner
//
//  Created by K, Senthil Kumar EX1 on 22/04/21.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBAction func presentbanner(_ sender: Any) {
        
    BannerManager.SharedInstance.showBanner(title: "Document Sent!", description: "You will receive a push notification with final document upload status", color: .red)
     
    }
    
    @IBAction func DismissBanner(_ sender: Any) {

        BannerManager.SharedInstance.hideBanner()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
  
        }
    
    override func willRotate(to toInterfaceOrientation: UIInterfaceOrientation, duration: TimeInterval) {
        //customView.frame = CGRect.init(x: 10, y: 30, width: self.view.frame.size.width-20, height: 80)

    }

  
}

