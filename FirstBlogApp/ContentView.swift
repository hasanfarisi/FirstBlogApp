//
//  ContentView.swift
//  FirstBlogApp
//
//  Created by mac on 10/3/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct ContentView: View {
    @State private var showSplash = true
    var body: some View {
        ZStack{
            if showSplash{
                SplashScreenView()
                    .transition(.opacity)
                    .animation(.easeOut(duration: 1.5))
            }else{
                indexArticles()                
            }
        }
        .onAppear{
            DispatchQueue.main
                .asyncAfter(deadline: .now() + 3){
                    withAnimation{
                        self.showSplash = false
                    }
                }
        }
    }
}

struct Login:View {
    @State var username:String = ""
    @State var password:String = ""
    let lightGreyColor = Color(red: 239.00/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 0.5)
    var body: some View {
        VStack{
            Image("logo")
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.bottom,30)
            Spacer()
            VStack{
                Spacer()
                HStack{
                    Spacer()
                    Button(action: {}){
                        Text("LOGIN")
                            .foregroundColor(Color.white)
                            .bold()
                            .font(.title2)
                    }
                    .padding()
                    Spacer()
                    Button(action: {}){
                        Text("SIGN UP")
                            .foregroundColor(Color.white)
                            .bold()
                            .font(.title2)
                            .opacity(0.5)
                    }
                    Spacer()
                }
                VStack(alignment: .leading){
                    Text("Welcome back")
                        .font(.title)
                        .bold()
                    Spacer()
                    Text("Sign in with your account")
                        .font(.caption2)
                        .foregroundColor(Color.secondary)
                    Spacer()
                        .padding(.bottom,20)
                    Text("Username")
                        .foregroundColor(Color.secondary)
                    TextField("Username...", text: $username)
                        .padding()
                        .background(lightGreyColor)
                        .cornerRadius(5)

                    Text("Password")
                        .foregroundColor(Color.secondary)
                    SecureField("Password...", text: $password)
                        .padding()
                        .background(lightGreyColor)
                        .cornerRadius(5)
                    Spacer()
                    HStack{
                        Button(action: {}){
                            Text("LOGIN")
                                .foregroundColor(Color.white)
                                .bold()
                                .font(.title2)
                        }
                        .padding(.all, 20)
                        .frame(maxWidth: .infinity)
                    }
                    .background(Color.blue)
                    .frame(maxWidth: .infinity)
                    .cornerRadius(10)
                    .padding(.top, 30)
                    HStack{
                        Spacer()
                        Text("Forgot your password?")
                            .foregroundColor(Color.secondary)
                        Button(action: {}){
                            Text("Reset here")
                        }
                        Spacer()
                    }
                    Spacer()
                        .padding()
                    VStack{
                        HStack{
                            Spacer()
                            Text("OR SIGN IN WITH")
                                .foregroundColor(Color.secondary)
                            Spacer()
                        }
                        HStack{
                            Spacer()
                            Button(action: {}){
                                Image("Google")
                                    .padding(.all,10)
                            }
                            Button(action: {}){
                                Image("Facebook")
                                    .padding(.all,10)
                            }
                            Button(action: {}){
                                Image("Twitter")
                                    .padding(.all,10)
                            }
                            Spacer()
                        }
                    }
                    
                }.padding(40)
                    .background(Color.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .clipShape(CustomShape(corner: .topRight, radii: 50))
                    .clipShape(CustomShape(corner: .topLeft, radii: 50))
            }
            .background(Color.blue)
            .ignoresSafeArea()
            .clipShape(CustomShape(corner: .topRight, radii: 50))
            .clipShape(CustomShape(corner: .topLeft, radii: 50))
        }
        .background(lightGreyColor)
    }
}

//custom shape
struct CustomShape:Shape {
    var corner: UIRectCorner
    var radii: CGFloat
    
    func path(in react: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: react, byRoundingCorners: corner, cornerRadii: CGSize(width: radii, height: radii))
        return Path(path.cgPath)
    }
}

#Preview {
    ContentView()
}
