//
//  APIManager.swift
//  Userdetails_iOS
//
//  Created by Rohin Madhavan on 08/02/2023.
//

import UIKit

class APIManager: NSObject {
    
    let baseURL = "http://127.0.0.1:5000/userdetails"
    
    func apiToGetProfileData(completion : @escaping (Profile) -> ()){

        guard let url = URL(string:baseURL) else {
            return
        }
     
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
            if let error = error {
                print(error)
                return
            }
            if let data = data {
                let decoder = JSONDecoder()
                if let jsonData = try? decoder.decode(UserData.self, from: data) {
                    completion(jsonData.profile)
                }
            }
        })
        task.resume()
    }
}
