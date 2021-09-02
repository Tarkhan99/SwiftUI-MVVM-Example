//
//  SwiftUI_MVVM_CombineApp.swift
//  SwiftUI-MVVM-Combine
//
//  Created by Tarkhan Tahirov on 29.08.21.
//

import SwiftUI

@main
struct SwiftUI_MVVM_CombineApp: App {
    var body: some Scene {
        WindowGroup {
            UsersConfigurator.configureUsersList()
        }
    }
}
