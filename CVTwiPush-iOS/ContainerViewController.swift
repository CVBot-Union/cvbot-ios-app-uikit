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
    var containerVC:TweetListPageViewController?
    public var isPageChanged:Bool = false
    
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
        initView()
        initData()
        initPicker()
        initContainerViews()
    }
    
    func initView(){
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        let gradient = CAGradientLayer()
        gradient.frame = pickerBackground.bounds
        gradient.colors = [#colorLiteral(red: 0, green: 0.6575240493, blue: 0.9875523448, alpha: 1).cgColor, #colorLiteral(red: 0.3179618418, green: 0.8304620385, blue: 1, alpha: 1).cgColor]
        pickerBackground.layer.insertSublayer(gradient, at: 0)
        
        let selectedIndicator = UIView(frame: CGRect(x: picker.bounds.width/2-80/2, y: picker.bounds.height/2-80/2, width: 80, height: 80))
        selectedIndicator.backgroundColor = UIColor.init(white: 1, alpha: 0.2)
        selectedIndicator.layer.cornerRadius = 5
        selectedIndicator.layer.masksToBounds = true
        
        pickerBackground.addSubview(selectedIndicator)
    }
    
    func initData(){
        //test data
        twitterUsers.insert(TwitterUser(id: 0, name: "全部",cached_avatar: UIImage(systemName: "doc.append.fill",withConfiguration: UIImage.SymbolConfiguration(pointSize: 24, weight: .medium))), at: 0)
        twitterUsers.insert(TwitterUser(id: 1, name: "全部木大木",cached_avatar: UIImage(systemName: "doc.append.fill",withConfiguration: UIImage.SymbolConfiguration(pointSize: 24, weight: .medium))), at: 1)
        twitterUsers.insert(TwitterUser(id: 2, name: "全部",cached_avatar: UIImage(systemName: "doc.append.fill",withConfiguration: UIImage.SymbolConfiguration(pointSize: 24, weight: .medium))), at: 2)
        twitterUsers.insert(TwitterUser(id: 3, name: "全部",cached_avatar: UIImage(systemName: "doc.append.fill",withConfiguration: UIImage.SymbolConfiguration(pointSize: 24, weight: .medium))), at: 3)
    }
    
    func initPicker(){
        picker.dataSource = self
        picker.delegate = self
        picker.allowSelectionWhileScrolling = false
        picker.selectItem(0)
    }
    
    func initContainerViews(){
        for user in twitterUsers{
            guard let vc = storyboard?.instantiateViewController(identifier: "timelineVC") as? TweetListTableViewController else {
                return
            }
            vc.initWith(id: user.id)
            containerVC?.allViewControllers.append(vc)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="containertoTimelinePageView"{
            if let vc = segue.destination as? TweetListPageViewController{
                self.containerVC = vc
            }
        }
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
        if !isPageChanged{
            if(item>containerVC!.currentControllerIndex && !containerVC!.allViewControllers.isEmpty){
                containerVC?.setViewControllers([containerVC!.allViewControllers[item]], direction: .forward, animated: true)
            } else if(item<containerVC!.currentControllerIndex && !containerVC!.allViewControllers.isEmpty) {
                containerVC?.setViewControllers([containerVC!.allViewControllers[item]], direction: .reverse, animated: true)
            }
        }
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
            } else {
                view.layer.shadowColor = #colorLiteral(red: 0.3703835011, green: 0.8498250842, blue: 1, alpha: 1)
                view.layer.shadowOpacity = 0.5
                view.layer.shadowOffset = CGSize(width: 1, height: 1)
            }
            
            return view
        } else {
            return UIView()
        }
    }
}
