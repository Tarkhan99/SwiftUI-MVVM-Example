//
//  User.swift
//  SwiftUI-MVVM-Combine
//
//  Created by Tarkhan Tahirov on 29.08.21.
//

import Foundation

struct User: Codable, Identifiable {
    let id: String?
    let title: String?
    let firstName: String
    let lastName: String
    let email: String?
    let dateOfBirth: String?
    let registerDate: String?
    let phone: String?
    let picture: String?
    let gender: String?
}

extension User {
    static func fake() -> Self {
        return User(id: "123",
                    title: "Test",
                    firstName: "Tarkhan",
                    lastName: "Tahirov",
                    email: "test@gmail.com",
                    dateOfBirth: "1/1/1990",
                    registerDate: "1/1/2020",
                    phone: "+123456",
                    picture: nil,
                    gender: "Male")
    }
}
