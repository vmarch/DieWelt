//
//  ContentView.swift
//  DieWelt
//
//  Created by devtolife on 14.09.21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var dc:DataController
    
    init() {
        // this is not the same as manipulating the proxy directly
        let coloredAppearance = UINavigationBarAppearance()
        
        // this overrides everything you have set up earlier.
        coloredAppearance.configureWithTransparentBackground()
        //  coloredAppearance.backgroundColor = .green
        coloredAppearance.titleTextAttributes = [.font : UIFont.systemFont(ofSize: 28, weight: .bold),.foregroundColor : UIColor.white]
        coloredAppearance.largeTitleTextAttributes = [.font : UIFont.systemFont(ofSize: 28, weight: .bold),.foregroundColor: UIColor.black]
        
        //In the following two lines you make sure that you apply the style for good
        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
        
        // This property is not present on the UINavigationBarAppearance
        // object for some reason and you have to leave it til the end
        UINavigationBar.appearance().tintColor = .white
    }
    
    var body: some View {
            ZStack{
                Color("BlueMarine").ignoresSafeArea()
                
                VStack(){
                    
                    ScrollView (.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(0..<10) { i in
                                Text("Item \(i)")
                                    .foregroundColor(Color.white)
                                Divider().background(Color.white)
                            }
                        }
                    }.frame(height: 36)
                    
                    if(dc.isSearchActive){
                        SearchView()
                            .padding(.horizontal, 8)
                            .transition(.move(edge: .trailing))
                            .animation(.linear)
                    }
                    
                    if(dc.lookingAs == .grid){
                        Text("Create GridView")
                    }else{
                        
                        List(dc.aDataFiltered){ article in
                            NavigationLink(destination: DetailView(article: article), label: {
                                
                                VStack(spacing: 8){
                                    Image(uiImage: ImageLoader().loadImageFromURL(str: article.image))
                                        .resizable()
                                        .scaledToFill()
                                        .padding(.vertical, 4)
                                    HStack{
                                        
                                        Text("\(article.categorie)")
                                            .fontWeight(.bold)
                                            .font(.system(size: 16, weight: .medium))
                                            .underline(true, color: .yellow)
                                            .textCase(.uppercase)
                                        
                                            .foregroundColor(Color("BlueMarine"))
                                        Text(article.subline)
                                            .font(.subheadline)
                                            .lineLimit(2)
                                            .minimumScaleFactor(0.7)
                                            .foregroundColor(.secondary)
                                        Spacer()                                        
                                    }
                                    Text(article.headline)
                                        .fontWeight(.bold)
                                        .font(.system(size: 26, weight: .medium))
                                    //.lineLimit(1)
                                        .minimumScaleFactor(0.8)
                                    Text(article.textmessage)
                                        .lineLimit(8)
                                }.padding(.vertical, 16)
                            }
                            )
                        }.onAppear {
                            self.dc.loadData()
                        }
                    }
                }
            }
            .navigationBarTitle("Die Welt", displayMode: .inline)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(trailing:
                                    HStack{
                Button(action: {
                  self.dc.isSearchActive.toggle()
                }, label: {
                    if(self.dc.searchText == ""){
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.white)
                            .frame(height: 20)
                    }else{
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.yellow)
                            .frame(height: 20)
                    }
                }
                )
            }
            )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        NavigationView{
            ContentView()
        }.environmentObject(DataController())
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
