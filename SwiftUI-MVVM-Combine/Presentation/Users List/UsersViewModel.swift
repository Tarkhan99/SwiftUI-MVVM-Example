//
//  UsersViewModel.swift
//  SwiftUI-MVVM-Combine
//
//  Created by Tarkhan Tahirov on 30.08.21.
//

import Foundation
import Combine

class UsersViewModel: ObservableObject {
    @Published var users: Users = Users(data: [])
    
    private var usersService: UsersServiceProtocol
    private var cancellables = Set<AnyCancellable>()
    
    init(users: Users = Users(data: []),
         usersService: UsersServiceProtocol = UsersService())
    {
        self.users = users
        self.usersService = usersService
    }
    
    func onAppear() {
        getUsers(count: 40)
    }
    
    private func getUsers(count: Int) {
        usersService.getUsers(count: count)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error)
                }
            } receiveValue: { [weak self] users in
                self?.users = users
            }
            .store(in: &cancellables)
        
    }
}

