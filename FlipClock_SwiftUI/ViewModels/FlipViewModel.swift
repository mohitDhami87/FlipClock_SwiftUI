//
//  FlipViewModel.swift
//  FlipClock_SwiftUI
//
//  Created by Mohit Sharma on 08/01/25.
//

import SwiftUI

class FlipViewModel: ObservableObject, Identifiable {
    
    var text: String = "" {
        didSet {
            updateText(old: oldValue, new: text)
        }
    }
    
    @Published var newValue: String?
    @Published var oldValue: String?
    
    @Published var animateTop: Bool = false
    @Published var animateBottom: Bool = false
    
    func updateText(old: String?, new: String?) {
        guard old != new else { return }
        oldValue = old
        animateTop = false
        animateBottom = false
        
        withAnimation(Animation.easeIn(duration: 0.2)) { [weak self] in
            self?.newValue = new
            self?.animateTop = true
        
        }
        
        withAnimation(Animation.easeOut(duration: 0.2).delay(0.2)) { [weak self] in
            self?.animateBottom = true
        }
    }
}
