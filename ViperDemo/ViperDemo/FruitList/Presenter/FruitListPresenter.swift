//
//  FruitListPresenter.swift
//  ViperDemo
//
//  Created by Abhisek on 08/11/17.
//  Copyright © 2017 Abhisek. All rights reserved.
//

import UIKit

class FruitListPresenter: FruitListPresenterProtocol {
    
    internal var wireframe: FruitListWireFrameProtocol?
    internal var view: FruitListViewProtocol?
    internal var interactor: FruitListInputInteractorProtocol?
    internal var presenter: FruitListPresenterProtocol?
    
    init(wireframe: FruitListWireframe?, view : FruitListViewProtocol?){
        self.wireframe = wireframe
        self.view = view
        self.interactor = FruitListInteractor(presenter: self)
    }
    
    func showFruitSelection(with fruit: Fruit, from view: UIViewController) {
        wireframe?.pushToFruitDetail(with: fruit, from: view)
    }
    
    func viewDidLoad() {
        self.loadFruitList()
    }

    func loadFruitList() {
        interactor?.getFruitList()
    }
    
    func addFruit(withName name: String, andVitamin vitamin: String) {
        interactor?.addFruit(withName: name, andVitamin: vitamin)
    }
    
}

extension FruitListPresenter: FruitListOutputInteractorProtocol {
    
    func fruitListDidFetch(fruitList: [Fruit]) {
        view?.showFruits(with: fruitList)
    }
    
}
