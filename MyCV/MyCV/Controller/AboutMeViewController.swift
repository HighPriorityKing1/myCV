//
//  AboutMeViewController.swift
//  MyCV
//
//  Created by Никита on 13/04/2019.
//  Copyright © 2019 Mykyta Gorbulya. All rights reserved.
//

import UIKit

class AboutMeViewController: UIViewController {
    
    var gradientLayer: CAGradientLayer! {
        didSet {
            // Start point for gradient layer
            gradientLayer.startPoint = CGPoint(x: 0, y: 0)
            // End point for gradient layer
            gradientLayer.endPoint = CGPoint(x: 0, y: 1)
            // Create two constants for the colors
            let startColor = #colorLiteral(red: 0.4705882353, green: 0.737254902, blue: 0.768627451, alpha: 1).cgColor
            let endColor = #colorLiteral(red: 0, green: 0.1725490196, blue: 0.2431372549, alpha: 1).cgColor
            // Colors that are involved in creating gradient layer
            gradientLayer.colors = [startColor, endColor]
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gradientLayer = CAGradientLayer()
        
        //        view.layer.insertSublayer(gradientLayer, at: 0)
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: nil, style: .plain, target: nil, action: nil)
        title = "About Me"
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func viewDidLayoutSubviews() {
        gradientLayer.frame = CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height)
        
    }
    
    
    
    
}

