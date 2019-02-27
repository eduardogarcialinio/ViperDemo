//
//  FruitDetailPresenter.swift
//  ViperDemo
//
//  Created by Abhisek on 08/11/17.
//  Copyright © 2017 Abhisek. All rights reserved.
//

import UIKit

class FruitDetailPresenter: FruitDetailPresenterProtocol {
    
    internal var view: FruitDetailViewProtocol?
    internal var wireframe: FruitDetailWireFrameProtocol?
    private var fruit: Fruit?
    
    init(wireframe: FruitDetailWireFrame?, view: FruitDetailView?, fruit: Fruit?) {
        self.wireframe = wireframe
        self.view = view
        self.fruit = fruit
    }
    
    func viewDidLoad() {
        view?.showFruitDetail(with: fruit!)
    }
    
    func backButtonPressed(from view: UIViewController) {
        wireframe?.goBackToFruitListView(from: view)
    }
    
}
