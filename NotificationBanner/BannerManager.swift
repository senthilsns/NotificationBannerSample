//
//  BannerManager.swift
//  NotificationBanner
//
//  Created by K, Senthil Kumar EX1 on 23/04/21.
//

/*
 *****************************************************************************
                    BannerManager Usage Description
 *****************************************************************************
 
 Showing Banner (title,description,color)
 ----------------------------------------
 BannerManager.SharedInstance.showBanner(title: "banner Title", description: "Banner description", color: .red)
 
 Hide banner (Removing banner)
 -----------------------------
 BannerManager.SharedInstance.hideBanner()
 
 /////////////////////////////////////////////////////////////////////////////
*/

import UIKit

class BannerManager {
    
    // MARK: Shared Instance
    class var SharedInstance: BannerManager {
        struct Global {
            static let instance = BannerManager()
        }
        return Global.instance
    }
    
    private var customView = UIView()
    private var timer = Timer()
    
    // MARK: Show Banner
    func showBanner(title: String, description: String, color: UIColor) {
        
        timer.invalidate()
        let customViewWidth = (UIApplication.shared.windows.first?.rootViewController?.view.frame.size.width)! - 20
        
        customView.frame = CGRect.init(x: 10, y: 40, width: customViewWidth, height: 80)
        customView.backgroundColor = color  //give color to the view
        customView.autoresizingMask = [.flexibleWidth]
        customView.contentMode = .redraw
        let window = UIApplication.shared.windows.first
        window?.addSubview(customView)

        // Corner Radious
        customView.layer.cornerRadius = 5.0
        customView.layer.masksToBounds = false
        
        // Title Label
        let titleLbl = UILabel(frame: CGRect(x: 10, y: 5, width: self.customView.frame.size.width-20, height: 21))
        titleLbl.textAlignment = .left
        titleLbl.textColor = .white
        titleLbl.text = title // Title Text
        titleLbl.font = UIFont(name: "Helvetica-Bold", size: 15)
        customView.addSubview(titleLbl)
        
        // Description Label
        let discriptionLbl = UILabel(frame: CGRect(x: 10, y: 25, width: self.customView.frame.size.width-20, height: 40))
        discriptionLbl.textAlignment = .left
        discriptionLbl.textColor = .white
        discriptionLbl.numberOfLines = 3
        discriptionLbl.lineBreakMode = .byWordWrapping
        discriptionLbl.font = UIFont(name: "Helvetica", size: 13)
        discriptionLbl.text = description // Description text
        customView.addSubview(discriptionLbl)
        
        // View Animation
        DispatchQueue.main.async {
                UIView.animate(withDuration: 0.10, delay: 0.0, options: .transitionCurlDown, animations: {
                    self.customView.frame.origin.y = 40
                })
        }
        
        // Timer - 10 Seconds for displaying view
        timer = Timer.scheduledTimer(timeInterval: 10.0, target: self, selector: #selector(self.dismissAlert), userInfo: nil, repeats: false)
         
        // Add Gesture to view - Up,Down,Right,Left
        addSwipe()
    }
    
    @objc private func dismissAlert() {
        // Dismiss the alert from here
        customView.removeFromSuperview()
    }
    
    // MARK: Hide Banner
    func hideBanner() {
        timer.invalidate()
        customView.removeFromSuperview()
    }
    
   // MARK: Swipe Gesture
   private func addSwipe() {
        
        for direction in [UISwipeGestureRecognizer.Direction.down, .up, .left, .right] {
                let swipeGest = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(_:)))
                swipeGest.direction = direction
                self.customView.addGestureRecognizer(swipeGest)
        }
    }
    
    @objc private func swipeAction(_ gesture: UISwipeGestureRecognizer) {
        switch gesture.direction {
        case UISwipeGestureRecognizer.Direction.right:
            //Swiped right
            customView.removeFromSuperview()
            timer.invalidate()

        case UISwipeGestureRecognizer.Direction.down:
            //Swiped down
            customView.removeFromSuperview()
            timer.invalidate()

        case UISwipeGestureRecognizer.Direction.left:
            //Swiped left
            customView.removeFromSuperview()
            timer.invalidate()

        case UISwipeGestureRecognizer.Direction.up:
            //Swiped up
            customView.removeFromSuperview()
            timer.invalidate()
            
        default: break
      }

    }

}

