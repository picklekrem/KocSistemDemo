//
//  Service.swift
//  KocSistemDemo
//
//  Created by Ekrem Özkaraca on 16.04.2022.
//

import Foundation
import Alamofire

class Service {
    
    func fetchData(callback : @escaping (Response) -> Void) {
        AF.request("https://itunes.apple.com/search?term=jack+johnson", method: .get, encoding: JSONEncoding.default).response { response in
            guard let data = response.data else {return}
            do {
                let response = try JSONDecoder().decode(Response.self, from: data)
                callback(response)
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }
}

