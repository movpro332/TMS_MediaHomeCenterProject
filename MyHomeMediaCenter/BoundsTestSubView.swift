//
//  BoundsTestSubView.swift
//  MyHomeMediaCenter
//
//  Created by Vitaliy Antonchik on 23.05.2022.
//

import UIKit

class BoundsTestSubView: UIView {

    private lazy var testSubview: UIView = {
        let subview = UIView(frame: CGRect(x: 0, y: 0, width: 140, height: 140))
        subview.backgroundColor = .black.withAlphaComponent(0.4)
        return subview
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(testSubview)
        self.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let pointInsideView = super.point(inside: point, with: event)
        print("\(pointInsideView)")
        return pointInsideView
      //comment
        
    }
}


