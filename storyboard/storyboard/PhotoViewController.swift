//
//  PhotoViewController.swift
//  storyboard
//
//  Created by Lucid Lactose on 9/25/19.
//  Copyright © 2019 Lucid Lactose. All rights reserved.
//

import UIKit
import AlamofireImage

class PhotoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var movies: [[String: Any]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

         // Network request snippet
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
        // This will run when the network request returns
        if let error = error {
            print(error.localizedDescription)
        } else if let data = data {
            let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]

            // TODO: Get the array of movies
            print(dataDictionary)
            // TODO: Store the movies in a property to use elsewhere
            self.movies = dataDictionary["results"] as! [[String: Any]]
            // TODO: Reload your table view data

        }
        }
        task.resume()
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
//
//        let post = movies[indexPath.row]
//          // 1.            // 2.          // 3.
//        if let photos = post["photos"] as? [[String: Any]] {
//            // photos is NOT nil, we can use it!
//            // TODO: Get the photo url
//            // 1.
//            let photo = photos[0]
//            // 2.
//            let originalSize = photo["original_size"] as! [String: Any]
//            // 3.
//            let urlString = originalSize["url"] as! String
//            // 4.
//            let url = URL(string: urlString)
//            cell.photoView.af_setImage(withURL: url!)
//        }
        let cell = UITableViewCell()
        cell.textLabel?.text = "row: \(indexPath.row)"
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        let cell = sender as! UITableViewCell
        let indexPath = tableView.indexPath(for: cell)!
        let post = movies[indexPath.row]
        let photoViewController = segue.destination as! PhotoDetailsViewController

        photoViewController.post = post
    }

}
