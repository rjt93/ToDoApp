//
//  Utility.swift
//  ToDoApp
//
//  Created by Rajat on 04/05/19.
//  Copyright © 2019 Rajat. All rights reserved.
//

import Foundation
import UIKit

let appDelegate = UIApplication.shared.delegate as! AppDelegate

extension UIView {
    func makeBorderAndCornerRadious(borderWidth : CGFloat? ,to view:UIView, with borderColor : UIColor?, cornerRadious radious:CGFloat) {
        
        view.layer.borderWidth = borderWidth ?? 0
        view.layer.borderColor = borderColor?.cgColor
        view.layer.cornerRadius = radious
        view.clipsToBounds = true
    }
}
