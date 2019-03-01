//
//  Alert.swift
//  ViperDemo
//
//  Created by eduardo.garcia on 3/1/19.
//  Copyright © 2019 Abhisek. All rights reserved.
//

import Foundation
import UIKit

struct Alert {
    
    let rootController: UIViewController? = {
        let app = UIApplication.shared.delegate as! AppDelegate
        return app.window?.rootViewController
    }()
    
    let activityIndicator = UIActivityIndicatorView()
    
    func showAlert(withMessage message: String, title: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(okAction)
        rootController?.present(alertController, animated: true, completion: nil)
    }
    
    public func showAlertWithFields(withMessage message: String, title: String, textfields : UITextField..., completion : @escaping(_ textFields : [UITextField]?) -> ()) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.setText
        let okAction = UIAlertAction(title: "Agregar", style: .default){ _ in
            completion(alertController.textFields!)
        }
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        rootController?.present(alertController, animated: true, completion: nil)
    }
    
}
