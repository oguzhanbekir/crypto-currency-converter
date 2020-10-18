//
//  CryptoViewModel.swift
//  CryptoCrazy
//
//  Created by Oguzhan Bekir on 8.09.2020.
//  Copyright © 2020 Oguzhan Bekir. All rights reserved.
//

import Foundation

struct CryptoListViewModel {
    let cryptoCurrencyList : [CryptoCurrency]
    
    func numberOfRowsInSection() -> Int {
        return self.cryptoCurrencyList.count
    }
    
    func cryptoAtIndex(_ index: Int) -> CryptoViewModel {
        let crypto = self.cryptoCurrencyList[index]
        return CryptoViewModel(cryptoCurrency: crypto)
    } 
}

extension CryptoListViewModel {
  /*  func numberOfRowsInSection() -> Int {
        return self.cryptoCurrencyList.count
    }
    
    func cryptoAtIndex(_ index: Int) -> CryptoViewModel {
        let crypto = self.cryptoCurrencyList[index]
        return CryptoViewModel(cryptoCurrency: crypto)
    } */
}

struct CryptoViewModel {
    let cryptoCurrency : CryptoCurrency
    
    var name : String {
        return self.cryptoCurrency.currency
    }
    var price : String {
        return self.cryptoCurrency.price
    }
}


extension CryptoViewModel {
   /* var name : String {
        return self.cryptoCurrency.currency
    }
    var price : String {
        return self.cryptoCurrency.price
    } */
}
