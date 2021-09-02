//
//  UsersListConfigurator.swift
//  SwiftUI-MVVM-Combine
//
//  Created by Tarkhan Tahirov on 29.08.21.
//

import Foundation

final class UsersConfigurator {
    
    public static func configureUsersList(
        with viewModel: UsersViewModel = UsersViewModel()
    ) -> UsersView {
        return UsersView(viewModel: viewModel)
    }
    
}
