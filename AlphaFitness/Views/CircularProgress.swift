//
//  CircularProgress.swift
//  AlphaFitness
//
//  Created by Frank Alvares on 2023-05-19.
//

import UIKit

class CircularProgress: UIView {
    
    private let progressLayer = CAShapeLayer()
    private let textLayer = CATextLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayers()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLayers()
    }
    
    private func setupLayers() {
        // Calculate the center and radius of the circular progress view
        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        let radius = min(bounds.width, bounds.height) / 2.0
        
        // Create the circular path
        let circularPath = UIBezierPath(arcCenter: center, radius: radius, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi - CGFloat.pi / 2, clockwise: true)
        
        // Configure the progress layer
        progressLayer.path = circularPath.cgPath
        progressLayer.strokeColor = UIColor.green.cgColor
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.lineWidth = 5
        progressLayer.strokeStart = 0
        progressLayer.strokeEnd = 0
        layer.addSublayer(progressLayer)
        
        let textHeight: CGFloat = 17
        let textWidth: CGFloat = bounds.width
        let textOriginY = (bounds.height - textHeight) / 2
        textLayer.frame = CGRect(x: 0, y: textOriginY, width: textWidth, height: textHeight)
        textLayer.string = "0%"
        textLayer.fontSize = 17
        textLayer.font = UIFont.boldSystemFont(ofSize: 20)
        textLayer.foregroundColor = UIColor.white.cgColor
        
        textLayer.alignmentMode = .center
        layer.addSublayer(textLayer)
    }
    
    func setProgress(_ progress: Float) {
        // Update the stroke end of the progress layer
        progressLayer.strokeEnd = CGFloat(progress)
        
        // Update the text in the center
        let percentage = Int(progress * 100)
        textLayer.string = "\(percentage)"
    }
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
}
