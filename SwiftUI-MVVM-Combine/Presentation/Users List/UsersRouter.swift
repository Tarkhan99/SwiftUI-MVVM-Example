//
//  UsersRouter.swift
//  SwiftUI-MVVM-Combine
//
//  Created by Tarkhan Tahirov on 29.08.21.
//

import SwiftUI

final class UsersRouter {
    
    static func destinationTappedUser(user: User) -> some View {
        
        let detailsViewModel = UserDetailsViewModel(user: user)
        
        return UserDetailsConfigurator.configureUserDetailsView(with: detailsViewModel)
    }
    
}
