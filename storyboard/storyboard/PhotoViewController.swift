//
//  PhotoViewController.swift
//  storyboard
//
//  Created by Lucid Lactose on 9/25/19.
//  Copyright © 2019 Lucid Lactose. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

         // Network request snippet
//        let url = URL(string: "https://api.tumblr.com/v2/blog/humansofnewyork.tumblr.com/posts/photo?api_key=Q6vHoaVm5L1u2ZAW1fqv3Jw48gFzYVg9P0vH0VHl3GVy6quoGV")!
//        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
//        session.configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
//        let task = session.dataTask(with: url) { (data, response, error) in
//            if let error = error {
//                print(error.localizedDescription)
//            } else if let data = data,
//                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
////                print(dataDictionary)
//                // Get the dictionary from the response key
//                let responseDictionary = dataDictionary["response"] as! [String: Any]
//                // Store the returned array of dictionaries in our posts property
//                self.posts = responseDictionary["posts"] as! [[String: Any]]
//                // TODO: Get the posts and store in posts property
//
//                // TODO: Reload the table view
//                self.tableView.reloadData()
//            }
//        }

//        task.resume()
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell") as! PhotoCell
//        print("HELLO")
//        cell.label.text = "some"
        
        let cell = UITableViewCell()
        cell.textLabel?.text = "oasjda"
        
        
        return cell
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
