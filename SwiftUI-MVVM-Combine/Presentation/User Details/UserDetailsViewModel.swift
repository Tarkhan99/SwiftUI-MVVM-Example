//
//  UserDetailsViewModel.swift
//  SwiftUI-MVVM-Combine
//
//  Created by Tarkhan Tahirov on 30.08.21.
//

import UIKit
import Combine

class UserDetailsViewModel: ObservableObject {
    
    @Published var user: User = User.fake()
    @Published var avatar: UIImage = UIImage()
    
    private var usersService: UsersServiceProtocol
    private var imageService: ImageServiceProtocol
    private var cancellables = Set<AnyCancellable>()
    
    init(user: User = User.fake(),
         imageService: ImageServiceProtocol = ImageService(),
         usersService: UsersServiceProtocol = UsersService()) {
        self.user = user
        self.imageService = imageService
        self.usersService = usersService
    }
    
    public func onAppear() {
        getUserDetails()
    }
    
    private func getUserDetails() {
        guard let userId = user.id else { return }
        let avatarURLString = user.picture ?? ""
        Publishers.Zip(
            usersService.getUser(id: userId),
            imageService.getImageData(urlString: avatarURLString)
        )
        .receive(on: DispatchQueue.main)
        .sink { completion in
            switch completion {
            case .finished:
                break
            case .failure(let error):
                print(error)
            }
        } receiveValue: { [weak self] user, imageData in
            self?.user = user
            if let avatar = UIImage(data: imageData) {
                self?.avatar = avatar
            }
        }
        .store(in: &cancellables)
    }
    
}
