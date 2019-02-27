//
//  FruitDetailWireFrame.swift
//  ViperDemo
//
//  Created by Abhisek on 08/11/17.
//  Copyright © 2017 Abhisek. All rights reserved.
//

import UIKit

class FruitDetailWireFrame: FruitDetailWireFrameProtocol {    
    class func createFruitDetailModule(with fruitDetailRef: FruitDetailView, and fruit: Fruit) {
        let presenter = FruitDetailPresenter(wireframe: FruitDetailWireFrame(), view: fruitDetailRef, fruit: fruit)
        fruitDetailRef.presenter = presenter
    }
    
    func goBackToFruitListView(from view: UIViewController) {
        view.dismiss(animated: true, completion: nil)
    }

}
