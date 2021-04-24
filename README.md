# NotificationBannerSample


Tools : Xcode 12.4

Language : Swift 5

Purpose :

Banner show 10 Seconds and dismiss the banner with swipe(Left,Right,Up,Down)

Usage :

 Showing Banner (title,description,color)
 ----------------------------------------
 BannerManager.SharedInstance.showBanner(title: "banner Title", description: "Banner description", color: .red)
 
 
 Hide banner (Removing banner)
 -----------------------------
 BannerManager.SharedInstance.hideBanner()
