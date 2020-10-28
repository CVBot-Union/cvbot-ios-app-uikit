//
//  TweetListTableViewController.swift
//  CVTwiPush-iOS
//
//  Created by 范艺晨 on 2020/10/18.
//

import UIKit

class TweetListTableViewController: UITableViewController {
    //Avatar
    @IBOutlet weak var avatarImageView: UIImageView!
    
    //Username, status type and created at
    @IBOutlet weak var userRealNameLabel: UILabel!
    @IBOutlet weak var statusTypeLabel: UILabel!
    @IBOutlet weak var createdAtLabel: UILabel!
    
    //Image or video views
    /// frame of views
    @IBOutlet weak var horizontalStackView: UIStackView! //big frame
    @IBOutlet weak var leftVerticalStackView: UIStackView! //left frame
    @IBOutlet weak var rightVerticalStackView: UIStackView! //right frame
    
    ///image views
    @IBOutlet weak var leftTopImageView: UIImageView!
    @IBOutlet weak var leftBottomImageView: UIImageView!
    @IBOutlet weak var rightTopImageView: UIImageView!
    @IBOutlet weak var rightBottomImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        initView()
    }
    
    public func initView(){
        horizontalStackView.layer.cornerRadius = 5
        horizontalStackView.layer.masksToBounds = true
        
        avatarImageView.layer.cornerRadius = 21
        avatarImageView.layer.masksToBounds = true
    }
    
    public func initWith(id:Int64){
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
