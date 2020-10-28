//
//  ContainerViewController.swift
//  CVTwiPush-iOS
//
//  Created by 范艺晨 on 2020/10/22.
//

import UIKit
import Foundation
import AMScrollingNavbar

class ContainerViewController: UIViewController{
    
    var twitterUsers:[TwitterUser] = []
    
    @IBOutlet var picker: MBPickerView!
    @IBOutlet weak var pickerBackground: UIView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if let navigationController = navigationController as? ScrollingNavigationController {
            //navigationController.followScrollView(tableView, delay: 50.0)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        let gradient = CAGradientLayer()
        gradient.frame = pickerBackground.bounds
        gradient.colors = [#colorLiteral(red: 0, green: 0.6575240493, blue: 0.9875523448, alpha: 1).cgColor, #colorLiteral(red: 0.3179618418, green: 0.8304620385, blue: 1, alpha: 1).cgColor]
        pickerBackground.layer.insertSublayer(gradient, at: 0)
        
        twitterUsers.insert(TwitterUser(id: 0, name: "全部",cached_avatar: UIImage(systemName: "doc.append.fill",withConfiguration: UIImage.SymbolConfiguration(pointSize: 24, weight: .medium))), at: 0)
        
        twitterUsers.insert(TwitterUser(id: 1, name: "全部木大木",cached_avatar: UIImage(systemName: "doc.append.fill",withConfiguration: UIImage.SymbolConfiguration(pointSize: 24, weight: .medium))), at: 1)
        
        twitterUsers.insert(TwitterUser(id: 2, name: "全部",cached_avatar: UIImage(systemName: "doc.append.fill",withConfiguration: UIImage.SymbolConfiguration(pointSize: 24, weight: .medium))), at: 2)
        
        twitterUsers.insert(TwitterUser(id: 3, name: "全部",cached_avatar: UIImage(systemName: "doc.append.fill",withConfiguration: UIImage.SymbolConfiguration(pointSize: 24, weight: .medium))), at: 3)
        
        picker.dataSource = self
        picker.delegate = self
        picker.allowSelectionWhileScrolling = false
        picker.selectItem(0)
    }
    

}

extension ContainerViewController:MBPickerViewDelegate,MBPickerViewDataSource{
    func image(fromLayer layer: CALayer) -> UIImage {
        UIGraphicsBeginImageContext(layer.frame.size)

        layer.render(in: UIGraphicsGetCurrentContext()!)

        let outputImage = UIGraphicsGetImageFromCurrentImageContext()

        UIGraphicsEndImageContext()

        return outputImage!
    }
    
    func pickerViewNumberOfItems(_ pickerView: MBPickerView) -> Int {
        return twitterUsers.count
    }
    
    func pickerView(_ pickerView: MBPickerView, didSelectItem item: Int) {
        return
    }
    
    func pickerView(_ pickerView: MBPickerView, viewAtItem item: Int) -> UIView {
        if let view = TwitterUserPickerCell.loadFromNib(){
            view.twitterUserAvatarImageView.layer.cornerRadius = 25
            view.twitterUserAvatarImageView.layer.masksToBounds = true
            
            if twitterUsers[item].cached_avatar != nil {
                if item != 0{
                    view.twitterUserAvatarImageView.contentMode = .scaleToFill
                } else {
                    view.twitterUserAvatarImageView.contentMode = .center
                }
                view.twitterUserAvatarImageView.image = twitterUsers[item].cached_avatar
            }
            
            view.twitterUserName.text = twitterUsers[item].name
            view.twitterUserName.font = .boldSystemFont(ofSize: 14)
            
            if pickerView.currentItem != item{
                view.twitterUserName.font = .systemFont(ofSize: 14)
            }
            
//            view.background.layer.cornerRadius = 5
//            view.background.layer.masksToBounds = true
            
            return view
        } else {
            return UIView()
        }
    }
}
