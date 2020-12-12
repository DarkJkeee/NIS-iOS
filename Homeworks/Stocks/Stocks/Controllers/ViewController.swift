//
//  ViewController.swift
//  Stocks
//
//  Created by Глеб Бурштейн on 06.12.2020.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var companyPickerView: UIPickerView!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var companySymbolLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var priceChangeLabel: UILabel!
    
    private let companies = ["Apple": "AAPL",
                             "Microsoft": "MSFT",
                             "Google": "GOOG",
                             "Amazon": "AMZN",
                             "Facebook": "FB"]
    
    private func displayStockInfo(companyName: String, companySymb: String, price: Double, priceChange: Double) {
        self.activityIndicator.stopAnimating()
        self.companyNameLabel.text = companyName
        self.companySymbolLabel.text = companySymb
        self.priceLabel.text = String(price)
        self.priceChangeLabel.text = String(priceChange)
    }
    
    private func parseQuote(data: Data) {
        do {
            let jsonObject = try JSONSerialization.jsonObject(with: data)
            
            guard
                let json = jsonObject as? [String: Any],
                let companyName = json["companyName"] as? String,
                let companySymbol = json["symbol"] as? String,
                let price = json["latestPrice"] as? Double,
                let priceChange = json["change"] as? Double
            else {
                print("Invalid JSON format")
                return
            }
            DispatchQueue.main.async {
                self.displayStockInfo(companyName: companyName, companySymb: companySymbol, price: price, priceChange: priceChange)
            }
            
        } catch {
            print("Json parsing error: " + error.localizedDescription)
        }
        
    }
    
    private func requestQuote(for symbol: String) {
        let dataTask = URLSession.shared.dataTask(with: URL(string: "https://nosecurityshares.azurewebsites.net/Stonks/\(symbol)")!) { data, response, error in
            guard
                error == nil,
                (response as? HTTPURLResponse)?.statusCode == 200,
                let data = data
            else {
                print("Network error")
                DispatchQueue.main.async {
                    self.displayStockInfo(companyName: "ООО \"Груша\"", companySymb: "яблк", price: 9999999999, priceChange: -2)
                }
                return
            }
            
            self.parseQuote(data: data)
        }
        dataTask.resume()
    }
    
    private func requestQuoteUpdate() {
        activityIndicator.startAnimating()
        companyNameLabel.text = "-"
        companySymbolLabel.text = "-"
        priceLabel.text = "-"
        priceChangeLabel.text = "-"
        
        let selectedRow = companyPickerView.selectedRow(inComponent: 0)
        let companySymbol = Array(companies.values)[selectedRow]
        requestQuote(for: companySymbol)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        companyPickerView.dataSource = self
        companyPickerView.delegate = self
        requestQuoteUpdate()
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return companies.keys.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Array(companies.keys)[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        requestQuoteUpdate()
    }

}

