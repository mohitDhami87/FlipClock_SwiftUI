//
//  ClockView.swift
//  FlipClock_SwiftUI
//
//  Created by Mohit Sharma on 09/01/25.
//

import SwiftUI

struct ClockView: View {

    let viewModel = ClockViewModel()

    var body: some View {
        HStack(spacing: 5) {
            HStack(spacing: 5) {
                FlipView(viewModel: viewModel.flipViewModels[0])
                FlipView(viewModel: viewModel.flipViewModels[1])
            }
            Text(":")
                .font(.system(size: 40))
                .fontWeight(.heavy)
                .foregroundColor(.text)
            HStack(spacing: 5) {
                FlipView(viewModel: viewModel.flipViewModels[2])
                FlipView(viewModel: viewModel.flipViewModels[3])
            }
            Text(":")
                .font(.system(size: 40))
                .fontWeight(.heavy)
                .foregroundColor(.text)
            HStack(spacing: 5) {
                FlipView(viewModel: viewModel.flipViewModels[4])
                FlipView(viewModel: viewModel.flipViewModels[5])
            }
        }
    }

}
