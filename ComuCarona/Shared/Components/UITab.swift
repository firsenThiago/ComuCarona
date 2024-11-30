//
//  UITab.swift
//  ComuCarona
//
//  Created by Thiago Firsen on 30/11/24.
//

import SwiftUI

struct UITab<ContentLeft: View, ContentCenter: View, ContentRigth: View>: View {
    
    let contentLeft: ContentLeft
    let contentCenter: ContentCenter
    let contentRigth: ContentRigth
    
    var body: some View {
        TabView {
            contentLeft
                .tabItem {
                    Image(systemName: .house)
                    Text("Home")
                }
            contentCenter
                .tabItem {
                    Image(systemName: .car)
                    Text("Suas caronas")
                }
            contentRigth
                .tabItem {
                    Image(systemName: .person)
                    Text("Perfil")
                }
        }
    }
}




#Preview {
    PreviewTabView()
}

struct PreviewTabView: View {
    var body: some View {
        UITab(
            contentLeft: HomeView(),
            contentCenter: SettingsView(),
            contentRigth: ProfileView()
        )
    }
}

struct HomeView: View {
    var body: some View {
        VStack {
            Text("Bem-vindo ao Home!")
                .font(.largeTitle)
        }
    }
}

struct SettingsView: View {
    var body: some View {
        VStack {
            Text("Configurações")
                .font(.title)
        }
    }
}

struct ProfileView: View {
    var body: some View {
        VStack {
            Text("Perfil")
                .font(.title)
        }
    }
}
