//
//  ImagePickerControllerExtension.swift
//  Mondiali 2022
//
//  Created by Marsild Spahiu on 27/07/22.
//

import Foundation
import UIKit
extension UIImagePickerController{
    override open func viewDidLoad() {
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "_UIImagePickerControllerUserDidCaptureItem"), object: nil, queue: nil) { (notification) in
            self.changePhotoOrientation()
        }
    }
    //Changing image orientation for ImagePicker preview
    func changePhotoOrientation() {
        var subviews: [UIView] = [self.view]
        while (!subviews.isEmpty) {
            let subview = subviews.removeFirst()
            subviews += subview.subviews
            if (subview.isKind(of: UIImageView.self)) {
                if self.cameraDevice == .front{
                    subview.transform = self.cameraViewTransform.scaledBy(x: -1, y: 1)
                }
            }
        }
    }
}

