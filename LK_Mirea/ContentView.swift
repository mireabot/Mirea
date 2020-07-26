//
//  ContentView.swift
//  LK_Mirea
//
//  Created by Mikhail Kolkov  on 30.06.2020.
//  Copyright © 2020 MKM.LLC. All rights reserved.
//

import SwiftUI
import WebKit
import Firebase
import CoreData

struct ContentView: View {
    var body: some View {
        NavigationView{
            
            Home()
                .navigationBarTitle("",displayMode: .inline)
                .navigationBarHidden(true)
                //.navigationBarBackButtonHidden(false)
        }.preferredColorScheme(.light)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home : View {
    
    @State var index = 0
    @State var show = false
    
    @State var offset : CGFloat = UIScreen.main.bounds.height
    
    var body: some View{
        
        ZStack{
            
            // Menu...
            
            HStack{
                
                VStack(alignment: .leading, spacing: 12) {
                    
                    Image("avatar")
                    
                    Text("РТУ")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding(.top, 10)
                    
                    Text("МИРЭА")
                        .fontWeight(.bold)
                        .font(.title)
                        .foregroundColor(.black)
                    
                    Button(action: {
                        
                        self.index = 0
                        
                        // animating Views...
                        
                        // Each Time Tab Is Clicked Menu Will be Closed...
                        withAnimation{
                            
                            self.show.toggle()
                        }
                        
                    }) {
                        
                        HStack(spacing: 25){
                            
                            
                            Text("Учебные материалы")
                            .foregroundColor(self.index == 0 ? Color("Color1") : Color.black)
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background(self.index == 0 ? Color("Menu").opacity(0.2) : Color.clear)
                        .cornerRadius(10)
                    }
                    .padding(.top,25)
                    
                    Button(action: {
                        
                        self.index = 1
                        
                        withAnimation{
                            
                            self.show.toggle()
                        }
                        
                    }) {
                        
                        HStack(spacing: 25){
                            
                            
                            Text("Новости")
                            .foregroundColor(self.index == 1 ? Color("Color1") : Color.black)
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background(self.index == 1 ? Color("Menu").opacity(0.2) : Color.clear)
                        .cornerRadius(10)
                    }
                    
                    Button(action: {
                        
                        self.index = 2
                        
                        withAnimation{
                            
                            self.show.toggle()
                        }
                        
                    }) {
                        
                        HStack(spacing: 25){
                            
                            
                            Text("Расписание")
                            .foregroundColor(self.index == 2 ? Color("Color1") : Color.black)
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background(self.index == 2 ? Color("Menu").opacity(0.2) : Color.clear)
                        .cornerRadius(10)
                    }
                    Button(action: {
                        
                        self.index = 3
                        
                        withAnimation{
                            
                            self.show.toggle()
                        }
                        
                    }) {
                        
                        HStack(spacing: 25){
                            
                            
                            Text("Найти аудиторию")
                            .foregroundColor(self.index == 3 ? Color("Color1") : Color.black)
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background(self.index == 3 ? Color("Menu").opacity(0.2) : Color.clear)
                        .cornerRadius(10)
                    }
                    Divider()
                        .frame(width: 150, height: 1)
                        .background(Color.white)
                        .padding(.vertical,30)
                    
                    Button(action: {
                        
                        self.index = 4
                        
                        withAnimation{
                            
                            self.show.toggle()
                        }
                        
                    }) {
                        
                        HStack(spacing: 25){
                            
                            
                            Text("Заметки")
                            .foregroundColor(self.index == 4 ? Color("Color1") : Color.black)
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background(self.index == 4 ? Color("Menu").opacity(0.2) : Color.clear)
                        .cornerRadius(10)
                    }
                    
                    Spacer(minLength: 0)
                    
                }
                .padding(.top,25)
                .padding(.horizontal,20)
                
                Spacer(minLength: 0)
            }
            .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
            .padding(.bottom,UIApplication.shared.windows.first?.safeAreaInsets.bottom)
            
            // MainView...
            
            VStack(spacing: 0){
                
                HStack(spacing: 15){
                    
                    Button(action: {
                        
                        withAnimation{
                            
                            self.show.toggle()
                        }
                        
                    }) {
                        
                        // close Button...
                        
                        Image(systemName: self.show ? "xmark" : "line.horizontal.3")
                            .resizable()
                            .frame(width: self.show ? 18 : 22, height: 18)
                            .foregroundColor(Color.black.opacity(0.4))
                    }
                    
                    // Changing Name Based On Index...
                    
                    Text(self.index == 0 ? "Учебные материалы" : (self.index == 1 ? "Новости" : (self.index == 2 ? "Расписание" : (self.index == 3 ? "Найти аудиторию" : " "))))
                        .font(.title)
                        .foregroundColor(Color.black.opacity(0.6))
                    
                    Spacer(minLength: 0)
                }
                .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
                .padding()
                
                GeometryReader{_ in
                    
                    VStack{
                        
                        // Changing Views Based On Index...
                        
                        if self.index == 0{
                            
                            MainPage()
                        }
                        else if self.index == 1{
                            
                            News()
                        }
                        else if self.index == 2{
                            
                            Time()
                        }
                        else if self.index == 3{
                            
                            Search()
                        }
                        else {
                            Add()
                        }
                    }
                }
            }
            .background(Color.white)
            //Applying Corner Radius...
            .cornerRadius(self.show ? 30 : 0)
            // Shrinking And Moving View Right Side When Menu Button Is Clicked...
            .scaleEffect(self.show ? 0.9 : 1)
            .offset(x: self.show ? UIScreen.main.bounds.width / 2 : 0, y: self.show ? 15 : 0)
            // Rotating Slighlty...
            .rotationEffect(.init(degrees: self.show ? -5 : 0))
            
        }
        .background(Color("Colo").edgesIgnoringSafeArea(.all))
        .edgesIgnoringSafeArea(.all)
    }
}

// Mainpage View...
struct MainPage : View {
    @State private var inbo = false
    @Environment(\.presentationMode) var Present
    var body: some View{
        
        VStack{
            NavigationLink(destination: Inbo()) {
                Text("Группы ИНБО")
                Spacer(minLength: 15)
                Image(systemName: "chevron.right")
            }.padding()
            .foregroundColor(Color.black.opacity(0.5))
            .navigationBarBackButtonHidden(false)
            .navigationBarHidden(false)
                
        }
        //.padding(.top, -300)
    }
}
struct Time : View {
    var body: some View {
        VStack(spacing: 15) {
            
            NavigationLink(destination: INBO_Time()) {
                
           // }) {
                HStack{
                    Text("Группы ИНБО")
                        .font(.body)
                        .font(.system(size: 20))
                        .foregroundColor(Color.black.opacity(0.5))
                        .padding(8)
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .foregroundColor(Color.black.opacity(0.5))
                        .padding(8)
                }
            }
        }
        .navigationBarTitle("",displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}
struct INBO_Time: View {
    @Environment(\.presentationMode) var present
    var  body: some View {
        VStack {
            HStack {
            HStack(spacing: 5){
                Image(systemName: "arrow.left")
                    .resizable()
                    .frame(width: 10, height: 10)
                    .foregroundColor(.blue)
                Button(action:{
                    self.present.wrappedValue.dismiss()
                }){
                    Text("Назад")
                        .foregroundColor(.blue)
                        .fontWeight(.light)
                }
                }.padding(8)
                Spacer()
            }.padding()
           // Spacer()
        ScrollView(.vertical, showsIndicators: false) {
            
            NavigationLink(destination: INBO1()) {
                
            //}){
                HStack{
                    Text("ИНБО 01")
                        .font(.body)
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                        .padding(8)
                    Spacer()
                    
                    Image(systemName: "arrow.right")
                        .resizable()
                        .frame(width: 10, height: 10)
                        .foregroundColor(.blue)
                        .padding(8)
                }
            }
            Divider()
            
            Button(action: {
                 
             }){
                 HStack{
                     Text("ИНБО 02")
                         .font(.body)
                         .font(.system(size: 20))
                         .foregroundColor(.black)
                         .padding(8)
                     Spacer()
                     
                     Image(systemName: "arrow.right")
                         .resizable()
                         .frame(width: 10, height: 10)
                         .foregroundColor(.blue)
                         .padding(8)
                 }
             }
             Divider()
            
            Button(action: {
                 
             }){
                 HStack{
                     Text("ИНБО 03")
                         .font(.body)
                         .font(.system(size: 20))
                         .foregroundColor(.black)
                         .padding(8)
                     Spacer()
                     
                     Image(systemName: "arrow.right")
                         .resizable()
                         .frame(width: 10, height: 10)
                         .foregroundColor(.blue)
                         .padding(8)
                 }
             }
        }
    }
        .navigationBarTitle("",displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
}
}
struct INBO1: View {
    @State var selected = 0
     @Environment(\.presentationMode) var PresentTime
    var body: some View {
        VStack {
            HStack {
            HStack(spacing: 5){
                Image(systemName: "arrow.left")
                    .resizable()
                    .frame(width: 10, height: 10)
                    .foregroundColor(.blue)
                Button(action:{
                    self.PresentTime.wrappedValue.dismiss()
                }){
                    Text("Назад")
                        .foregroundColor(.blue)
                        .fontWeight(.light)
                }
                }.padding(8)
                Spacer()
            }
            //.padding()
            Topbar(selected: self.$selected).padding(.top)
            
            if self.selected == 0{
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 20){
                        
                        ForEach(data){i in
                            
                            INBO_Time_Even(data: i)
                        }
                    }
                    .padding(.bottom)
                }
            }
            else{
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 20){
                        
                        ForEach(data1){i in
                            
                            INBO_Time_UnEven(data1: i)
                        }
                    }
                    .padding(.bottom)
                }
            }
        }.background(Color("Color").edgesIgnoringSafeArea(.all))
    }
}
struct INBO_Time_Even: View {
    
    var data : TimeTable
    
    var body: some View {
        
        VStack {
            HStack {
                VStack(spacing: 10){
                    HStack {
                    Text(self.data.subject_name)
                        .font(.title)
                        .foregroundColor(.blue)
                        .padding([.leading, .trailing])
                        Spacer()
                    }
                    HStack(spacing: 10) {
                        Text(self.data.teacher)
                            .font(.callout)
                            .font(.system(size: 12))
                            .foregroundColor(.gray)
                            .padding([.leading, .trailing])
                        Text(self.data.time)
                            .font(.callout)
                            .font(.system(size: 12))
                            .foregroundColor(.gray)
                            .padding([.leading, .trailing])
                        Spacer()
                    }
                }
                Text(self.data.clas)
                .padding([.leading, .trailing])
                .font(.headline)
                .font(.system(size: 12))
            }
            Divider()
        }
    }
}
struct INBO_Time_UnEven: View {
    
    var data1 : TimeTable1
    
    var body: some View {
        
        VStack {
            HStack {
                VStack(spacing: 10){
                    HStack {
                    Text(self.data1.subject_name)
                        .font(.title)
                        .foregroundColor(.blue)
                        .padding([.leading, .trailing])
                        Spacer()
                    }
                    HStack {
                        Text(self.data1.teacher)
                            .font(.callout)
                            .font(.system(size: 12))
                            .foregroundColor(.gray)
                            .padding([.leading, .trailing])
                        Text(self.data1.time)
                            .font(.callout)
                            .font(.system(size: 12))
                            .foregroundColor(.gray)
                            .padding([.leading, .trailing])
                        Spacer()
                    }
                }
                Text(self.data1.clas)
                .padding([.leading, .trailing])
                .font(.headline)
                .foregroundColor(.black)
                .font(.system(size: 12))
            }
            Divider()
        }
    }
}
struct INBO_Matan1: View{
    @Environment(\.presentationMode) var PresentMaterial
    @State var matan1Url = Bundle.main.url(forResource: "matan1sem", withExtension: "pdf")!
    var body: some View {
        VStack {
            HStack {
            HStack(spacing: 5){
                Image(systemName: "arrow.left")
                    .resizable()
                    .frame(width: 10, height: 10)
                    .foregroundColor(.blue)
                Button(action:{
                    self.PresentMaterial.wrappedValue.dismiss()
                }){
                    Text("Назад")
                        .foregroundColor(.blue)
                        .fontWeight(.light)
                }
                }.padding(8)
                Spacer()
            }
            PDFKitView(url: self.matan1Url)
        }
        .navigationBarTitle("",displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}
struct INBO_Matan2: View{
    @Environment(\.presentationMode) var PresentMaterial1
    @State var matan2Url = Bundle.main.url(forResource: "matan2sem", withExtension: "pdf")!
    var body: some View {
        VStack {
            HStack {
            HStack(spacing: 5){
                Image(systemName: "arrow.left")
                    .resizable()
                    .frame(width: 10, height: 10)
                    .foregroundColor(.blue)
                Button(action:{
                    self.PresentMaterial1.wrappedValue.dismiss()
                }){
                    Text("Назад")
                        .foregroundColor(.blue)
                        .fontWeight(.light)
                }
                }.padding(8)
                Spacer()
            }
            PDFKitView(url: self.matan2Url)
        }
        .navigationBarTitle("",displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}
struct INBO_Linal1: View{
    @Environment(\.presentationMode) var PresentMaterial2
    @State var linal1Url = Bundle.main.url(forResource: "linal1sem", withExtension: "pdf")!
    var body: some View {
        VStack {
            HStack {
            HStack(spacing: 5){
                Image(systemName: "arrow.left")
                    .resizable()
                    .frame(width: 10, height: 10)
                    .foregroundColor(.blue)
                Button(action:{
                    self.PresentMaterial2.wrappedValue.dismiss()
                }){
                    Text("Назад")
                        .foregroundColor(.blue)
                        .fontWeight(.light)
                }
                }.padding(8)
                Spacer()
            }
            PDFKitView(url: self.linal1Url)
        }
        .navigationBarTitle("",displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}
struct INBO_Linal2: View{
    @Environment(\.presentationMode) var PresentMaterial3
    @State var linal2Url = Bundle.main.url(forResource: "linal2sem", withExtension: "pdf")!
    var body: some View {
        VStack {
            HStack {
            HStack(spacing: 5){
                Image(systemName: "arrow.left")
                    .resizable()
                    .frame(width: 10, height: 10)
                    .foregroundColor(.blue)
                Button(action:{
                    self.PresentMaterial3.wrappedValue.dismiss()
                }){
                    Text("Назад")
                        .foregroundColor(.blue)
                        .fontWeight(.light)
                }
                }.padding(8)
                Spacer()
            }
            PDFKitView(url: self.linal2Url)
        }
        .navigationBarTitle("",displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}
// All Other Views...
struct Inbo : View {
    @Environment(\.presentationMode) var Present
    var body: some View {
        VStack(spacing: 15) {
            HStack {
            HStack(spacing: 5){
                Image(systemName: "arrow.left")
                    .resizable()
                    .frame(width: 10, height: 10)
                    .foregroundColor(.blue)
                Button(action:{
                    self.Present.wrappedValue.dismiss()
                }){
                    Text("Назад")
                        .foregroundColor(.blue)
                        .fontWeight(.light)
                }
                }.padding(8)
                Spacer()
            }
            HStack {
                Text("Предметы")
                    .font(.title)
            }
            ScrollView(.vertical, showsIndicators: false) {
            HStack {
                Text("Математический анализ 1-ый семестр")
                    .font(.system(size: 16))
                    .font(.callout)
                Spacer()
                NavigationLink(destination: INBO_Matan1()){
                    Image(systemName: "arrow.right")
                        .resizable()
                        .frame(width: 15, height: 15)
                }.padding(8)
                }.padding(8)
            Divider()
            HStack {
                Text("Математический анализ 2-ой семестр")
                    .font(.system(size: 16))
                    .font(.callout)
                Spacer()
                NavigationLink(destination: INBO_Matan2()){
                    Image(systemName: "arrow.right")
                        .resizable()
                        .frame(width: 15, height: 15)
                }.padding(8)
            }.padding(8)
            Divider()
                HStack {
                    Text("Линейная алгебра 1-ый семестр")
                        .font(.system(size: 16))
                        .font(.callout)
                    Spacer()
                    NavigationLink(destination: INBO_Linal1()){
                        Image(systemName: "arrow.right")
                            .resizable()
                            .frame(width: 15, height: 15)
                    }.padding(8)
                }.padding(8)
                Divider()
                
                HStack {
                    Text("Линейная алгебра 2-ой семестр")
                        .font(.system(size: 16))
                        .font(.callout)
                    Spacer()
                    NavigationLink(destination: INBO_Linal2()){
                        Image(systemName: "arrow.right")
                            .resizable()
                            .frame(width: 15, height: 15)
                    }.padding(8)
                }.padding(8)
                Divider()
            }
        }
        .navigationBarTitle("",displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}
struct News : View {
    
    var body: some View{
        WebView(url: "https://www.mirea.ru/news/")
    }
}
struct Search : View {
    
    var body: some View{
        
        VStack{
            ScrollView(.vertical, showsIndicators: false) {
            HStack {
                Text("Лекционные аудитории")
                    .font(.system(size: 16))
                    .font(.callout)
                Spacer()
                NavigationLink(destination: Lectures()){
                    Image(systemName: "arrow.right")
                        .resizable()
                        .frame(width: 15, height: 15)
                }.padding(8)
                }.padding(8)
            Divider()
                HStack {
                    Text("Лабораторные аудитории")
                        .font(.system(size: 16))
                        .font(.callout)
                    Spacer()
                    NavigationLink(destination: Lectures()){
                        Image(systemName: "arrow.right")
                            .resizable()
                            .frame(width: 15, height: 15)
                    }.padding(8)
                    }.padding(8)
                Divider()
            }
        }
    }
}
struct Lectures: View{
    @Environment(\.presentationMode) var PresentClass
    @State var linal1Url = Bundle.main.url(forResource: "linal1sem", withExtension: "pdf")!
    @State var show = false
    @State var offset : CGFloat = UIScreen.main.bounds.height
    var body: some View {
        ZStack {
        VStack {
            HStack {
            HStack(spacing: 5){
                Image(systemName: "arrow.left")
                    .resizable()
                    .frame(width: 10, height: 10)
                    .foregroundColor(.blue)
                Button(action:{
                    self.PresentClass.wrappedValue.dismiss()
                }){
                    Text("Назад")
                        .foregroundColor(.blue)
                        .fontWeight(.light)
                }
                }.padding(8)
                Spacer()
            }
            ScrollView(.vertical, showsIndicators: false) {
            HStack {
                Text("А-18")
                    .font(.system(size: 16))
                    .font(.callout)
                Spacer()
                
                Button(action: {
                    self.offset = 0
                }){
                    Image(systemName: "arrow.right")
                        .resizable()
                        .frame(width: 15, height: 15)
                }.padding(8)
                }.padding(8)
            Divider()
            }
        }
        .navigationBarTitle("",displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
            VStack{
                
                Spacer()
                
                CustomActionSheet()
                .offset(y: self.offset)
                .gesture(DragGesture()
                
                    .onChanged({ (value) in
                        
                        if value.translation.height > 0{
                            
                            self.offset = value.location.y
                            
                        }
                    })
                    .onEnded({ (value) in
                        
                        if self.offset > 100{
                            
                            self.offset = UIScreen.main.bounds.height
                        }
                        else{
                            
                            self.offset = 0
                        }
                    })
                )
                
            }.background((self.offset <= 100 ? Color(UIColor.label).opacity(0.3) : Color.clear).edgesIgnoringSafeArea(.all)
                .onTapGesture {
                
                self.offset = 0
                
            })
            
            .edgesIgnoringSafeArea(.bottom)
            
    }.animation(.default)
    }
}
struct Favourites : View {
    
    var body: some View{
        
        VStack{
            
            Text("Favourites")
        }
    }
}
struct CustomActionSheet : View {
    var body : some View{
        
        VStack(spacing: 15){
            WebView(url: "https://sun9-38.userapi.com/c840133/v840133562/25b60/4NOqiOgNOxU.jpg")
            .frame(width: 250, height: 250)
            HStack {
                Text("Корпус А, 3 этаж.Подниматься по главной лестнице, потом налево.")
                    .font(.callout)
                    .font(.system(size: 14))
                Spacer()
            }
            
        }.padding(.bottom, (UIApplication.shared.windows.last?.safeAreaInsets.bottom)! + 10)
        .padding(.horizontal)
        .padding(.top,20)
        .background(Color(UIColor.systemBackground))
        .cornerRadius(25)
        
    }
}
struct Topbar : View {
    
    @Binding var selected : Int
    
    var body : some View{
        
        HStack{
            
            Button(action: {
                
                self.selected = 0
                
            }) {
                
                Image(systemName: "1.circle.fill")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .padding(.vertical,12)
                    .padding(.horizontal,30)
                    .background(self.selected == 0 ? Color.white : Color.clear)
                    .clipShape(Capsule())
            }
            .foregroundColor(self.selected == 0 ? .blue : .gray)
            
            Button(action: {
                
                self.selected = 1
                
            }) {
                
                Image(systemName: "2.circle.fill")
                .resizable()
                .frame(width: 25, height: 25)
                .padding(.vertical,12)
                .padding(.horizontal,30)
                .background(self.selected == 1 ? Color.white : Color.clear)
                .clipShape(Capsule())
            }
            .foregroundColor(self.selected == 1 ? .blue : .gray)
            
            }.padding(8)
            
            .clipShape(Capsule())
            .animation(.default)
    }
}
struct Add : View {
    
    @State var edit = false
        @State var show = false
        @EnvironmentObject var obs : observer
        @State var selected : type = .init(id: "", title: "", msg: "", time: "", day: "")
        
        var body: some View {
            
            
            ZStack{
                
                Color("Menu").opacity(0.2).edgesIgnoringSafeArea(.bottom)
                
                VStack{
                    
                    VStack(spacing : 5){
                        
                        HStack{
                            
                            Text("Заметки").font(.largeTitle).fontWeight(.heavy)
                            
                            Spacer()
                            
                            Button(action: {
                                
                                self.edit.toggle()
                                
                            }) {
                                
                                Text(self.edit ? "Готово" : "Изменить")
                            }
                            
                        }.padding([.leading,.trailing], 15)
                        .padding(.top, 10)
                        
                        Button(action: {
                            
                            self.selected = type(id: "", title: "", msg: "", time: "", day: "")
                            self.show.toggle()
                            
                        }) {
                            
                            Image(systemName: "plus").resizable().frame(width: 25, height: 25).padding()
                            
                        }.foregroundColor(.white)
                        .background(Color.red)
                        .clipShape(Circle())
                        .padding(.bottom, -15)
                        .offset(y: 15)
                        
                        
                    }.background(Rounded().fill(Color.white))
                    
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        VStack(spacing: 10){
                            
                            ForEach(self.obs.datas){i in
                                
                                cellview(edit: self.edit, data: i).onTapGesture {
    
                                    self.selected = i
                                    self.show.toggle()
    
                                }.environmentObject(self.obs)
                            }
                            
                        }.padding()
                        
                    }.padding(.top, 30)
                    
                }.sheet(isPresented: $show) {
                    
                    SaveView(show: self.$show, data: self.selected).environmentObject(self.obs)
                }
                
            }
    }
}
struct Rounded : Shape {
    
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.bottomLeft,.bottomRight], cornerRadii: CGSize(width: 25, height: 25))
        
        return Path(path.cgPath)
    }
}

struct cellview : View {
    
    var edit : Bool
    var data : type
    @EnvironmentObject var obs : observer
    
    var body : some View{
        
        HStack{
            
            if edit{
                
                Button(action: {
                    
                    if self.data.id != ""{
                        
                        self.obs.delete(id: self.data.id)
                    }
                    
                }) {
                    
                    Image(systemName: "minus.circle").font(.title)
                    
                }.foregroundColor(.red)
            }
            
            Text(data.title).lineLimit(1)
            
            Spacer()
            
            VStack(alignment: .leading,spacing : 5){
                
                Text(data.day)
                Text(data.time)
            }
        }.padding()
        .background(RoundedRectangle(cornerRadius: 25).fill(Color.white))
        .animation(.spring())
        
    }
}

struct SaveView : View {
    
    @State var msg = ""
    @State var title = ""
    @Binding var show : Bool
    @EnvironmentObject var obs : observer
    var data : type
    
    var body : some View{
        
        VStack(spacing : 12){
            
            HStack{
                
                Spacer()
                
                Button(action: {
                    
                    if self.data.id != ""{
                        
                        self.obs.update(id: self.data.id, msg: self.msg, title: self.title)
                    }
                    else{
                        
                         self.obs.add(title: self.title, msg: self.msg, date: Date())
                    }
                   
                    self.show.toggle()
                    
                }) {
                    
                    Text("Сохранить")
                }
            }
            
            TextField("Название, детали писать ниже", text: $title)
            
            Divider()
            
            multiline(txt: $msg)
            
        }.padding()
        .onAppear {
        
            self.msg = self.data.msg
            self.title = self.data.title
                
        }
    }
}

struct multiline : UIViewRepresentable {
    
    
    @Binding var txt : String
    
    func makeCoordinator() -> multiline.Coordinator {
        
        return multiline.Coordinator(parent1: self)
        
    }
    func makeUIView(context: UIViewRepresentableContext<multiline>) -> UITextView{
        
        let textview = UITextView()
        textview.font = .systemFont(ofSize: 18)
        textview.delegate = context.coordinator
        return textview
    }
    
    func updateUIView(_ uiView: UITextView, context: UIViewRepresentableContext<multiline>) {
        
        uiView.text = txt
    }
    
    class Coordinator : NSObject,UITextViewDelegate{
        
        var parent : multiline
        
        init(parent1 : multiline) {
            
            parent = parent1
        }
        
        func textViewDidChange(_ textView: UITextView) {
            
            self.parent.txt = textView.text
        }
    }
}

struct type : Identifiable {
    
    var id : String
    var title : String
    var msg : String
    var time : String
    var day : String
}

class observer : ObservableObject{
    
    @Published var datas = [type]()
    
    init() {
        
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        
        let req = NSFetchRequest<NSFetchRequestResult>(entityName: "Todo")
        
        do{
            
            let res = try context.fetch(req)
            
            for i in  res as! [NSManagedObject]{
                
                let msg = i.value(forKey: "msg") as! String
                let title = i.value(forKey: "title") as! String
                let time = i.value(forKey: "time") as! String
                let day = i.value(forKey: "day") as! String
                let id = i.value(forKey: "id") as! String
                
                self.datas.append(type(id: id, title: title, msg: msg, time: time, day: day))
            }
        }
        catch{
            
            print(error.localizedDescription)
        }
        
    }
    
    func add(title : String,msg: String,date: Date){
        
        
        let format = DateFormatter()
        format.dateFormat = "dd/MM/YY"
        let day = format.string(from: date)
        format.dateFormat = "hh:mm a"
        let time = format.string(from: date)
        
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        let entity = NSEntityDescription.insertNewObject(forEntityName: "Todo", into: context)
        entity.setValue(msg, forKey: "msg")
        entity.setValue(title, forKey: "title")
        entity.setValue("\(date.timeIntervalSince1970)", forKey: "id")
        entity.setValue(time, forKey: "time")
        entity.setValue(day, forKey: "day")
        
        do{
            
            try context.save()
            self.datas.append(type(id: "\(date.timeIntervalSince1970)", title: title, msg: msg, time: time, day: day))
        }
        catch{
            
            print(error.localizedDescription)
        }
    }
    
    func delete(id : String){
        
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        
        let req = NSFetchRequest<NSFetchRequestResult>(entityName: "Todo")
        
        do{
            
            let res = try context.fetch(req)
            
            for i in  res as! [NSManagedObject]{
                
                if i.value(forKey: "id") as! String == id{
                    
                    context.delete(i)
                    try context.save()
                    
                    for i in 0..<datas.count{
                        
                        if datas[i].id == id{
                            
                            datas.remove(at: i)
                            return
                            
                        }
                    }
                }
            }
        }
        catch{
            
            print(error.localizedDescription)
        }
    }
    
    func update(id : String,msg: String,title : String){
        
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        
        let req = NSFetchRequest<NSFetchRequestResult>(entityName: "Todo")
        
        do{
            
            let res = try context.fetch(req)
            
            for i in  res as! [NSManagedObject]{
                
                if i.value(forKey: "id") as! String == id{
                    
                    i.setValue(msg, forKey: "msg")
                    i.setValue(title, forKey: "title")
                    
                    try context.save()
                    
                    for i in 0..<datas.count{
                        
                        if datas[i].id == id{
                            
                            datas[i].msg = msg
                            datas[i].title = title
                            
                        }
                    }
                }
            }
        }
        catch{
            
            print(error.localizedDescription)
        }
    }
}
