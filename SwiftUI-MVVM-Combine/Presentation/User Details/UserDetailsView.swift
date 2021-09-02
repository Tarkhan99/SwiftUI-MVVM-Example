//
//  UserDetailsView.swift
//  SwiftUI-MVVM-Combine
//
//  Created by Tarkhan Tahirov on 29.08.21.
//

import SwiftUI

struct UserDetailsView: View {
    
    @ObservedObject var viewModel: UserDetailsViewModel
    
    @State private var showingModal = false
    
    var body: some View {
        VStack {
            Image(uiImage: viewModel.avatar)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .clipShape(Circle())
                .shadow(radius: 10)
                .overlay(Circle().stroke(Color.blue,lineWidth: 3))
                .padding()
            
            HStack {
                Text(viewModel.user.firstName)
                Text(viewModel.user.lastName)
            }
            
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 20) {
                Text("ID: \(viewModel.user.id ?? "N/A")")
                Text("Email: \(viewModel.user.email ?? "N/A")")
                Text("Birth date: \(viewModel.user.dateOfBirth ?? "N/A")")
                Text("Phone: \(viewModel.user.phone ?? "N/A")")
                Text("Gender: \(viewModel.user.gender ?? "N/A")")
            }.padding(.top, 30)
            
            Button(action: {
                showingModal.toggle()
            }) {
                Text("Get more info")
                    .padding()
                    .frame(width: UIScreen.main.bounds.width*0.6)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
            }.padding(.top, 40)
            
            
            Spacer()
        }
        .navigationTitle(viewModel.user.firstName)
        .onAppear(perform: { viewModel.onAppear() })
    }
}

struct UserDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailsView(viewModel: UserDetailsViewModel())
    }
}
