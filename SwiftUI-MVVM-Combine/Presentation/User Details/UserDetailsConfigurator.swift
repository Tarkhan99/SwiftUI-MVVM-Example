//
//  UserDetailsConfigurator.swift
//  SwiftUI-MVVM-Combine
//
//  Created by Tarkhan Tahirov on 29.08.21.
//

import Foundation

final class UserDetailsConfigurator {
    
    public static func configureUserDetailsView(with viewModel: UserDetailsViewModel) -> UserDetailsView {
        return UserDetailsView(viewModel: viewModel)
    }
    
}
