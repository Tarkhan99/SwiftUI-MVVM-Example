//
//  UsersListView.swift
//  SwiftUI-MVVM-Combine
//
//  Created by Tarkhan Tahirov on 29.08.21.
//

import SwiftUI

struct UsersView: View {
    
    @ObservedObject var viewModel: UsersViewModel
    
    var body: some View {
        NavigationView {
            List(viewModel.users.data) { user in
                NavigationLink(
                    destination: UsersRouter.destinationTappedUser(user: user)
                ){
                    Text(user.firstName)
                }
            }.navigationTitle("Users")
        }.onAppear(perform: {
            viewModel.onAppear()
        })
    }
}

struct UsersListView_Previews: PreviewProvider {
    static var previews: some View {
        UsersView(viewModel: UsersViewModel())
    }
}
