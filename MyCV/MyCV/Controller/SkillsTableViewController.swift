//
//  SkillsTableViewController.swift
//  MyCV
//
//  Created by Никита on 14/04/2019.
//  Copyright © 2019 Mykyta Gorbulya. All rights reserved.
//

import UIKit

class SkillsTableViewController: UITableViewController {
    
    var skills: [Skill] = [
        Skill(name: "UIKit", picture: "uikit.png"),
        Skill(name: "CoreData", picture: "coredata.png"),
        Skill(name: "Alamofire/SwiftyJSON", picture: "networking.png"),
        Skill(name: "Grand Central Dispatch", picture: "gcd.png"),
        Skill(name: "DRY, KISS, SOLID Principles", picture: "principles.png"),
        Skill(name: "MVC & MVVM", picture: "mvc.png"),
        Skill(name: "Working with GIT", picture: "github.png"),
        Skill(name: "CALayer", picture: "layer.png")
    ]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 85
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: nil, style: .plain, target: nil, action: nil)
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        title = "My Skills"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return skills.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SkillsTableViewCell
        cell.nameLabel.text = skills[indexPath.row].name
        cell.skillImageView.image = UIImage(named: skills[indexPath.row].picture)
        cell.skillImageView.clipsToBounds = true
        
        // Configure the cell...
        
        return cell
    }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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
