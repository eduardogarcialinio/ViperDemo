//
//  FruitList.swift
//  ViperDemo
//
//  Created by Abhisek on 08/11/17.
//  Copyright © 2017 Abhisek. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

struct AlertTextFieldConfiguration{
    var placeHolder : String
    var observableValue : 
}

class FruitListView: UIViewController,FruitListViewProtocol {
    
    @IBOutlet var fruitTblView: UITableView!
    
    var presenter:FruitListPresenterProtocol?
    var fruitList : BehaviorRelay<[Fruit]> = BehaviorRelay(value: [Fruit]())
    private let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FruitListWireframe.createFruitListModule(fruitListRef: self)
        setupView()
        setupCell()
        presenter?.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func setupView(){
        let rightButton = UIBarButtonItem(title: "Add fruit", style: .plain, target: self, action: #selector(displayFruitAlert(_:)))
        self.navigationItem.setRightBarButton(rightButton, animated: true)
    }
    
    @objc private func displayFruitAlert(_ sender : UIBarButtonItem){
        Alert().showAlertWithFields(withMessage: "Por favor escribe los detalles de la fruta", title: "Nueva fruta") { [weak self] (textfields) in
            guard let textfields = textfields else {return}
            guard let name = textfields[0].text else {return}
            guard let vitamin = textfields[1].text else {return}
            self?.presenter?.addFruit(withName: name, andVitamin: vitamin)
        }
    }
    
    func showFruits(with fruits: [Fruit]) {
        fruitList.accept(fruits)
    }
    
    //Rx configuration
    
    func setupCell(){
        fruitList.bind(to: fruitTblView
            .rx
            .items(cellIdentifier: "fruitCell", cellType: UITableViewCell.self)){row, fruit, cell in
                cell.textLabel?.text = fruit.name
                cell.detailTextLabel?.text = fruit.vitamin
            }.disposed(by: bag)
        
    }

}

