//
//  SearchTableViewController.swift
//  PictureColletion
//
//  Created by Никита on 27.02.2021.
//

import UIKit

class SearchTableViewController: UITableViewController {
    
    var networkManager = NetworkManager()
    var tags = [Tag]()
    private var timer: Timer?
    
    var searchsText: String = ""

    let searhController = UISearchController(searchResultsController: nil)
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchBar()
        
        networkManager.fetchTags{ [weak self] (searchResults) in
            DispatchQueue.main.async {
                self?.tags = searchResults.hottags.tag
            self?.tableView.reloadData()
            }
    }
    }
    private func setupSearchBar(){
        navigationItem.searchController = searhController
        searhController.searchBar.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tagVC = segue.destination as! ShowPictursCollectionViewController
        
        if !searchsText.isEmpty {
            tagVC.tagUrl = searchsText
            searchsText = ""
        } else {
        let indexPath = tableView.indexPathForSelectedRow!
        tagVC.tagUrl = tags[indexPath.row].content
        }


    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tags.count   
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tagIdentifier", for: indexPath)

        let tag = tags[indexPath.row]
        
        cell.textLabel?.text = tag.content
        cell.imageView?.image = UIImage(systemName:"tag")
        
        // tagUrl = String?(tag.content) ?? "lox"
 //        print("22222")
 //        print(tagUrl)

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

extension  SearchTableViewController: UISearchBarDelegate {
    
  
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
       performSegue(withIdentifier: "pickPhotoCollectionSegue", sender: nil)

    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        
        searchsText = searchText
        if searchText.isEmpty {
            searchsText = ""
        }
       // guard let cityName = textField?.text else { return }
//        if searchText != "" {
////                self.networkWeatherManager.fetchCurrentWeather(forCity: cityName)
//            let searchTexts = searchText.split(separator: " ").joined(separator: "%20")
        
        
//        timer?.invalidate()
//        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (_) in
//            self.networkService.fetchPhotos(searchText: searchText) { [weak self] (searchResults) in
//                DispatchQueue.main.async {
//                    self?.photos = searchResults.photos.photo
////                    print("!!!")
////                    print(self?.photos)
//                self?.collectionView.reloadData()
//                }
//            }
//        })
        

}
}
