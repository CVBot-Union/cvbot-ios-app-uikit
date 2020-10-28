//
//  TweetListPageViewController.swift
//  CVTwiPush-iOS
//
//  Created by 范艺晨 on 2020/10/28.
//

import UIKit

class TweetListPageViewController: UIPageViewController,UIPageViewControllerDelegate,UIPageViewControllerDataSource {
    lazy public var allViewControllers:[TweetListTableViewController] = []
    public var currentControllerIndex:Int = 0{
        didSet {
            if let parentController = self.parent as? ContainerViewController{
                parentController.isPageChanged = true
                parentController.picker.selectItem(currentControllerIndex)
                parentController.isPageChanged = false
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = allViewControllers.firstIndex(of: viewController as! TweetListTableViewController) else {
            return nil
        }
        
        if index == 0{
            return nil
        }
        
        return allViewControllers[index-1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = allViewControllers.firstIndex(of: viewController as! TweetListTableViewController) else {
            return nil
        }
        //shows the first view controller when the user swipes further from the last view controller
        if index + 1 == allViewControllers.count {
            return nil
        }
        //show the view controller after the currently displayed view controller
        return allViewControllers[index + 1]
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed,
            let visibleViewController = pageViewController.viewControllers?.first,
            let index = allViewControllers.firstIndex(of:visibleViewController as! TweetListTableViewController){
            currentControllerIndex = index
        }

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
