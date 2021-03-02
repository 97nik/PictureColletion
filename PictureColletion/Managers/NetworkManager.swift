//
//  NetworkManager.swift
//  PictureColletion
//
//  Created by Никита on 27.02.2021.
//

import Foundation

class NetworkManager {
    
    func fetchTags( competion: @escaping (SearchResponseTags) -> Void)  {

        let urlString = "https://api.flickr.com/services/rest/?method=flickr.tags.getHotList&api_key=cd63055762f72303292e8256d3068d31&period=day&count=10&format=json&nojsoncallback=1"


        guard let url = URL(string: urlString) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            
            if let data = data {

                let decoder = JSONDecoder()
                do {
                    let objects = try decoder.decode(SearchResponseTags.self, from: data)
                    print("objects: ", objects)
                    competion(objects)
                } catch let error as NSError {
                    print(error.localizedDescription)
                }
                
            }


        }
        task.resume()
    }
    func fetchPhoto(searchText: String, competion: @escaping (ResponePhoto) -> Void)  {

        let urlString = "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=cd63055762f72303292e8256d3068d31&tags=\(searchText)&format=json&extras=url_z,url_q&nojsoncallback=1"

        print(urlString)
        guard let url = URL(string: urlString) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            
            if let data = data {

                let decoder = JSONDecoder()
                do {
                    let objects = try decoder.decode(ResponePhoto.self, from: data)
                    print("objects: ", objects)
                    competion(objects)
                } catch let error as NSError {
                    print(error.localizedDescription)
                }
                
            }


        }
        task.resume()
    }
}
