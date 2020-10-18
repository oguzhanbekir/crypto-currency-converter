//
//  Webservice.swift
//  CryptoCrazy
//
//  Created by Oguzhan Bekir on 8.09.2020.
//  Copyright © 2020 Oguzhan Bekir. All rights reserved.
//

import Foundation

class Webservice {
    
    func downloadCurrencies(url: URL, completion: @escaping ([CryptoCurrency]?) -> ()) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error?.localizedDescription ?? "Error")
                completion(nil)
            } else if let data = data {
                
                let cryptoList = try? JSONDecoder().decode([CryptoCurrency].self, from: data)
                if let cryptoList = cryptoList {
                    completion(cryptoList)
                }
            }
        }.resume()
    }
    
    
    
}
