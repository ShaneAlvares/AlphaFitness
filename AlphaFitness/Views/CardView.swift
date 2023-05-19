//
//  CardView.swift
//  AlphaFitness
//
//  Created by Frank Alvares on 2023-05-19.
//

import UIKit

class CardView: UIView {
    
    let cardContainerView: UIView = {
        let view = UIView()
        //view.backgroundColor = .red
        view.layer.cornerRadius = 10
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.2
        view.layer.shadowOffset = CGSize(width: 2, height: 2)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
        
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
        
    private func setupViews() {
        addSubview(cardContainerView)
        
        NSLayoutConstraint.activate([
            cardContainerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 1),
            cardContainerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -1),
            cardContainerView.topAnchor.constraint(equalTo: topAnchor, constant: 1),
            cardContainerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -1),
        ])
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
