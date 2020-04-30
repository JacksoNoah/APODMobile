//
//  PhotoInfoController.swift
//  APoDDemo
//
//  Created by Paul Bonamy on 2/26/19.
//  Copyright © 2019 Paul Bonamy. All rights reserved.
//

import Foundation

struct PhotoInfoController {
 
    
    func fetchPhotoInfo(completion: @escaping (PhotoInfo?) -> Void)
    {
        let baseURL = URL(string: "https://api.nasa.gov/planetary/apod")!
        //let photoInfo = PhotoInfoController()
        //let date = PhotoInfo.Keys.date
        let query: [String: String] = [
            "api_key": "2sJS2ucSknQ3iVUZgr6JDTfAcshf10ocLpE7sJkr",
            "date" : userDate,
            ]
        
        let url = baseURL.withQueries(query)!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            let jsonDecoder = JSONDecoder()
            if let data = data,
                let photoInfo = try?
                    jsonDecoder.decode(PhotoInfo.self, from: data) {
                completion(photoInfo)
              
            } else {
                print("Either no data was returned, or data was not serialized.")
                completion(nil)
            }
            
        }
        task.resume()
    }
}
