//
//  TableViewController.swift
//  Project4
//
//  Created by Антон Кашников on 26.05.2023.
//

import UIKit

final class TableViewController: UITableViewController {
    private var websites = ["kodeco.com", "hackingwithswift.com"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Websites"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WebSite", for: indexPath)
        
        if #available(iOS 14.0, *) {
            var content = cell.defaultContentConfiguration()
            content.text = websites[indexPath.row]
            cell.contentConfiguration = content
        } else {
            cell.textLabel?.text = websites[indexPath.row]
        }
        
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let viewController = storyboard?.instantiateViewController(identifier: "WebView") as? WebViewController {
            viewController.selectedWebSite = websites[indexPath.row]
            viewController.availableWebsites = websites
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        websites.count
    }
}
