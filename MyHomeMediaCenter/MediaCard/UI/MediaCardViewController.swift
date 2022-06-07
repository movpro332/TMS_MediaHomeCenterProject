//
//  MediaCardViewController.swift
//  MyHomeMediaCenter
//
//  Created by Vitaliy Antonchik on 05.06.2022.
//

import UIKit

class MediaCardViewController: UIViewController {

    override func loadView() {
        view = MediaCardView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
    }

}
