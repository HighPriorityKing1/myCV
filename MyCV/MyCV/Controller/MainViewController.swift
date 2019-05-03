//
//  MainViewController.swift
//  MyCV
//
//  Created by Никита on 14/04/2019.
//  Copyright © 2019 Mykyta Gorbulya. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, CAAnimationDelegate {
    
    
    
    var shapeLayer: CAShapeLayer! {
        didSet {
            shapeLayer.lineWidth = 20
            shapeLayer.lineCap = .round
            shapeLayer.fillColor = nil
            shapeLayer.strokeEnd = 1
            let color = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1).cgColor
            shapeLayer.strokeColor = color
        }
    }
    
    var overShapeLayer: CAShapeLayer! {
        didSet {
            overShapeLayer.lineWidth = 20
            overShapeLayer.lineCap = .round
            overShapeLayer.fillColor = nil
            overShapeLayer.strokeEnd = 0
            let color = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).cgColor
            overShapeLayer.strokeColor = color
        }
    }
    
    var gradientLayer: CAGradientLayer! {
        didSet {
            // Start point for gradient layer
            gradientLayer.startPoint = CGPoint(x: 0, y: 0)
            // End point for gradient layer
            gradientLayer.endPoint = CGPoint(x: 0, y: 1)
            // Create two constants for the colors
            let startColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1).cgColor
            let endColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1).cgColor
            // Colors that are involved in creating gradient layer
            gradientLayer.colors = [startColor, endColor]
        }
    }

    override func viewDidLayoutSubviews() {
        configShapeLayer(shapeLayer)
        configShapeLayer(overShapeLayer)
        
        gradientLayer.frame = CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shapeLayer = CAShapeLayer()
        view.layer.addSublayer(shapeLayer)
        
        overShapeLayer = CAShapeLayer()
        view.layer.addSublayer(overShapeLayer)
        
        gradientLayer = CAGradientLayer()
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    

    func configShapeLayer(_ shapeLayer: CAShapeLayer) {
        shapeLayer.frame = view.bounds
        let path = UIBezierPath()
        path.move(to: CGPoint(x: self.view.frame.width / 2 - 100, y: self.view.frame.height / 2))
        path.addLine(to: CGPoint(x: self.view.frame.width / 2 + 100, y: self.view.frame.height / 2))
        shapeLayer.path = path.cgPath
    }
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = 1
        animation.duration = 2
        
        animation.timingFunction = CAMediaTimingFunction(name: .easeOut)
        animation.fillMode = .both
        animation.isRemovedOnCompletion = false
        
        animation.delegate = self
        
        overShapeLayer.add(animation, forKey: nil)
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        performSegue(withIdentifier: "showResumeVC", sender: self)
    }
    
}
