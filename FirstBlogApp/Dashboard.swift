//
//  Dashboard.swift
//  FirstBlogApp
//
//  Created by mac on 10/4/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct Dashboard: View {
    var body: some View {
        indexArticles()
    }
}

#Preview {
    Dashboard()
}

struct indexArticles:View {
    @ObservedObject var news = NewsModels()
    let lightGreyColor = Color(red: 239.00/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 0.5)
    @State private var searchText = ""
    var body: some View {
        TabView {
            NavigationStack{
                VStack{
                    Text("Hi Jonathan!")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.title2)
                        .padding(.leading, 20)
                        .foregroundColor(Color.secondary)
                    Spacer()
                    ScrollView(.horizontal){
                        HStack{
                            ZStack{
                                Image("technology")
                                    .scaledToFit()
                                    .padding()
                                Text("Technology")
                                    .bold()
                                    .font(.title2)
                            }
                            ZStack{
                                Image("adventure")
                                    .scaledToFit()
                                    .padding()
                                Text("Adventure")
                                    .bold()
                                    .font(.title2)
                            }
                        }.foregroundColor(Color.white)
                    }
                    Spacer()
                    HStack{
                        Text("Latest News")
                            .foregroundColor(Color.black)
                            .font(.title3)
                            .bold()
                        Spacer()
                        Button(action: {}){
                            Text("More")
                                .foregroundColor(Color.blue)
                        }
                    }
                    .padding(.all,10)
                    Spacer()                    
                    //ScrollView{
                        VStack{
                            List(news.data){article in                                
                                NavigationLink(destination: ShowArticle(article: article)){
                                    VStack{
                                        WebImage(url: URL(string: article.image))
                                        //Image("post1")
                                            .resizable()
                                            .scaledToFit()
                                            //.frame(width: 100)
                                        Spacer()
                                        VStack(alignment: .leading){
                                            Text(article.title)
                                                .truncationMode(.tail)
                                                .frame(height: 50)
                                           //Text("haha")
                                                .foregroundColor(Color.blue)
                                                .font(.title3)
                                                .multilineTextAlignment(.leading)
                                            Text(article.content)
                                            //Text("hihi")
                                                .foregroundColor(Color.black)
                                                .multilineTextAlignment(.leading)
                                                .truncationMode(.tail)
                                                .frame(height: 50)
                                        }
                                        Spacer()
                                    }
                                }
                                .padding(15)
                            }
                        }
                        .background(Color.white)
                        .cornerRadius(15)
                    //}
                }
                .navigationBarTitle("News today")
                .navigationBarItems(trailing: Image(systemName: "bell")
                    .resizable().scaledToFit())
                .foregroundColor(Color.black)
                .padding(.all,10)
                .background(lightGreyColor)
            }
                .tabItem() {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            Text("Articles")
                .tabItem() {
                    Image(systemName: "book.fill")
                    Text("Article")
                }
            Text("Search")
                .tabItem() {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
            Text("Menu")
                .tabItem() {
                    Image(systemName: "list.bullet")
                    Text("Menu")
                }
        }
        .foregroundColor(Color.gray)
    }
}

struct ShowArticle:View {
    let article: News
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text(article.title)
                    .font(.title)
                    .foregroundColor(Color.black)
                    .bold()
                Spacer()
                HStack {
                    WebImage(url: URL(string: article.authorPhoto))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                    VStack(alignment: .leading){
                        Text(article.author)
                            .font(.callout)
                        Text(article.timePost)
                            .font(.caption2)
                    }
                    Spacer()
                    Image(systemName: "arrowshape.turn.up.backward.2")
                        .foregroundColor(Color.blue)
                        .padding()
                    Image(systemName: "bookmark")
                        .foregroundColor(Color.blue)
                }
                .padding(.vertical, 20)
                ScrollView{
                    VStack(alignment: .leading){
                        WebImage(url: URL(string: article.image))
                            .resizable()
                            .scaledToFit()
                        Text(article.title)
                            .padding(.vertical, 20)
                            .font(.title3)
                            .bold()
                            .foregroundColor(Color.black)
                        Text(article.content)
                            .font(.caption)
                    }
                }
            }
            .padding(.horizontal, 30)
        }
    }
}
