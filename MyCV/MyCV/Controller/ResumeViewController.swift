//
//  ResumeViewController.swift
//  MyCV
//
//  Created by Никита on 13/04/2019.
//  Copyright © 2019 Mykyta Gorbulya. All rights reserved.
//

import UIKit
import MessageUI

class ResumeViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
    
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
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var aboutMeButton: UIButton!
    @IBOutlet weak var skillsButton: UIButton!
    private let phoneNumber = "+380983116742"
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidLayoutSubviews() {
        gradientLayer.frame = CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Initialising CAGradientLayer
        gradientLayer = CAGradientLayer()
        // Insert layer as a sublayer on our view at 0 position
        view.layer.insertSublayer(gradientLayer, at: 0)
        configureButtons()
        
    }
    
    
    func configureButtons() {
        
        let buttonArray = [aboutMeButton, skillsButton]
        for button in buttonArray {
            guard let button = button else { return }
            button.layer.cornerRadius = 10
            let color = UIColor(hexString: "F7F8F3")
            button.layer.borderColor = color.cgColor
            button.layer.borderWidth = 5
        }
    }
    
    
    
    @IBAction func callMe(_ sender: UIButton) {
        makeAPhoneCall()
    }
    
    func makeAPhoneCall()  {
        if let url = URL(string: "tel://\(phoneNumber)"), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
    
    @IBAction func sendEmail(_ sender: UIButton) {
        let mailComposeViewController = configureMainController()
        if MFMailComposeViewController.canSendMail() {
            self.present(mailComposeViewController, animated: true, completion: nil)
        } else {
            showMailError()
        }
        
    }
    
    func configureMainController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        mailComposerVC.setToRecipients(["mykyta.gorbulya@gmail.com"])
        mailComposerVC.setSubject("Questions regarding my CV")
        mailComposerVC.setMessageBody("If you're reading this, then you are probably looking at my CV right now. Feel free to contact me, if you have any questions or want to talk futher. Kind Regards, Mykyta Gorbulya", isHTML: false)
        
        return  mailComposerVC
    }
    
    func showMailError() {
        let sendMailErrorAlert = UIAlertController(title: "Couldn't send email", message: "Your device couldn't send email", preferredStyle: .alert)
        let dismiss = UIAlertAction(title: "Ok", style: .default, handler: nil)
        sendMailErrorAlert.addAction(dismiss)
        
        self.present(sendMailErrorAlert, animated: true, completion: nil)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
}
