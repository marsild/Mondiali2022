//
//  ActivityView.swift
//  Mondiali 2022
//
//  Created by Marsild Spahiu on 24/07/22.
//

import SwiftUI

struct ActivityView: UIViewControllerRepresentable {
    
    let activityItems: [Any]
    let applicationActivities: [UIActivity]?
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ActivityView>) -> UIActivityViewController {
        return UIActivityViewController(activityItems: activityItems,
                                        applicationActivities: applicationActivities)
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController,
                                context: UIViewControllerRepresentableContext<ActivityView>) {
        
    }
}
