//
//  TitleView.swift
//  AlphaFitness
//
//  Created by Frank Alvares on 2023-05-19.
//

import UIKit

class TitleView: UIView {
    // Define any properties or subviews needed for your custom view
     let titleLabel = UILabel()
    
    // Initialize the custom view
    init(title: String) {
        super.init(frame: .zero)
        
        // Customize the view's appearance and layout
        backgroundColor = .white
        
        titleLabel.text = title
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        titleLabel.textColor = .black
        
        addSubview(titleLabel)
        
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
