//
//  FruitListWireframe.swift
//  ViperDemo
//
//  Created by Abhisek on 08/11/17.
//  Copyright © 2017 Abhisek. All rights reserved.
//

import UIKit

class FruitListWireframe: FruitListWireFrameProtocol {
   
    func pushToFruitDetail(with fruit: Fruit,from view: UIViewController) {
        let fruitDetailViewController = view.storyboard?.instantiateViewController(withIdentifier: "FruitDetailView") as! FruitDetailView
        let navigationController = UINavigationController(rootViewController: fruitDetailViewController)
        FruitDetailWireFrame.createFruitDetailModule(with: fruitDetailViewController, and: fruit)
        view.navigationController?.present(navigationController, animated: true)
    }
    
    class func createFruitListModule(fruitListRef: FruitListView) {
        let presenter: FruitListPresenterProtocol & FruitListOutputInteractorProtocol = FruitListPresenter(wireframe: FruitListWireframe(), view: fruitListRef)
        fruitListRef.presenter = presenter
    }
    
}
