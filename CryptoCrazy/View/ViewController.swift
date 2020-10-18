//
//  ViewController.swift
//  CryptoCrazy
//
//  Created by Oguzhan Bekir on 8.09.2020.
//  Copyright © 2020 Oguzhan Bekir. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    private var cryptoListViewModel : CryptoListViewModel!
    
    var colorArray = [UIColor]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        self.colorArray = [
        UIColor(red: 35/255, green: 150/255, blue: 88/255, alpha: 1),
        UIColor(red: 78/255, green: 148/255, blue: 77/255, alpha: 1),
        UIColor(red: 68/255, green: 198/255, blue: 111/255, alpha: 1),
        UIColor(red: 156/255, green: 10/255, blue: 242/255, alpha: 1),
        UIColor(red: 201/255, green: 1/255, blue: 99/255, alpha: 1),
        UIColor(red: 67/255, green: 99/255, blue: 123/255, alpha: 1)

        ]
            
        
        getData()
    }
    func getData() {
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!
        Webservice().downloadCurrencies(url: url) { (cryptos) in
            if let cryptos = cryptos {
                self.cryptoListViewModel = CryptoListViewModel(cryptoCurrencyList: cryptos)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cryptoListViewModel == nil ? 0 : self.cryptoListViewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CryptoCell", for: indexPath) as! CryptoTableViewCell
        let cryptoViewModel = self.cryptoListViewModel.cryptoAtIndex(indexPath.row)
        cell.priceText.text = cryptoViewModel.price
        cell.currencyText.text = cryptoViewModel.name
        cell.backgroundColor = self.colorArray[indexPath.row % 6]
        
        return cell
    }


}

