//
//  BoundsTestViewController.swift
//  MyHomeMediaCenter
//
//  Created by Vitaliy Antonchik on 23.05.2022.
//

import UIKit

class BoundsTestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        
        view = BoundsTestView(frame: CGRect())
        view.backgroundColor = .white

        
    }

}
