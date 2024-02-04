//
//  CardView.swift
//  montanejosqrios
//
//  Created by Vincent Bevia on 16/10/23.
//

import UIKit

class CardView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCardView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupCardView()
    }
    
    private func setupCardView() {
        layer.cornerRadius = 10
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 4
        backgroundColor = .white
    }
}

