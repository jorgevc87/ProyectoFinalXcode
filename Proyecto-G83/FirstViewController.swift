//
//  FirstViewController.swift
//  Proyecto-G83
//
//  Created by Instructor Fredy Asencios on 8/22/19.
//  Copyright © 2019 AcademiaMoviles. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var imgTomates: UIImageView!
    @IBOutlet weak var imgLogo: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
 
    override func viewDidAppear(_ animated: Bool) {
        self.imgTomates.frame = CGRect(x: -120, y: -158, width: self.imgTomates.frame.width, height: self.imgTomates.frame.height)
        self.imgTomates.alpha = 0
        animacion()
        
       
        
    }
    func animacion(){
        
        UIView.animate(withDuration: 1) {
             self.imgTomates.frame = CGRect(x: 20, y: 58, width: self.imgTomates.frame.width, height: self.imgTomates.frame.height)
            self.imgTomates.alpha = 1
            
            //logo
            self.imgLogo.image =  self.imgLogo.image?.rotate(radians:-.pi/8)
        }
        
    }

}

extension UIImage {
    func rotate(radians: Float) -> UIImage? {
        var newSize = CGRect(origin: CGPoint.zero, size: self.size).applying(CGAffineTransform(rotationAngle: CGFloat(radians))).size
        // Trim off the extremely small float value to prevent core graphics from rounding it up
        newSize.width = floor(newSize.width)
        newSize.height = floor(newSize.height)
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, self.scale)
        let context = UIGraphicsGetCurrentContext()!
        
        // Move origin to middle
        context.translateBy(x: newSize.width/2, y: newSize.height/2)
        // Rotate around middle
        context.rotate(by: CGFloat(radians))
        // Draw the image at its center
        self.draw(in: CGRect(x: -self.size.width/2, y: -self.size.height/2, width: self.size.width, height: self.size.height))
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
}
