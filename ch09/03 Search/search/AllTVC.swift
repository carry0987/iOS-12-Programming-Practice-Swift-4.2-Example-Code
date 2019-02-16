//
//  AllTVC.swift
//  Search
//
//  Created by KoKang Chu on 2017/6/14.
//  Copyright © 2017年 KoKang Chu. All rights reserved.
//

import UIKit

class AllTVC: UITableViewController {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    // 需宣告為全域變數
    var searchCtrl: UISearchController!

override func viewDidLoad() {
    super.viewDidLoad()
    
    if let vc = storyboard?.instantiateViewController(withIdentifier: "result") as? ResultTVC {
        // 初始化搜尋列，並且指定搜尋結果由哪一個view controller來呈現
        searchCtrl = UISearchController(searchResultsController: vc)
        // 搜尋列具有「隨輸入隨搜尋」的功能，這裡指定哪一個 class 來處理即時搜尋
        // 這個 class 需符合 UISearchResultsUpdating 協定
        searchCtrl.searchResultsUpdater = vc
        
        // 設定搜尋列出現時背景不要變暗
        searchCtrl.dimsBackgroundDuringPresentation = false
        // 將搜尋列放到表格的標題列上
        tableView.tableHeaderView = searchCtrl.searchBar
    }
}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appDelegate.list.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        cell.textLabel?.text = appDelegate.list[indexPath.row]

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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
