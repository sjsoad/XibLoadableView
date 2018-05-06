//
//  XibLoadableView.swift
//  SwiftUtils
//
//  Created by Sergey Kostyan on 04.07.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit

open class XibLoadableView: UIView {
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    open func instantiateFrom<T: UIView>() -> T {
        let selfType = type(of: self)
        let nibName = String(describing: selfType)
        let nib = UINib(nibName: nibName, bundle: nil)
        
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? T else {
            fatalError("Error loading nib with name \(nibName))")
        }
        return view
    }
    
    open func xibSetup() {
        let view = instantiateFrom()
        addSubview(view)
        stretch(view: view)
    }
    
    open func stretch(view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([view.topAnchor.constraint(equalTo: topAnchor),
                                     view.leftAnchor.constraint(equalTo: leftAnchor),
                                     view.rightAnchor.constraint(equalTo: rightAnchor),
                                     view.bottomAnchor.constraint(equalTo: bottomAnchor)])
    }
    
}

