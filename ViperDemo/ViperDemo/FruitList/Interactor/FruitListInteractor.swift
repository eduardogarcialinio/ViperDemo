//
//  FruitListInteractor.swift
//  ViperDemo
//
//  Created by Abhisek on 08/11/17.
//  Copyright © 2017 Abhisek. All rights reserved.
//

import UIKit
import RealmSwift

class FruitListInteractor: FruitListInputInteractorProtocol {
    internal weak var presenter: FruitListOutputInteractorProtocol?
    
    private var realm : Realm?{
        return try? Realm()
    }
    
    private lazy var savedFruits = {
        return realm?.objects(Fruit.self)
    }()
    
    init(presenter: FruitListOutputInteractorProtocol){
        self.presenter = presenter
    }
    
    func getFruitList() {
        presenter?.fruitListDidFetch(fruitList: getAllFruitDetail())
    }
    
    func getAllFruitDetail() -> [Fruit] {
        var fruitList = [Fruit]()
        savedFruits?.forEach({fruitList.append($0)})
        return fruitList
    }
    
    func addFruit(withName name :String, andVitamin vitamin : String) {
        let id = getTheNextId()
        let newFruit = Fruit(id: id, name: name, vitamin: vitamin)
        try? realm?.write {
            realm?.add(newFruit)
        }
        presenter?.fruitListDidFetch(fruitList: getAllFruitDetail())
    }
    
    private func getTheNextId() -> Int{
        let savedFruits = realm?.objects(Fruit.self)
        let id = (savedFruits?.map({$0.id}).max() ?? -1) + 1
        return id
    }
}
