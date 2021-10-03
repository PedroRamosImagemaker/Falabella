//
//  ViewController.swift
//  falabella
//
//  Created by Image Maker on 1/10/21.
//

import UIKit

class ViewController: UIViewController {

    @Inject private var getAllIndicatorUseCase: GetAllIndicatorUseCase
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getAllIndicatorUseCase.execute { [weak self] (result) in
            Logger.info(result)
        }
    }


}

