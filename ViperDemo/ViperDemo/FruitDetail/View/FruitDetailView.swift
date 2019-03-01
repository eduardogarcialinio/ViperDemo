//
//  FruitDetailView.swift
//  ViperDemo
//
//  Created by Abhisek on 08/11/17.
//  Copyright © 2017 Abhisek. All rights reserved.
//

import UIKit

class FruitDetailView: UIViewController,FruitDetailViewProtocol {

    @IBOutlet var fruitImage: UIImageView!
    @IBOutlet var fruitNameLbl: UILabel!
    @IBOutlet var vitaminLbl: UILabel!
    
    var presenter: FruitDetailPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        let backButton = UIBarButtonItem(title: "Close", style: .plain, target: self, action: #selector(backButtonPressedAction(_:)))
        self.navigationItem.setLeftBarButton(backButton, animated: true)
    }
    
    @objc private func backButtonPressedAction(_ sender: UIBarButtonItem){
        presenter?.backButtonPressed(from: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func showFruitDetail(with fruit: Fruit) {
        title = fruit.name
        fruitNameLbl.text = fruit.name
        vitaminLbl.text = fruit.vitamin
    }

}
