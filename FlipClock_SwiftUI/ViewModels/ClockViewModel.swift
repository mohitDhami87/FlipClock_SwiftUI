//
//  ClockViewModel.swift
//  FlipClock_SwiftUI
//
//  Created by Mohit Sharma on 08/01/25.
//

import Foundation
import Combine

class ClockViewModel {
    
    init() {
        setupTimer()
    }
    
    private(set) lazy var flipViewModels = { (0...5).map { _ in FlipViewModel() } }()
    
    private func setupTimer() {
        Timer.publish(every: 1, on: .main, in: .default)
            .autoconnect()
            .map { [timeFormatter] in timeFormatter.string(from: $0)}
            .removeDuplicates()
            .sink(receiveValue: {[weak self] in self?.setTimeInViewModel(time: $0)})
            .store(in: &cancellable)
    }
    
    private func setTimeInViewModel(time: String) {
        zip(time, flipViewModels).forEach { number, viewModel in
            viewModel.text = "\(number)"
        }
    }
    
    private var cancellable = Set<AnyCancellable>()
    
    private let timeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HHmmss"
        return formatter
    }()
}
